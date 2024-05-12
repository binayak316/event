import 'package:event/core/model/event/event_model.dart';
import 'package:event/core/model/event/my_booked_event_response_model.dart';
import 'package:get/get.dart';

class BookedEventDetailController extends GetxController {
  Rxn<MyBookedEventResponseModel> event = Rxn();

  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null) {
      event.value = args['event'];
    }
    super.onInit();
  }
}
