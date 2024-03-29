import 'package:event/core/controllers/dashscreen/profile/profile_controller.dart';
import 'package:get/get.dart';

import '../../../features/screens/dashscreen/dashboard_panel.dart';
import '../../../features/screens/product/controller/product_controller.dart';
import '../../../features/screens/product/presentation/product_detail_screen.dart';
import '../../../features/screens/recent_orders/controller/recent_order_controller.dart';
import '../../../features/screens/recent_orders/presentation/recent_order_screen.dart';
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

        // Get.lazyPut(() => ProfileController());
        // Get.lazyPut(() => ProfileController());
        // Get.lazyPut(() => SettingsController());
        // Get.lazyPut(() => GearListCreationController());
      },
    ),
  ),

  GetPage(
    name: ProductDetailScreen.routeName,
    page: () => ProductDetailScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => ProductDetailController());
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
    name: RecentOrdersScreen.routeName,
    page: () => RecentOrdersScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => RecentOrderController());
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
