import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.buttonName});
 final void Function()? onTap;
 final String buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
           buttonName,
            style: Styles.style22,
          ),
        ),
        decoration: ShapeDecoration(
          color: Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
