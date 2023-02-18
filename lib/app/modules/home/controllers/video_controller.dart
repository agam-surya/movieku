import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoCOntroller extends GetxController {
  var videourl = "https://www.youtube.com/watch?v=-_oZlR-uCTI".obs;
  var ytcon = YoutubePlayerController(initialVideoId: "").obs;

  @override
  void onInit() {
    videourl.value = "https://www.youtube.com/watch?v=-_oZlR-uCTI";
    ytcon.value = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videourl.value)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          loop: false,
          autoPlay: true,
        ));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    print("onclose");
    ytcon.value.dispose();
    super.onClose();
  }
}
