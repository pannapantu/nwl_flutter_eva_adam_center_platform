import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:widgets_test/theme/color.dart';

class DatePicker extends StatelessWidget {
  final String hintText;
  final String resultDate;
  final Function setTime;
  final double width;
  const DatePicker(
      {super.key,
      required this.hintText,
      required this.resultDate,
      required this.setTime,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 240.0,),
      child: Container(
        height: 48.0,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.blackPrimary, width: 0.5),
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          onTap: () async {
            DateTime? dateTime = await showOmniDateTimePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1600).subtract(const Duration(days: 3652)),
              lastDate: DateTime.now().add(
                const Duration(days: 3652),
              ),
              is24HourMode: false,
              isShowSeconds: false,
              minutesInterval: 1,
              secondsInterval: 1,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              constraints: const BoxConstraints(
                maxWidth: 350,
                maxHeight: 650,
              ),
              transitionBuilder: (context, anim1, anim2, child) {
                return FadeTransition(
                  opacity: anim1.drive(
                    Tween(
                      begin: 0,
                      end: 1,
                    ),
                  ),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 200),
              barrierDismissible: true,
              selectableDayPredicate: (dateTime) {
                // Disable 25th Feb 2023
                if (dateTime == DateTime(2023, 2, 25)) {
                  return false;
                } else {
                  return true;
                }
              },
            );
            if (dateTime != null) {
              setTime(dateTime);
            }
          },
          leading: Text(
            hintText,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColor.blackIcon),
          ),
          title: Text(
              overflow: TextOverflow.ellipsis,
              resultDate == '' ? "mm/dd/yyyy --:-- --" : resultDate.toString()),
          trailing: const Icon(
            Icons.calendar_today_rounded,
            size: 22.0,
          ),
        ),
      ),
    );
  }
}
