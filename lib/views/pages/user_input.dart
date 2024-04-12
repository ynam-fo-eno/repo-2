// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';

class UserProposals extends StatelessWidget {
  const UserProposals({super.key});

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
                  label: "You can make comments here: ",
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
