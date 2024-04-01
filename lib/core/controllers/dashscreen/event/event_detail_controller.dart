import 'package:event/core/model/event/event_model.dart';
import 'package:event/core/repo/event/event_repo.dart';
import 'package:event/core/utils/helpers/log_helper.dart';
import 'package:event/core/widgets/custom/app_snackbar.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController {
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
}
