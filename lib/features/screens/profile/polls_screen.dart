import 'package:event/core/utils/constants/colors.dart';
import 'package:event/core/utils/constants/enums.dart';
import 'package:event/core/utils/constants/icon_paths.dart';
import 'package:event/core/widgets/common/custom_text_style.dart';
import 'package:event/core/widgets/common/empty_view.dart';
import 'package:event/core/widgets/common/error_view.dart';
import 'package:event/features/screens/profile/faqController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQScreen extends StatelessWidget {
  static const String routeName = "/faq-screen";
  final c = Get.find<FaqController>();
  FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "FAQ's",
          style: CustomTextStyles.f16W400(color: AppColors.blackColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() {
                if (c.pageState.value == PageState.LOADING) {
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                } else if (c.pageState.value == PageState.EMPTY) {
                  return EmptyView(
                    message: "No data available",
                    title: "Not available",
                    media: IconPath.searching,
                    mediaSize: Get.height / 4,
                  );
                } else if (c.pageState.value == PageState.NORMAL) {
                  return ListView.separated(
                      itemCount: c.faqList.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        var faq = c.faqList[index];
                        return FAQWidget(
                          question: "${faq.question} ?",
                          answer: faq.answer,
                        );
                      });
                } else {
                  return ErrorView(
                    message: "No Data Available.",
                    title: "No Data available at the moment",
                    media: IconPath.error,
                    // mediaSize: Get.height / 4,
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

class FAQWidget extends StatelessWidget {
  final String? question;
  final String? answer;
  const FAQWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text(
          //   question ?? "",
          //   style: CustomTextStyles.f16W400(color: AppColors.blackColor),
          // ),
          RichText(
            text: TextSpan(
              style: CustomTextStyles.f12W400(
                  color: Colors.grey), // Apply a base style to the text
              children: [
                TextSpan(
                  text: "Q ) ",
                  // you could set different styles, like bold, italic, or color
                ),
                // Additional TextSpan examples
                TextSpan(
                  text: question,
                  style: CustomTextStyles.f14W400(color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: CustomTextStyles.f12W400(
                  color: Colors.grey), // Apply a base style to the text
              children: [
                TextSpan(
                  text: "Ans: ",
                  // you could set different styles, like bold, italic, or color
                ),
                // Additional TextSpan examples
                TextSpan(
                  text: answer,
                  style: CustomTextStyles.f14W400(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
