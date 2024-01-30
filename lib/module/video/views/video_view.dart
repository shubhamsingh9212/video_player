import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controller/video_controller.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: width > height //for portraid mode
          ? null
          : AppBar(
              title: customText(
                title: "Video Player",
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
              backgroundColor: Colors.blueAccent,
            ),
      body: SafeArea(
        child: YoutubePlayerBuilder(
          //for portraid mode status bar
          onEnterFullScreen: () {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [
                SystemUiOverlay.top,
              ],
            );
          },
          player: YoutubePlayer(
            controller: controller.videoController,
          ),
          builder: (context, player) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                player,
                // video link list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    itemCount: controller.videoMap.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            //selcted color based on index
                            tileColor:
                                controller.selectedVideoIndex.value == index
                                    ? Colors.blueAccent
                                    : Colors.transparent,
                            onTap: () {
                              controller.onListTileTap(index: index);
                            },
                            title: customText(
                              title: "Video ${index + 1}",
                              fontSize: 17,
                              color:
                                  controller.selectedVideoIndex.value == index
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget customText({
    required String title,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.white,
  }) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
