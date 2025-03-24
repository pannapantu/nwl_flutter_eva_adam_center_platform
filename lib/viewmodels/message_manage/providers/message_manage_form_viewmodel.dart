import 'dart:js_interop' as js_util;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web/web.dart' as web;
import 'package:widgets_test/viewmodels/message_manage/states/message_mange_form_state.dart';

part 'message_manage_form_viewmodel.g.dart';

@riverpod
class MessageManageFormNotifier extends _$MessageManageFormNotifier {
  @override
  MessageMangeFormState build() {
    return MessageMangeFormState(
        isActive: false,
        msgInfoType: "",
        msgType: "ตัวอักษร",
        msgName: "",
        htmlText: '',
        errorMessage: {},
        isValid: false,
        clearImage: false,
        clearVideoUrl: false);
  }

  void updateIsActive(bool status) {
    state = state.copyWith(isActive: status);
  }

  void updateMsgInfoType(String infoType) {
    state = state.copyWith(msgInfoType: infoType);
  }

  void updateMsgType(String type) {
    state = state.copyWith(msgType: type);
  }

  void updateMsgName(String message) {
    state = state.copyWith(msgName: message);
  }

  void updateHtmlText(String html) {
    state = state.copyWith(htmlText: html);
  }

  void updateImage(Uint8List newImage) {
    state = state.copyWith(image: newImage);
  }

  void updateVideoUrl(String newUrl) {
    state = state.copyWith(videoUrl: newUrl);
  }

  void removeImage() {
    state = state.copyWith(clearImage: true);
  }

  void removeVideoUrl() {
    state = state.copyWith(clearVideoUrl: true);
  }

  String? validateForm(String field, String? value) {
    if (value == null || value.trim().isEmpty) {
      if (field == "msgName") return "กรุณากรอกชื่อข้อความ";
      if (field == "msgInfoType") return "กรุณาเลือกประเภทข้อความ";
    }
    return null;
  }

  void validateOtherForm() {
    Map<String, String> error = Map.from(state.errorMessage);
    if (state.msgType == "ตัวอักษร" &&
        (state.htmlText == '' ||
            state.htmlText!.isEmpty ||
            state.htmlText == '<p><br></p>')) {
      error['htmlText'] = "กรุณากรอกรายละเอียด";
    } else {
      error.remove("htmlText");
    }
    if (state.msgType == "รูปภาพ" && state.image == null) {
      error['image'] = "กรุณากรอกรายละเอียด";
    } else {
      error.remove("image");
    }
    if (state.msgType == "วิดิโอ" && state.videoUrl == null) {
      error['videoUrl'] = "กรุณากรอกรายละเอียด";
    } else {
      error.remove("videoUrl");
    }

    state = state.copyWith(errorMessage: error);
  }

  Future<void> getImageGallery() async {
    final XFile? pickFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickFile != null) {
      if (kIsWeb) {
        Uint8List imageBytes = await pickFile.readAsBytes();

        updateImage(imageBytes);
      }
      print("Mobile Image Path: ${pickFile.path}");
    } else {
      print("No image at all");
    }
  }

  Future<void> getVideoGallery() async {
    final XFile? pickFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickFile != null) {
      if (kIsWeb) {
        // Convert the image to bytes (Web does NOT return file paths)
        Uint8List videoBytes = await pickFile.readAsBytes();
        final js_util.JSArray<web.BlobPart> jsArray =
            [videoBytes.toJS].toJS; // Create Blob from bytes
        final blob = web.Blob(jsArray);
        final url = web.URL.createObjectURL(blob);

        updateVideoUrl(url);
      }
    } else {
      print("No image at all");
    }
  }
}
