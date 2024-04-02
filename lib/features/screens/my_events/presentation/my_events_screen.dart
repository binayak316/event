import 'package:event/core/model/event/event_model.dart';
import 'package:event/core/utils/constants/colors.dart';
import 'package:event/core/utils/constants/enums.dart';
import 'package:event/core/widgets/common/custom_text_style.dart';
import 'package:event/core/widgets/common/network_imge.dart';
import 'package:event/features/screens/my_events/controller/my_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyEventsScreen extends StatelessWidget {
  static const String routeName = "/my-events";
  final c = Get.find<myEventController>();
  MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Events",
          style: CustomTextStyles.f16W600(),
        ),
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
                  return Center(
                    child: Text("Empty"),
                  );
                } else if (c.pageState.value == PageState.NORMAL) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var event = c.eventList[index];
                        return MyEventRowWidget(
                          event: event,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: c.eventList.length);
                } else {
                  return Center(
                    child: Text("Error View"),
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

class MyEventRowWidget extends StatelessWidget {
  final EventModel event;
  const MyEventRowWidget({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const SkyNetworkImage(
                  imageUrl: "https://picsum.photos/200/300",
                  width: 60,
                  height: 60,
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventTitle ?? "",
                    style:
                        CustomTextStyles.f16W500(color: AppColors.blackColor),
                  ),
                  Text(
                    event.eventDate ?? "",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.blackColor),
                  ),
                  Text(
                    event.eventTime ?? "",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.blackColor),
                  ),
                  Text(
                    event.location ?? "",
                    style:
                        CustomTextStyles.f16W500(color: AppColors.blackColor),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.more_vert,
            color: AppColors.blackColor,
          )
        ],
      ),
    );
  }
}
