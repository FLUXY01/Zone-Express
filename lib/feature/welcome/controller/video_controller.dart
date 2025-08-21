import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController with WidgetsBindingObserver {
  late final VideoPlayerController videoPlayerController;
  final isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);

    videoPlayerController = VideoPlayerController.asset(
      "assets/video/intro_video/intro_zone_express.mp4",
    );

    videoPlayerController.initialize().then((_) {
      videoPlayerController
        ..setLooping(true)
        ..setVolume(0.0)
        ..play();
      isInitialized.value = true;
    });
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    videoPlayerController.pause();
    videoPlayerController.dispose();
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!isInitialized.value) return;
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      if (videoPlayerController.value.isPlaying) {
        videoPlayerController.pause();
      }
    } else if (state == AppLifecycleState.resumed) {
      videoPlayerController.play();
    }
  }
}
