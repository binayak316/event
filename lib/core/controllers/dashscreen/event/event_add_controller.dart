import 'dart:io';

import 'package:event/core/model/event/add_event_request_model.dart';
import 'package:event/core/repo/event/event_repo.dart';
import 'package:event/core/utils/helpers/xosial_date_piceker.dart';
import 'package:event/core/widgets/custom/app_progress_dialog.dart';
import 'package:event/core/widgets/custom/app_snackbar.dart';
import 'package:event/features/screens/add_event/show_venue_type_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EventAddController extends GetxController {
  GlobalKey<FormState> eventKey = GlobalKey<FormState>();

  final eventNameController = TextEditingController();
  final eventDateController = TextEditingController();

  final eventTimeController = TextEditingController();

  final eventTypeController = TextEditingController();

  final eventGuestsNoController = TextEditingController();

  final eventVenueController = TextEditingController();

  final eventVipPriceController = TextEditingController();
  final eventPublicPriceController = TextEditingController();

  final totalSeatsController = TextEditingController();

  final totalVipSeatsController = TextEditingController();

  final totalPublicseatsController = TextEditingController();

  final eventDescriptionController = TextEditingController();
  RxBool isDobHasData = RxBool(false);
  TimeOfDay time = TimeOfDay.now();

  void pickDate() {
    XosialDatePicker.pickDate(
      minDate: DateTime.now(),
      initialDate: DateTime.now(),
      maxDate: DateTime(
          DateTime.now().year + 1, DateTime.now().month, DateTime.now().day),
      onDone: (date) {
        isDobHasData.value = true;
        eventDateController.text = date.toString().split(" ")[0];
      },
    );
  }

  showVenueType() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: VenueTypeBottomSheet(
            onSelectVenueType: (venueType) {
              eventTypeController.text = venueType;
            },
          ),
        );
      },
    );
  }

  //pick image
  final Rx<File?> pickedFile = Rx<File?>(null);

  // Your other controller code...

  Future<void> pickImage(XFile imageFile) async {
    pickedFile.value = File(imageFile.path);
  }

  ProgressDialog loading = ProgressDialog();
  void clearVariables() {
    eventNameController.text = '';
    eventDateController.text = '';
    eventTimeController.text = '';
    // eventTypeController.text = '';
    pickedFile.value = null;
    eventVenueController.clear();
    eventVipPriceController.text = '';
    totalSeatsController.text = '';
    eventPublicPriceController.text = '';
    eventDescriptionController.text = '';
    totalVipSeatsController.text = '';
    totalPublicseatsController.text = '';
  }

  Future<void> onSubmit() async {
    if (eventKey.currentState!.validate()) {
      loading.show();
      AddEventRequestParams addEventRequestParams = AddEventRequestParams(
        eventTitle: eventNameController.text,
        eventDate: eventDateController.text,
        eventTime: eventTimeController.text,
        // evetType: eventTypeController.text,
        thumbnail: pickedFile.toString(),
        location: eventVenueController.text,
        vipSeatsPrice: eventVipPriceController.text,
        totalSeats: totalSeatsController.text,
        publicSeatsPrice: eventPublicPriceController.text,
        description: eventDescriptionController.text,
        totalVipSeats: totalVipSeatsController.text,
        totalPublicSeats: totalPublicseatsController.text,
      );
      await EventRepo.addEvent(
          addEventParams: addEventRequestParams,
          onSuccess: (message) {
            loading.hide();
            // Get.offAllNamed(DashPageManager.routeName);
            // Get.put(DashboardPanelController()).currentIndex.value =
            //     0; //TODO implementation
            clearVariables();
            GearSnackBar.success(
                title: "Add Event Success",
                message: "Event Added successfully");
          },
          onError: (message) {
            loading.hide();
            GearSnackBar.error(title: "Login Failed", message: message);
          });
    }
  }
}
