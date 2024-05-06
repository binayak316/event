import 'package:event/core/repo/event/event_repo.dart';
import 'package:event/core/utils/constants/enums.dart';
import 'package:event/core/utils/helpers/log_helper.dart';
import 'package:event/features/screens/profile/faq_model.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  RxList<FAQModel> faqList = RxList();
  Rx<PageState> pageState = PageState.LOADING.obs;

  @override
  void onInit() {
    super.onInit();
    getFaqs();
  }

  void getFaqs() async {
    faqList.clear();
    EventRepo.getFaq(
      onSuccess: (faqs) {
        if (faqs.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          faqList.addAll(faqs);
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
