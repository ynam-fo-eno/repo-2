import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';


class CustomTextField extends StatelessWidget{

  final TextEditingController? controller;
  final double fontSize;
  final String? hintMessage;
  final IconData? startIcon;
  final IconData? finishIcon;
  final bool obscured;
  final bool niPassword;

  const CustomTextField({
      super.key,
      this.controller,
      this.fontSize=18,
      this.hintMessage,
      this.startIcon,
      this.finishIcon,
      this.obscured =false,
      this.niPassword=false,
      
    }
    );
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscured,
      controller:controller,
      style: TextStyle(color: textingGray, fontSize: fontSize),
      
      decoration: InputDecoration(
        prefixIcon:Icon(startIcon),
        suffixIcon: niPassword?  const Icon(Icons.visibility)
        :
        const SizedBox(height:10,width:10),  
        label:  Text(hintMessage!),
        //hintText: hintMessage,
        enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
       ),
    )
  
      );
  } 
}