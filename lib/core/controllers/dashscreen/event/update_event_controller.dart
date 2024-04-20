import 'dart:io';

import 'package:event/core/utils/constants/apis.dart';
import 'package:event/core/utils/helpers/xosial_date_piceker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/event/event_model.dart';

class UpdateEventController extends GetxController {
  GlobalKey<FormState> updateEventKey = GlobalKey<FormState>();
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

  Rxn<EventModel> event = Rxn();
  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null) {
      event.value = args['event'];
    }
    onLoading();
    super.onInit();
  }

  onLoading() {
    eventNameController.text = event.value?.eventTitle ?? "";
    eventDateController.text = event.value?.eventDate ?? "";
    eventTimeController.text = event.value?.eventTime ?? "";
    // eventTypeController.text = event.value?.
    eventVenueController.text = event.value?.location ?? "";
    eventVipPriceController.text = event.value?.vipSeatsPrice ?? "";
    eventPublicPriceController.text = event.value?.publicSeatsPrice ?? "";
    eventDescriptionController.text = event.value?.description ?? "";
    totalSeatsController.text = event.value?.totalSeats ?? "";
    totalVipSeatsController.text = event.value?.totalVipSeats ?? "";
    totalPublicseatsController.text = event.value?.totalPublicSeats ?? "";

    // String? thumbnail = event.value?.thumbnail;
    // if (thumbnail != null) {
    //   // Concatenate the base URL with the thumbnail path
    //   String imageUrlWithThumbnail = '${Api.imageUpdateUrl}$thumbnail';
    //   // Assign the constructed URL to pickedFile.value
    //   pickedFile.value = File(imageUrlWithThumbnail);
    // }
    // ------------------

    // pickedFile.value = event.value?.thumbnail ?? "";

    final String? thumbnail = event.value?.thumbnail;
    if (thumbnail != null) {
      // Construct full URL for the thumbnail
      final String fullUrl = Api.imageUpdateUrl + thumbnail;
      // Assign the full URL to pickedFile.value
      pickedFile.value = File(fullUrl);
    }
  }

  // imageUrl: "${Api.imageUrl}${eventModel.thumbnail}",
  // String imageUrl = Api.imageUpdateUrl;

  onCalculateTotalSeat() {
    var totalSeat = int.parse(totalPublicseatsController.text) +
        int.parse(totalVipSeatsController.text);

    totalSeatsController.text = totalSeat.toString();
  }

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

  final Rx<File?> pickedFile = Rx<File?>(null);

  // Your other controller code...

  Future<void> pickImage(XFile imageFile) async {
    pickedFile.value = File(imageFile.path);
  }
}
