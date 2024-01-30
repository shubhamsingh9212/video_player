import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_test/module/video/binidng/video_binding.dart';
import 'package:video_player_test/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: AppPages.pages,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialBinding: VideoBinding(),
      initialRoute: Routes.VIDEOVIEW,
    );
  }
}
