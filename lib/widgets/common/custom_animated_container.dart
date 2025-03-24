import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/viewmodels/message_manage/providers/message_manage_form_viewmodel.dart';

class CustomAnimatedContainer extends ConsumerStatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Uint8List? image;
  final String? videoUrl;
  final XFile? videoDisplay;
  const CustomAnimatedContainer({
    super.key,
    required this.onTap,
    required this.icon,
    this.image,
    this.videoUrl,
    this.videoDisplay,
  });

  @override
  ConsumerState<CustomAnimatedContainer> createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState
    extends ConsumerState<CustomAnimatedContainer> {
  bool isHovered = false;
  VideoPlayerController? videoController;
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    _initializeVideo();
    super.initState();
  }

  @override
  void didUpdateWidget(CustomAnimatedContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoUrl != oldWidget.videoUrl) {
      _initializeVideo();
    }
  }

  void _initializeVideo() {
    if (widget.videoUrl != null) {
      videoController?.dispose();
      videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!))
            ..initialize().then((_) {
              setState(() {});
            });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formMsgType = ref.watch(
        messageManageFormNotifierProvider.select((state) => state.msgType));

    return Expanded(
        child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          InkWell(
            onTap: ((formMsgType == "รูปภาพ" && widget.image != null) ||
                    (formMsgType == "วิดิโอ" && widget.videoUrl != null))
                ? null
                : widget.onTap,
            onHover: (value) {
              setState(() {
                isHovered = value;
              });
            },
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 200.0,
                decoration: BoxDecoration(
                    color: isHovered
                        ? AppColor.blackAlpha45Primary
                        : AppColor.bgColor,
                    borderRadius: BorderRadius.circular(14.0)),
                child: formMsgType == "รูปภาพ"
                    ? Center(
                        child: widget.image != null
                            ? Image.memory(
                                widget.image!,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                widget.icon,
                                size: 64.0,
                                color: AppColor.blackIcon,
                              ),
                      )
                    : Center(
                        child: widget.videoUrl != null
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  AspectRatio(
                                      aspectRatio: videoController!
                                              .value.isInitialized
                                          ? videoController!.value.aspectRatio
                                          : 16 / 9,
                                      child: VideoPlayer(videoController!)),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (isPlaying == false) {
                                            videoController!.play();
                                            isPlaying = true;
                                          } else {
                                            videoController!.pause();
                                            isPlaying = false;
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        isPlaying == false
                                            ? Icons.play_circle_fill
                                            : Icons.pause_circle_filled,
                                        size: 100.0,
                                        color: AppColor.whiteButton,
                                      )),
                                ],
                              )
                            : Icon(
                                widget.icon,
                                size: 64.0,
                                color: AppColor.blackIcon,
                              ),
                      )),
          ),
          if ((formMsgType == "รูปภาพ" && widget.image != null) ||
              (formMsgType == "วิดิโอ" && widget.videoUrl != null))
            IconButton(
                onPressed: () {
                  formMsgType == "รูปภาพ" && widget.image != null
                      ? ref
                          .read(messageManageFormNotifierProvider.notifier)
                          .removeImage()
                      : ref
                          .read(messageManageFormNotifierProvider.notifier)
                          .removeVideoUrl();
                },
                icon: const Icon(
                  Icons.cancel_sharp,
                  size: 24.0,
                  color: AppColor.redColor,
                )),
        ],
      ),
    ));
  }
}
