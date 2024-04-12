// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback unAction;
  const CustomButton(
   {Key? key, required this.buttonText,required this.unAction}
    ) :
     super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 30),
            backgroundColor: buttonColor1,
            foregroundColor: textingWhite,
          ),
          onPressed: unAction,
          child: Text(buttonText),
        ),
        const SizedBox(height: 10),
      ],
    ));
  }
}
