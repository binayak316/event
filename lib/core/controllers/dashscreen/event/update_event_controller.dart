import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  Rxn<EventModel> event = Rxn();
  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null) {
      event.value = args['event'];
    }
    super.onInit();
  }
}
