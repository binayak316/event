import 'package:event/core/model/event/event_model.dart';
import 'package:event/core/utils/constants/enums.dart';
import 'package:event/core/utils/helpers/log_helper.dart';
import 'package:get/get.dart';

import '../../../repo/event/event_repo.dart';

class MyBookedEventController extends GetxController {
  RxList<EventModel> bookedEventList = RxList();
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

  // RefreshController refreshController =
  //     RefreshController(initialRefresh: false);

  // void onRefresh() async {
  //   await Future.delayed(Duration(milliseconds: 200));
  //   getMyEvents();
  //   refreshController.refreshCompleted();
  // }

  void getMyEvents() async {
    bookedEventList.clear();
    EventRepo.bookedEvents(
      onSuccess: (events) {
        if (events.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          bookedEventList.addAll(events);
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
