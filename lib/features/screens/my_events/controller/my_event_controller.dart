import 'package:event/core/model/event/event_model.dart';
import 'package:event/core/repo/event/event_repo.dart';
import 'package:event/core/utils/constants/enums.dart';
import 'package:event/core/utils/helpers/log_helper.dart';
import 'package:get/get.dart';

class myEventController extends GetxController {
   RxList<EventModel> eventList = RxList();
  Rx<PageState> pageState = PageState.LOADING.obs;

  @override
  void onInit() {
    getMyEvents();

    // var args = Get.arguments;
    // if (args != null) {
    //   print("--------------------args=========${args}");
    //   event.value = args['event'];
    // }
    super.onInit();
  }


  void getMyEvents() async {
    eventList.clear();
    EventRepo.getAllMyEvents(
      onSuccess: (events) {
        if (events.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          eventList.addAll(events);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }
}
