// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables, avoid_unnecessary_containers


//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class WelcomePage extends StatelessWidget{

  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const CustomizedTextWidget(
              label: "ST4&&Y",
              labelsColor: textingGray,
              fontWeight: FontWeight.bold,
              fontSize: 40
          ),
        ),
        backgroundColor: paleGreen,
        foregroundColor: textingWhite,
      ),
      body: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/starbackground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomizedTextWidget(
                      label: "Constellations & Products",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    SizedBox (
                      height:30,
                    ),
                    Image.asset("assets/images/redstar.jpg",
                        height: 200, width: 200),
                    CustomizedTextWidget(
                      label: "Welcome to ST4&&Y!",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    CustomizedTextWidget(
                      label: "Enjoy this chance to learn about the stars...",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    CustomizedTextWidget(
                      label: "Click either icon below to explore constellations or products to view them in real life.",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    Container(
                      child:GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 30,
                        children: [
                          itemsDashboard(
                            title: "Stars",
                            iconData: Icons.star_border_outlined,
                            background: Colors.black,
                            unAction: () => Get.toNamed("stars"),
                          ),
                          itemsDashboard(
                            title: "Products/Tools",
                            iconData: Icons.shop_rounded,
                            background: Colors.blue,
                            unAction: () => Get.toNamed("/produits"),
                          ),
                        ]
                    ),
                    ),
                     
                  ]),
            ),
          ),
        ),
      ),
    );
  }
  
  itemsDashboard(
          {required String title,
          IconData? iconData,
          Color? background,
          VoidCallback? unAction}) =>
      Container(
        decoration: BoxDecoration(
            color: textingWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 5),
                color: textingWhite.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: unAction,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: textingWhite),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(title.toUpperCase(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      );

}