import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final  TextEditingController controller;
  final bool isobsecureText;
  const AuthField({super.key, required this.hintText, required this.controller, this.isobsecureText=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
decoration: InputDecoration(
  hintText: hintText
),
controller: controller,
validator: (value){
  if(value!.isEmpty){
    return ' $hintText is missing !';
  }
  return null;
},
obscureText: isobsecureText,
obscuringCharacter: '*',
    );
  }
}