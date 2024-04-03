import 'package:event/core/controllers/core_controller.dart';
import 'package:event/core/model/event/event_model.dart';
import 'package:event/core/repo/event/event_repo.dart';
import 'package:event/core/utils/helpers/log_helper.dart';
import 'package:event/core/widgets/custom/app_progress_dialog.dart';
import 'package:event/core/widgets/custom/app_snackbar.dart';
import 'package:event/features/screens/events/event_booking_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController {
  final coreController = Get.find<CoreController>();
  Rxn<EventModel> event = Rxn();

  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null) {
      event.value = args['event'];
    }
    super.onInit();
  }

  void getEventDetail() async {
    print(event.value?.id);
    if (event.value?.id != null) {
      EventRepo.getEventDetails(
        eventId: event.value!.id!,
        onSuccess: (event) {
          this.event.value = event;

          print("-----------------------${event}");
        },
        onError: (message) {
          LogHelper.error(message);
        },
      );
    } else {
      GearSnackBar.error(
          title: "Error Occurred",
          message: "Something went wrong while fetching detail page");
    }
  }

  openBookingBootomSheet() {
    price.value = int.parse(event.value?.publicSeatsPrice ?? '0');
    showModalBottomSheet(
      isScrollControlled: true,
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BookingEventBottomSheet(
              // onSelectVenue: (venueType) {
              //   eventVenueController.text = venueType;
              // },
              ),
        );
      },
    );
  }

  RxInt itemQuantity = RxInt(1);

  RxInt price = RxInt(0);

  RxString selectedTicketType = RxString("Public");

  void incrementQuantity() {
    itemQuantity.value++;
    calculatePrice();
  }

  void decrementQuantity() {
    if (itemQuantity.value > 1) {
      itemQuantity.value--;
      calculatePrice();
    }
  }

  void changeTicketType(String? ticketType) {
    selectedTicketType.value = ticketType ?? "Public";
    calculatePrice();
  }

  void calculatePrice() {
    if (selectedTicketType.value == "Public") {
      price.value =
          int.parse(event.value?.publicSeatsPrice ?? '0') * itemQuantity.value;
    } else {
      price.value =
          int.parse(event.value?.vipSeatsPrice ?? '0') * itemQuantity.value;
    }
  }

  ProgressDialog loading = ProgressDialog();

  Future<void> bookEvent() async {
    loading.show();
    await EventRepo.bookEvent(
        eventId: event.value!.id!.toString(),
        quantity: itemQuantity.value.toString(),
        ticketType: selectedTicketType.value,
        price: price.value.toString(),
        onSuccess: (message) {
          loading.hide();
          Get.back();
          GearSnackBar.success(title: "Organizer", message: message);
        },
        onError: (message) {
          loading.hide();
          GearSnackBar.error(title: "Organizer", message: message);
        });
  }
}
