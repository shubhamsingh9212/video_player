import 'package:get/get.dart';
import 'package:video_player_test/module/video/controller/video_controller.dart';

class VideoBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(VideoController());
  }

}