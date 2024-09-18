import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradiantButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
   AuthGradiantButton({super.key, required this.buttonText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppPallete.gradient1,
          AppPallete.gradient2,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topLeft),
        borderRadius: BorderRadius.circular(7)
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor,
          fixedSize: Size(395, 55)
        ),
        child: Text(buttonText,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
      ),
    );
  }
}
