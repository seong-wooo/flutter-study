import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/practice/vide_player_retry/screen/custon_icon_button.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile xFile;
  final GestureTapCallback onNewVideoPressed;

  const CustomVideoPlayer(
      {super.key, required this.xFile, required this.onNewVideoPressed});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;
  bool isShowControls = false;

  @override
  void initState() {
    super.initState();

    initializeController();
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.xFile.path != widget.xFile.path) {
      initializeController();
    }
  }

  void initializeController() async {
    final videoController = VideoPlayerController.file(File(widget.xFile.path));

    await videoController.initialize();
    videoController.addListener(videoControllerListener);
    setState(() {
      this.videoController = videoController;
    });
  }

  void videoControllerListener() => setState(() {});

  @override
  void dispose() {
    videoController!.removeListener(videoControllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(
      child: GestureDetector(
        onTap: () => setState(() => isShowControls = !isShowControls),
        child: AspectRatio(
          aspectRatio: videoController!.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(videoController!),
              if (isShowControls)
                Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              if (isShowControls)
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        renderTimeTextFromDuration(
                          videoController!.value.position,
                        ),
                        Expanded(
                          child: Slider(
                            activeColor: Colors.white,
                            inactiveColor: Colors.white.withOpacity(0.5),
                            value: videoController!.value.position.inSeconds
                                .toDouble(),
                            onChanged: (double value) => setState(() =>
                                videoController!
                                    .seekTo(Duration(seconds: value.toInt()))),
                            min: 0,
                            max: videoController!.value.duration.inSeconds
                                .toDouble(),
                          ),
                        ),
                        renderTimeTextFromDuration(
                          videoController!.value.duration,
                        ),
                      ],
                    ),
                  ),
                ),
              if (isShowControls)
                Align(
                  alignment: Alignment.topRight,
                  child: CustomIconButton(
                    onPressed: widget.onNewVideoPressed,
                    iconData: Icons.photo_camera_back,
                  ),
                ),
              if (isShowControls)
                Align(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomIconButton(
                          iconData: Icons.rotate_left,
                          onPressed: onReversePressed,
                        ),
                        CustomIconButton(
                          iconData: videoController!.value.isPlaying
                              ? Icons.pause_circle
                              : Icons.play_circle,
                          onPressed: onPlayPressed,
                        ),
                        CustomIconButton(
                          iconData: Icons.rotate_right,
                          onPressed: onForwardPressed,
                        ),
                      ]),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderTimeTextFromDuration(Duration position) {
    return Text(
      '${position.inMinutes.toString().padLeft(2, '0')}:${(position.inSeconds % 60).toString().padLeft(2, '0')}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }

  void onReversePressed() {
    final currentPosition = videoController!.value.position;

    Duration position = Duration();

    if (currentPosition.inSeconds > 3) {
      position = currentPosition - Duration(seconds: 3);
    }

    videoController!.seekTo(position);
  }

  void onPlayPressed() {
    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
  }

  void onForwardPressed() {
    final maxPosition = videoController!.value.duration;
    final currentPosition = videoController!.value.position;

    Duration position = maxPosition;

    if ((maxPosition - Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);
    }

    videoController!.seekTo(position);
  }
}
