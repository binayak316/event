import 'package:event/core/utils/config/pages.dart';
import 'package:event/core/utils/constants/theme.dart';
import 'package:event/features/screens/dashscreen/dashboard_panel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/controllers/core_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  Get.put(CoreController());
  runApp(Event()
      // DevicePreview(
      // enabled: !kReleaseMode,
      // builder: (context) => MyApp(), // Wrap your app
      // ),

      );
}

class Event extends StatelessWidget {
  // final coreController = Get.find<CoreController>();

  Event({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomTheme.basicTheme(),
      debugShowCheckedModeBanner: false,
      // initialRoute: SplashScreen.routeName,
      initialRoute: DashPageManager.routeName,
      getPages: getPages,
    );
  }
}
