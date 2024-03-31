import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventAddController extends GetxController {
  GlobalKey<FormState> eventKey = GlobalKey<FormState>();

  final eventNameController = TextEditingController();
  final eventDateController = TextEditingController();

  final eventTimeController = TextEditingController();

  final eventTypeController = TextEditingController();

  final eventGuestsNoController = TextEditingController();

  final eventVenueController = TextEditingController();

  final eventPriceController = TextEditingController();

  final eventDescriptionController = TextEditingController();
}
