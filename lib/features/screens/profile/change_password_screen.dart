import 'package:event/core/controllers/dashscreen/profile/profile_controller.dart';
import 'package:event/core/utils/constants/colors.dart';
import 'package:event/core/utils/helpers/validators.dart';
import 'package:event/core/widgets/common/button.dart';
import 'package:event/core/widgets/common/custom_text_style.dart';
import 'package:event/core/widgets/common/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  final c = Get.find<ProfileController>();
  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          // height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: Form(
            key: c.resetPwKey,
            child: Column(
              children: [
                Obx(
                  () => PrimaryTextField(
                    hint: "Password",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    focusNode: c.passNode,
                    obscureText: !c.showPass.value,
                    eyeClick: c.onEyeClick,
                    controller: c.passwordController,
                    validator: Validators.checkPasswordField,
                    onSubmitted: (_) {
                      c.conPassNode.requestFocus();
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => PrimaryTextField(
                    hint: "Confirm Password",
                    focusNode: c.conPassNode,
                    obscureText: !c.showConPass.value,
                    eyeClick: c.onConEyeClick,
                    controller: c.passwordConfirmController,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      var checkPassword = Validators.checkPasswordField(value);
                      if (checkPassword != null) {
                        return checkPassword;
                      }

                      if (c.passwordController.text != value!) {
                        return "Password does not match";
                      }
                      return null;
                    },
                    // validator: Validators.checkPasswordField,
                  ),
                ),
                const SizedBox(height: 60),
                PrimaryElevatedButton(
                  onPressed: c.onSubmit,
                  title: "Change Password",
                  textStyle:
                      CustomTextStyles.f16W600(color: AppColors.whiteColor),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
