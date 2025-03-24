import 'package:widgets_test/models/dropdown_menu_model.dart';

class MessageSizeDropdownState {
  final bool isLoading;
  final String? error;
  final List<DropdownMenuModel> listOfMessageSize;

  MessageSizeDropdownState(
      {this.isLoading = false, this.error, required this.listOfMessageSize});

  MessageSizeDropdownState copyWith({
    bool? isLoading,
    String? error,
    List<DropdownMenuModel>? listOfMessageSize,
  }) {
    return MessageSizeDropdownState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        listOfMessageSize: listOfMessageSize ?? this.listOfMessageSize);
  }
}
