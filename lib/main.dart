import 'package:e_commerce_admin_app/screens/dashboard_screen.dart';
import 'package:e_commerce_admin_app/constants/colors_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'plugins/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        iconTheme: const IconThemeData(color: kSkeletonColor),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: DashBoard.id,

      //_________________________________[Routes]
      getPages: [
        GetPage(name: DashBoard.id, page: () => const DashBoard()),
      ],
    ),
  );
}
