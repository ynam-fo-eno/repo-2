// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
   const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const CustomizedTextWidget(
              label: "ST4&&Y",
              labelsColor: textingGray,
              fontWeight: FontWeight.bold,
              fontSize: 40),
        ),
        backgroundColor: paleGreen,
        foregroundColor: textingWhite,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   CustomizedTextWidget(
                  label: "Orders & User Input",
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                  Image.asset("assets/images/bluestar.jpg",
                      height: 200, width: 200),
                 
                   CustomizedTextWidget(
                  label:"This is where you can either make orders or give input on info you found here.Click either icon below to do so.",
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                Container(
                  child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 30,
                      children: [
                        itemsDashboard(
                          title: "Your Input",
                          iconData: Icons.abc,
                          background: Colors.purple,
                          unAction: () => Get.toNamed("/user_input"),
                        ),
                        itemsDashboard(
                          title: "Orders",
                          iconData: Icons.punch_clock_rounded,
                          background: Colors.purple,
                          unAction: () => Get.toNamed("/les_ordres"),
                        ),
                      ]),
                ),
                ],
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