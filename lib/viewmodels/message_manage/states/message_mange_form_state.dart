import 'dart:typed_data';

class MessageMangeFormState {
  final bool isActive;
  final String? msgInfoType;
  final String? msgType;
  final String? msgName;
  final String? htmlText;
  final Map<String, String> errorMessage;
  final bool? isValid;
  final Uint8List? image;
  final String? videoUrl;
  final bool clearImage;
  final bool clearVideoUrl;

  MessageMangeFormState({
    this.isActive = false,
    this.msgInfoType,
    this.msgType,
    this.msgName,
    this.htmlText = '<p></p>',
    this.errorMessage = const {},
    this.isValid = false,
    this.image,
    this.videoUrl,
    this.clearImage = false,
    this.clearVideoUrl = false,
  });

  MessageMangeFormState copyWith({
    bool? isActive,
    String? msgInfoType,
    String? msgType,
    String? msgName,
    String? htmlText,
    Map<String, String>? errorMessage,
    bool? isValid,
    Uint8List? image,
    String? videoUrl,
    bool clearImage = false,
    bool clearVideoUrl = false,
  }) {
    return MessageMangeFormState(
      isActive: isActive ?? this.isActive,
      msgInfoType: msgInfoType ?? this.msgInfoType,
      msgType: msgType ?? this.msgType,
      msgName: msgName ?? this.msgName,
      htmlText: htmlText ?? this.htmlText,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
      image: clearImage ? null : (image ?? this.image),
      videoUrl: clearVideoUrl ? null : (videoUrl ?? this.videoUrl),
    );
  }
}
