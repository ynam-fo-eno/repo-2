import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';

class CustomizedTextWidget extends StatelessWidget {
  final String label;
  final Color labelsColor;
  final double fontSize;
  final FontWeight fontWeight;
  const CustomizedTextWidget({
    super.key,
    required this.label,
    this.labelsColor = textingGray,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Text(
          label,
          style: TextStyle(
            color: labelsColor, 
            fontSize: fontSize,
          ),
        )
    ); 
  }
}
