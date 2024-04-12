// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sort_child_properties_last, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/logincontroller.dart';
import 'package:flutter_application_0/controllers/produit_controller.dart';
import 'package:flutter_application_0/models/goods_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var lesNoms = [
  "Telescope",
  "Tent",
];

ProductController productController = Get.put(ProductController());
LoginController loginController = Get.put(LoginController());

class Produits extends StatelessWidget {
  const Produits({super.key});

  @override
  Widget build(BuildContext context) {
    productDisplay();
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          itemCount: ((productController.productList.length) + 0),
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
                        "http://localhost/php-attempt1/product_images/${productController.productList[index].image}",
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
                                productController.productList[index].p_name,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.purple,
                                  backgroundColor: textingGray,
                                ),
                              ),
                              //Spacer(),
                              Text(
                                productController.productList[index].p_descr,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textingWhite,
                                  backgroundColor: textingGray,
                                ),
                                maxLines: 3,
                              ),
                              //Spacer(),
                              Text(
                                productController.productList[index].price,
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
                      SizedBox(height: 5),
                      MaterialButton(
                        onPressed: () {
                          makeOrder(productController.productList[index].id,
                              productController.productList[index].price);
                        },
                        child: Text("Order"),
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

  Future<void> productDisplay() async {
    http.Response reponse = await http
        .get(Uri.parse("http://localhost/php-attempt1/display_products.php"));
    if (reponse.statusCode == 200) {
      var serverResponse = json.decode(reponse.body);
      var productResponse = serverResponse["st4&&y_products"];
      var produitList = productResponse
          .map((product) => ProductModel.fromJson(product))
          .toList();
      productController.updateProductList(produitList);
    } else {
      Text("Error");
    }
  }

  Future<void> makeOrder(id, price) async {
    http.Response reponse;
    var body = {
      "product_id": "$id",
      "amount": "$price",
      "user_id": "${loginController.email.value}",
      //Need to figure out mbona email haitumwi kwa db. (assuming the rest works) [Solved!]
      //Done! Thank God. Seems I was to treat all three parameters
      //in the body below as PHP-like strings preceded by $.
      //Seeems counterintuitive to me here in Flutter, but then again that's what the boss was doing right?
      //:)
    };

    reponse = await http.post(
        Uri.parse(
        "http://localhost/php-attempt1/make_order.php"
        ),
        body: body
    );
    if (reponse.statusCode == 200) {
      var data = json.decode(reponse.body);
      int orderStatus = data["Success!"];
      if (orderStatus == 1) {
        Fluttertoast.showToast(
            msg: "Order was successful!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } 
    else {
      Fluttertoast.showToast(
            msg: "Order wasn't quite successful.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
    }
  }
}
