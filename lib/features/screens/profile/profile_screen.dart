import 'package:event/core/controllers/dashscreen/profile/profile_controller.dart';
import 'package:event/core/utils/constants/colors.dart';
import 'package:event/core/utils/constants/icon_paths.dart';
import 'package:event/core/widgets/common/custom_text_style.dart';
import 'package:event/features/screens/my_events/presentation/my_events_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/widgets/common/common_alert.dart';
import '../../../core/widgets/common/network_imge.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile-page/";
  final c = Get.find<ProfileController>();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(c.coreController.currentUser.value?.status);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   decoration: const BoxDecoration(
          //     color: AppColors.whiteColor,
          //     boxShadow: [
          //       BoxShadow(
          //         color: Color.fromARGB(255, 204, 203, 203),
          //         blurRadius: 2.0,
          //         spreadRadius: 1,
          //         offset: Offset(
          //           0,
          //           3,
          //         ),
          //       )
          //     ],
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       //TODO logo
          //       Text(
          //         "Profile",
          //         style: CustomTextStyles.f16W600(),
          //       ),
          //       const Icon(
          //         Icons.search,
          //         color: AppColors.primary,
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
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
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c.coreController.currentUser.value?.name ?? "",
                      style: CustomTextStyles.f20W600(),
                    ),
                    Text(
                      c.coreController.currentUser.value?.email ?? "",
                      style: CustomTextStyles.f16W700(),
                    ),
                    Text(
                      c.coreController.currentUser.value?.status == "1"
                          ? "Organizer"
                          : "User",
                      style: CustomTextStyles.f16W700(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProfileTiles(
                  onTap: () {},
                  iconUrl: IconPath.user,
                  title: "Profile Setting",
                ),
                const SizedBox(
                  height: 10,
                ),
                // ProfileTiles(
                //   onTap: () {
                //     Get.toNamed(RecentOrdersScreen.routeName);
                //   },
                //   iconUrl: IconPath.recentOrder,
                //   title: "Recent Orders",
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                if (c.coreController.currentUser.value?.status == "1")
                  ProfileTiles(
                    onTap: () {
                      Get.toNamed(MyEventsScreen.routeName);
                    },
                    iconUrl: IconPath.recentOrder,
                    title: "My Events",
                  ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {},
                  iconUrl: IconPath.history,
                  title: "History",
                ),
                const SizedBox(
                  height: 10,
                ),
                // ignore: unrelated_type_equality_checks
                if (c.coreController.currentUser.value?.status !=
                    "1") //1 means organizer
                  ProfileTiles(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return CustomAlertDialog(
                              title: "You want to become an organizer ?",
                              message:
                                  "You will be logged out for this action.",
                              onConfirm: () {
                                c.becomeBoss();
                              },
                              confirmText: "Yes",
                            );
                          });
                    },
                    iconUrl: IconPath.organizer,
                    title: "Become an Organizer",
                  ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {
                    // Get.toNamed(FavouritesScreen.routeName);
                  },
                  iconUrl: IconPath.fav,
                  title: "Favourite",
                ),
                Divider(
                  height: 10,
                  color: AppColors.lightGrey,
                  indent: 10,
                  endIndent: 10,
                ),
                ProfileTiles(
                  onTap: () {
                    c.openBottomSheetChangePW();
                  },
                  title: "Change password",
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  title: "Contact",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return CustomAlertDialog(
                            // title: "Logout Confirmation",
                            message: "Are you sure to logout?",
                            onConfirm: () {
                              c.coreController.logOut();
                            },
                            confirmText: "Logout",
                          );
                        });
                  },
                  title: "Log out",
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class FavouritesScreen {}

class ProfileTiles extends StatelessWidget {
  final String? iconUrl;
  final String title;
  final Function() onTap;

  const ProfileTiles({
    super.key,
    this.iconUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      leading: SvgPicture.asset(iconUrl ?? ""),
      title: Text(
        title,
        style: CustomTextStyles.f16W400(),
      ),
      trailing: SvgPicture.asset(IconPath.rightArrow),
    );
  }
}
