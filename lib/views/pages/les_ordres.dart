// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_string_interpolations, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/logincontroller.dart';
import 'package:flutter_application_0/controllers/order_controller.dart';
import 'package:flutter_application_0/controllers/produit_controller.dart';
//import 'package:flutter_application_0/models/goods_model.dart';
import 'package:flutter_application_0/models/order_model.dart';
//import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

ProductController productController = Get.put(ProductController());
LoginController loginController = Get.put(LoginController());
OrderController orderController = Get.put(OrderController());

class OrderTracker extends StatelessWidget {
  const OrderTracker({super.key});

  @override
  Widget build(BuildContext context) {
    orderDisplay();
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          itemCount: ((orderController.orderList.length) + 0),
          itemBuilder: (context, index) {
            return Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 150,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.network(
                        "http://localhost/php-attempt1/user_images/${orderController.orderList[index].photo}",
                        height: 100,
                        width: 100,
                      ),

                      //Image.network("${index + 1}. ${studentController.studentList[index].image}"),
                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${orderController.orderList[index].name_1} ${orderController.orderList[index].name_2}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.purple,
                                  backgroundColor: textingGray,
                                ),
                              ),
                              //Spacer(),
                              Text(
                                orderController.orderList[index].p_name,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textingWhite,
                                  backgroundColor: textingGray,
                                ),
                                maxLines: 3,
                              ),
                              Text(
                                "ORDER ID: ${orderController.orderList[index].order_id}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.purple,
                                  backgroundColor: textingGray,
                                ),
                              ),
                              //Spacer(),
                              Text(
                                orderController.orderList[index].amount,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.purple,
                                  backgroundColor: textingGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          omitOrder(
                            orderController.orderList[index].order_id,
                          );
                        },
                        child: Text("Cancel Order"),
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<void> orderDisplay() async {
    http.Response reponse = await http
        .get(Uri.parse("http://localhost/php-attempt1/pick_order.php"));
    if (reponse.statusCode == 200) {
      var serverResponse = json.decode(reponse.body);
      var productResponse = serverResponse["orders"];
      var ordreList =
          productResponse.map((order) => OrderModel.fromJson(order)).toList();
      orderController.updateOrderList(ordreList);
    } else {
      Text("Error");
    }
  }

  Future<void> omitOrder(order_id) async {
    http.Response reponse = await http.get(
      Uri.parse("http://localhost/php-attempt1/omit_order.php?order_id=$order_id"),
    );
    if (reponse.statusCode == 200) {
      orderDisplay();
    } else {
      Fluttertoast.showToast(
          msg: "Order  deletion wasn't quite successful.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
