import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/utils/platform_view_registry_stub.dart';

class CustomTextEditor extends StatefulWidget {
  final Function(String) onChange;
  final String formState;
  const CustomTextEditor(
      {super.key, required this.onChange, required this.formState});

  @override
  State<CustomTextEditor> createState() => _CustomTextEditorState();
}

class _CustomTextEditorState extends State<CustomTextEditor> {
  late HtmlEditorController _htmlController;

  @override
  void initState() {
    super.initState();
    _htmlController = HtmlEditorController();

    // Check what platform is running
    if (kIsWeb) {
      registerPlatformView("myCustomView", (int viewId) {
        return const HtmlElementView(viewType: "myCustomView");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 240.0,
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 2.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.formState.isNotEmpty
                    ? AppColor.redColor
                    : AppColor.blackIcon,
                width: 1),
            borderRadius: BorderRadius.circular(8.0)),
        child: HtmlEditor(
          callbacks: Callbacks(
            onChangeContent: (value) {
              if (value != null && value.isNotEmpty) {
                widget.onChange(value);
              }
            },
          ),
          controller: _htmlController,
          htmlEditorOptions: const HtmlEditorOptions(
            initialText: "",
            hint: "Type new messages",
            adjustHeightForKeyboard: false,
            shouldEnsureVisible: false,
            autoAdjustHeight: false,
            spellCheck: true,
          ),
          htmlToolbarOptions: const HtmlToolbarOptions(
              dropdownMenuMaxHeight: 400.0,
              dropdownMenuDirection: DropdownMenuDirection.down,
              defaultToolbarButtons: [
                FontSettingButtons(),
                ColorButtons(),
                FontButtons(),
              ],
              dropdownBackgroundColor: AppColor.whitePrimary,
              dropdownElevation: 2,
              buttonColor: AppColor.blackPrimary,
              buttonSelectedColor: Colors.blueAccent,
              toolbarPosition: ToolbarPosition.aboveEditor,
              toolbarType: ToolbarType.nativeScrollable),
          otherOptions: const OtherOptions(
            height: 240.0,
          ),
        ),
      ),
    );
  }
}
