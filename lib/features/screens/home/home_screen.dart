import 'package:event/core/model/event/event_model.dart';
import 'package:event/core/utils/constants/apis.dart';
import 'package:event/core/utils/constants/colors.dart';
import 'package:event/core/utils/constants/enums.dart';
import 'package:event/core/widgets/common/custom_text_style.dart';
import 'package:event/core/widgets/common/network_imge.dart';
import 'package:event/core/widgets/common/text_form_field.dart';
import 'package:event/core/widgets/shimmer/category_shimmer.dart';
import 'package:event/features/screens/events/event_detail_screen.dart';
import 'package:event/features/screens/home/search_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/dashscreen/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  final c = Get.find<HomeScreenController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Event",
          style: CustomTextStyles.f28W600(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            PrimaryTextField(
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.blackColor,
              ),
              readOnly: true,
              onTap: () {
                Get.toNamed(SearchEventScreen.routeName);
              },
              hint: "Search...",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: Obx(() {
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
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var category = c.categoryList[index];
                        return EventCategory(category: category.title ?? "");
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: c.categoryList.length);
                } else {
                  return Center(
                    child: Text("Error View"),
                  );
                }
              }),
            ),
            Text(
              "Popular Events",
              style: CustomTextStyles.f20W600(color: AppColors.primary),
            ),
            Expanded(
              child: Obx(() {
                if (c.pageState.value == PageState.LOADING) {
                  return CategoryShimmer.categoryGrid();
                } else if (c.pageState.value == PageState.EMPTY) {
                  return const Center(
                    child: Text("Empty"),
                  );
                } else if (c.pageState.value == PageState.NORMAL) {
                  return SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 20, // spacing between rows
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.8 // spacing between columns
                              ),
                      itemCount: c.eventList.length,
                      itemBuilder: (context, index) {
                        var product = c.eventList[index];
                        return EventCard(
                          event: product,
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Error View"),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}

class EventCategory extends StatelessWidget {
  final String? category;
  final Color? backgroundColor;
  final Color? textColor;
  const EventCategory({
    super.key,
    required this.category,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const SkyNetworkImage(
              imageUrl: "",
              width: 60,
              height: 60,
              boxFit: BoxFit.fill,
            ),
          ),
          Text(category ?? "")
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final c = Get.find<HomeScreenController>();
  // final String? icon;
  // final String? title;
  // final VoidCallback? onTap;
  // final String? location;
  // final String? price;
  final EventModel event;
  EventCard({
    super.key,
    // required this.icon,
    // required this.title,
    // this.onTap,
    // this.location,
    // required this.price,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(EventDetailScreen.routeName, arguments: {"event": event});
      },
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 6),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 204, 203, 203),
              blurRadius: 2.0,
              spreadRadius: 1,
              offset: Offset(
                0,
                3,
              ),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SvgPicture.network(
            //   // APIPathHelper.imageUrl + icon.toString(),
            //   // IconPath.apple,
            //   "$icon",
            //   height: 35,
            //   width: 35,
            //   alignment: Alignment.center,
            // ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child:
                    //  SvgPicture.asset(
                    //   "$icon",
                    //   height: 80,
                    //   width: 80,
                    //   alignment: Alignment.center,
                    // ),
                    SkyNetworkImage(
                  imageUrl: "${Api.imageUrl}${event.thumbnail}",
                  height: 80,
                  // width: 80,
                  boxFit: BoxFit.fitWidth,
                  // alignment: Alignment.center,
                ),
              ),
            ),

            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.eventTitle ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    // Text(
                    //   event.organizerId ?? "",
                    //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    //         fontSize: 14,
                    //         color: AppColors.primary,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    // ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      event.eventDate ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          event.eventTime ?? "",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        if (event.organizerId !=
                            c.coreController.currentUser.value?.id)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Book Now",
                              style: CustomTextStyles.f14W300(
                                  color: AppColors.whiteColor),
                            ),
                          ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
