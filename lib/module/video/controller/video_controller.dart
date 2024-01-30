import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  late YoutubePlayerController videoController;
  RxInt selectedVideoIndex = 0.obs;

  List<Map<String, String>> videoMap = [
    {"link": "https://www.youtube.com/watch?v=c6PbtDf5k24"},
    {"link": "https://www.youtube.com/watch?v=_2gyKBy-Q8Q"},
    {"link": "https://www.youtube.com/watch?v=WJUsTx2cfe4"},
    {"link": "https://www.youtube.com/watch?v=niI0ZPIUKYI"},
    {"link": "https://www.youtube.com/watch?v=CAmw-BcZY18"},
  ];

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onClose() {
    super.onClose();
    videoController.dispose();
  }

  void init() {
    selectedVideoIndex.value = 0;
    videoController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              videoMap[selectedVideoIndex.value]["link"] ?? "") ??
          "",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        hideThumbnail: true,
      ),
    );
  }

  void onListTileTap({required int index}) async {
    selectedVideoIndex.value = index;
    // to load new video
    videoController.load(
      YoutubePlayer.convertUrlToId(videoMap[index]["link"] ?? "") ?? "",
    );
  }
}
