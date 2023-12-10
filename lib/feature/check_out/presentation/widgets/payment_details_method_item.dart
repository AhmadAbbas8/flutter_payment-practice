import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class PaymentDetailsMethodItem extends StatelessWidget {
  const PaymentDetailsMethodItem({super.key, required this.isActive, required this.imagePath});

  final bool isActive;final String imagePath ;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.50,
              color:
                  isActive ? const Color(0xFF34A853) : Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? const Color(0xFF34A853) : Colors.white,
            blurRadius: 4,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      duration: const Duration(milliseconds: 800),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.50, color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            height: 40,
          ),
        ),
      ),
    );
  }
}
