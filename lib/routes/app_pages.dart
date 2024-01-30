import 'package:get/get.dart';
import 'package:video_player_test/module/video/binidng/video_binding.dart';
import 'package:video_player_test/module/video/views/video_view.dart';
part 'app_routes.dart';

class AppPages {
  static final pages = [
    // for page routing
    GetPage(
      name: Routes.VIDEOVIEW,
      page: () => const VideoView(),
      binding: VideoBinding(),
    ),
  ];
}
