import 'package:flutter/foundation.dart' show kIsWeb; // Import to check for web
export '../../utils/platform_view_registry_stub.dart'
    if (dart.library.ui) '../../utils/platform_view_registry_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/utils/platform_view_registry_web.dart';
import 'package:widgets_test/viewmodels/message_manage/providers/message_manage_form_viewmodel.dart';
import 'package:widgets_test/viewmodels/message_manage/providers/message_manage_viewmodel.dart';
import 'package:widgets_test/widgets/common/custom_text_editor.dart';
import 'package:widgets_test/widgets/modal.dart';
import 'package:widgets_test/widgets/common/custom_animated_container.dart';
import 'package:widgets_test/widgets/common/custom_dropdown_form_field.dart';
import 'package:widgets_test/widgets/common/custom_dropdown_menu.dart';
import 'package:widgets_test/widgets/common/custom_text_form_field.dart';
import 'package:widgets_test/widgets/common/double_button.dart';

class MessageManageForm extends ConsumerStatefulWidget {
  const MessageManageForm({super.key});

  @override
  ConsumerState<MessageManageForm> createState() => _MessageManageFormState();
}

class _MessageManageFormState extends ConsumerState<MessageManageForm> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  bool isActive = false;

  @override
  void initState() {
    super.initState();

    // Check what platform is running
    if (kIsWeb) {
      registerPlatformView("myCustomView", (int viewId) {
        return const HtmlElementView(viewType: "myCustomView");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: AppColor.whitePrimary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(
            height: 20.0,
          ),
          _buildButtonSection(),
          const SizedBox(
            height: 10.0,
          ),
          _buildForm(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "จัดการป้ายประชาสัมพันธ์ > ข้อความ > เพิ่มข้อความ",
          style: TextStyles.heading3,
        ),
      ],
    );
  }

  Widget _buildButtonSection() {
    final messageManageRefRead =
        ref.read(messageManageViewModelProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DoubleButton(
            firstTitle: "ยกเลิก",
            firstOnPressed: () =>
                messageManageRefRead.toggleMessageStatus(false),
            secondIcon: FontAwesomeIcons.floppyDisk,
            secondTitle: "บันทึก",
            secondOnPressed: () {
              CustomModal.show(
                context,
                title: "ยืนยันการบันทึก ?",
                content: const Text("คุณต้องการบันทึกข้อมูลหรือไม่?",
                    style: TextStyles.heading3),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          ref
                              .read(messageManageFormNotifierProvider.notifier)
                              .validateOtherForm();
                          if (_formKey.currentState!.validate() &&
                              (ref
                                      .watch(messageManageFormNotifierProvider)
                                      .errorMessage["htmlText"] ==
                                  null) &&
                              (ref
                                      .watch(messageManageFormNotifierProvider)
                                      .errorMessage["image"] ==
                                  null) &&
                              (ref
                                      .watch(messageManageFormNotifierProvider)
                                      .errorMessage["videoUrl"] ==
                                  null)) {
                            print("Form is valid, proceed to submit.");
                            messageManageRefRead.toggleMessageStatus(false);
                            Navigator.of(context, rootNavigator: true).pop();
                          } else {
                            print("error");
                          }
                        },
                        child: const Text("บันทึก"),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true).pop(),
                        child: const Text("ยกเลิก"),
                      ),
                    ],
                  )
                ],
              );
            })
      ],
    );
  }

  Widget _buildForm() {
    final formState = ref.watch(messageManageFormNotifierProvider);
    List<String> msgTypeOption = ["ตัวอักษร", "รูปภาพ", "วิดิโอ"];
    List<String> msgInfoType = ["ประชาสัมพันธ์", "สภาพจราจร"];

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 12.0, left: 24.0, right: 24.0, bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status
            Row(
              children: [
                const SizedBox(
                  width: 111.0,
                  child: Text(
                    "สถานะ",
                    style: TextStyles.body,
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Switch(
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),

            // Message Info Type
            Row(
              children: [
                const SizedBox(
                  width: 111.0,
                  child: Text(
                    "ประเภทข้อความ",
                    style: TextStyles.body,
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                CustomDropdownButtonFormField(
                  width: 240.0,
                  hintText: "เลือก",
                  menuEntry: msgInfoType,
                  onChanged: (value) {
                    if (value != null || value == "") {
                      ref
                          .read(messageManageFormNotifierProvider.notifier)
                          .updateMsgInfoType(value);
                    } else {
                      _formKey.currentState?.validate();
                    }
                  },
                  validator: (value) => ref
                      .read(messageManageFormNotifierProvider.notifier)
                      .validateForm("msgInfoType", value),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),

            // Message Info Type
            Row(
              children: [
                const SizedBox(
                  width: 111.0,
                  child: Text(
                    "ชนิดข้อความ",
                    style: TextStyles.body,
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                CustomDropdownMenu(
                  width: 240.0,
                  hintText: formState.msgType.toString(),
                  selectedValue: formState.msgType,
                  menuEntry: msgTypeOption,
                  onChanged: (value) {
                    ref
                        .read(messageManageFormNotifierProvider.notifier)
                        .updateMsgType(value);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),

            // Message Name
            Row(
              children: [
                const SizedBox(
                  width: 111.0,
                  child: Text(
                    "ชื่อข้อความ",
                    style: TextStyles.body,
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                CustomTextFormField(
                  validator: (value) => ref
                      .read(messageManageFormNotifierProvider.notifier)
                      .validateForm("msgName", value),
                  onChange: (value) {
                    ref
                        .read(messageManageFormNotifierProvider.notifier)
                        .updateMsgName(value);
                  },
                  hintText: "ชื่อข้อความ",
                  maxWidth: 240.0,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),

            // Dependent field
            formState.msgType == "ตัวอักษร"
                ? Row(
                    children: [
                      const SizedBox(
                        width: 111.0,
                        child: Text(
                          "รายละเอียด",
                          style: TextStyles.body,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      CustomTextEditor(
                          onChange: (value) {
                            ref
                                .read(
                                    messageManageFormNotifierProvider.notifier)
                                .updateHtmlText(value);
                          },
                          formState: formState.errorMessage['htmlText'] ?? '')
                    ],
                  )
                : formState.msgType == "รูปภาพ"
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 111.0,
                            child: Text(
                              "รายละเอียด",
                              style: TextStyles.body,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          CustomAnimatedContainer(
                            onTap: () => ref
                                .read(
                                    messageManageFormNotifierProvider.notifier)
                                .getImageGallery(),
                            icon: Icons.add_a_photo_rounded,
                            image: formState.image,
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          const SizedBox(
                            width: 111.0,
                            child: Text(
                              "รายละเอียด",
                              style: TextStyles.body,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          CustomAnimatedContainer(
                            onTap: () => ref
                                .read(
                                    messageManageFormNotifierProvider.notifier)
                                .getVideoGallery(),
                            icon: Icons.video_call_rounded,
                            videoUrl: formState.videoUrl,
                          )
                        ],
                      ),
            const SizedBox(
              height: 4.0,
            ),
            if (formState.errorMessage['htmlText'] != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 111.0,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      formState.errorMessage['htmlText'].toString(),
                      textAlign: TextAlign.start,
                      style: TextStyles.errorLabel2,
                    ),
                  ),
                ],
              ),

            if (formState.errorMessage['image'] != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 111.0,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      formState.errorMessage['image'].toString(),
                      textAlign: TextAlign.start,
                      style: TextStyles.errorLabel2,
                    ),
                  ),
                ],
              ),

            if (formState.errorMessage['videoUrl'] != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 111.0,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      formState.errorMessage['videoUrl'].toString(),
                      textAlign: TextAlign.start,
                      style: TextStyles.errorLabel2,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
