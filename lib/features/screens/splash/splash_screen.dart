import 'package:event/core/controllers/splash_controller.dart';
import 'package:event/core/utils/constants/icon_paths.dart';
import 'package:event/core/widgets/common/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash-screen';
  final c = Get.find<SplashController>();
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(IconPath.cupLogo),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Let us to handle your EVENT",
              style: CustomTextStyles.f16W600(color: AppColors.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
