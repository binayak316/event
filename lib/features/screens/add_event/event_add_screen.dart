import 'package:event/core/utils/constants/colors.dart';
import 'package:event/core/utils/helpers/validators.dart';
import 'package:event/core/widgets/common/button.dart';
import 'package:event/core/widgets/common/custom_text_style.dart';
import 'package:event/core/widgets/common/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/controllers/dashscreen/event/event_add_controller.dart';

class EventAddScreen extends StatelessWidget {
  static const String routeName = "/event-add-screen";
  final c = Get.find<EventAddController>();
  EventAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Add Your Event"),
        ),
        body: SingleChildScrollView(
          // physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 16, bottom: 100),
            child: Form(
              key: c.eventKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Event Name",
                    style:
                        CustomTextStyles.f16W400(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Event Name",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.checknameEmpty,
                    controller: c.eventNameController,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Event Date",
                    style:
                        CustomTextStyles.f16W400(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Event Date",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.checknameEmpty,
                    readOnly: true,
                    controller: c.eventDateController,
                    onTap: () {
                      print("here calendar");
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Event Time",
                    style:
                        CustomTextStyles.f16W400(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Event Time",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.checknameEmpty,
                    readOnly: true,
                    controller: c.eventTimeController,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Event Type",
                    style:
                        CustomTextStyles.f16W400(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Event Type",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    readOnly: true,
                    validator: Validators.checknameEmpty,
                    controller: c.eventTypeController,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Expected guest no.",
                    style:
                        CustomTextStyles.f16W400(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Expected guest no.", //text field no dropdown
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.checknameEmpty,
                    controller: c.eventGuestsNoController,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Select Veneu",
                    style:
                        CustomTextStyles.f16W400(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Select Venue",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.checknameEmpty,
                    controller: c.eventVenueController,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      print("open camera");
                    },
                    icon: Icon(Icons.camera),
                    label: Text("Choose image"),
                  ),
                  Text(
                    "Price",
                    style:
                        CustomTextStyles.f16W400(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Price",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.checknameEmpty,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: c.eventPriceController,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Description",
                    style:
                        CustomTextStyles.f16W400(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Description",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.checknameEmpty,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: c.eventDescriptionController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryElevatedButton(onPressed: () {}, title: "Add"),
                  // const SizedBox(
                  //   height: 50,
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
