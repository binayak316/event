import 'package:event/core/controllers/dashscreen/event/event_add_controller.dart';
import 'package:event/core/controllers/dashscreen/event/event_controller.dart';
import 'package:event/core/controllers/dashscreen/event/event_detail_controller.dart';
import 'package:event/core/controllers/dashscreen/profile/profile_controller.dart';
import 'package:event/features/screens/events/event_detail_screen.dart';
import 'package:get/get.dart';

import '../../../features/screens/dashscreen/dashboard_panel.dart';
import '../../../features/screens/my_events/controller/my_event_controller.dart';
import '../../../features/screens/my_events/presentation/my_events_screen.dart';
import '../../controllers/dashscreen/dash_page_manager_controller.dart';
import '../../controllers/dashscreen/home_screen_controller.dart';

final List<GetPage> dashScreenPages = <GetPage>[
  GetPage(
    name: DashPageManager.routeName,
    page: () => DashPageManager(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => DashboardPanelController());
        Get.lazyPut(() => HomeScreenController());
        Get.lazyPut(() => ProfileController());
        Get.lazyPut(() => EventAddController());
        Get.lazyPut(() => EventsController());
      },
    ),
  ),

  GetPage(
    name: EventDetailScreen.routeName,
    page: () => EventDetailScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => EventDetailController());
      },
    ),
  ),

  // GetPage(
  //   name: FavouritesScreen.routeName,
  //   page: () => FavouritesScreen(),
  //   binding: BindingsBuilder(
  //     () {
  //       Get.lazyPut(() => FavouriteController());
  //     },
  //   ),
  // ),

  GetPage(
    name: MyEventsScreen.routeName,
    page: () => MyEventsScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => myEventController());
      },
    ),
  ),
//   // GetPage(
//   //   name: GearListsPage.routeName,
//   //   page: () => GearListsPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => GearListController());
//   //     },
//   //   ),
//   // ),
  // GetPage(
  //   name: ProfileScreen.routeName,
  //   page: () => ProfileScreen(),
  //   binding: BindingsBuilder(
  //     () {
  //       Get.lazyPut(() => ProfileController());
  //     },
  //   ),
  // ),
//   // GetPage(
//   //   name: ActivityPage.routeName,
//   //   page: () => ActivityPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => ActivityController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: ChangePasswordPage.routeName,
//   //   page: () => ChangePasswordPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => ChangePasswordController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: AdventureDetailPage.routeName,
//   //   page: () => AdventureDetailPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => AdventureDetailController());
//   //     },
//   //   ),
//   // ),
];
