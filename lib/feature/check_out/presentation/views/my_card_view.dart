import 'package:flutter/material.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/my_card_view_body.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/assets.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: SvgPicture.asset(
            AssetsConstants.arrowSVG,
          ),
        ),
        title: const Text(
          'My Cart',
        ),
      ),
      body:const MyCardViewBody() ,
    );
  }
}
