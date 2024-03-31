import 'package:event/core/utils/constants/colors.dart';
import 'package:event/core/utils/constants/icon_paths.dart';
import 'package:event/core/widgets/common/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CafeMenuScreen"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListView.separated(
                    itemCount: 20,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return EventTileCard(
                        imageUrl: "",
                        location: "Pkr lakeside",
                        eventTitle: "Random",
                        price: "Rs. 1000",
                      );
                    })
              ],
            ),
          ),
        ));
  }
}

class EventTileCard extends StatelessWidget {
  final String? imageUrl;
  final String? eventTitle;
  final VoidCallback? onTap;
  final String? location;
  final String? price;

  EventTileCard({
    super.key,
    this.onTap,
    this.location,
    required this.price,
    this.imageUrl,
    this.eventTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            //   "",
            //   height: 35,
            //   width: 35,
            //   alignment: Alignment.center,
            // ),
            SvgPicture.asset(
              IconPath.apple,
              height: 80,
              width: 80,
              alignment: Alignment.center,
            ),
            Text(
              eventTitle ?? "",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 14,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              location ?? "",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 14,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Text(
                    price ?? "",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 14,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Book Now",
                    style:
                        CustomTextStyles.f14W300(color: AppColors.whiteColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
