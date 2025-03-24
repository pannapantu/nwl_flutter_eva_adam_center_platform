import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/theme/text_styles.dart';

class WeatherData extends ConsumerWidget {
  const WeatherData({
    super.key,
    required this.data,
  });

  final dynamic data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.bgColor, borderRadius: BorderRadius.circular(14.0)),
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "สภาพอากาศ : 06/10/2024 12:11:15 (latest Update)",
            style: TextStyles.body,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Icon(
                    FontAwesomeIcons.thermometer,
                    size: 48.0,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text("อุณหภูมิ"),
                  Text(
                    "${data.temperature.toString()} C",
                    style: TextStyles.headingBold4,
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    FontAwesomeIcons.wind,
                    size: 48.0,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const Text("ลม"),
                  Text("${data.wind.toString()} กม/ชม.",
                      style:
                          TextStyles.headingBold4),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    FontAwesomeIcons.droplet,
                    size: 48.0,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text("ความชื้น"),
                  Text("${data.moisture.toString()} %",
                      style:
                          TextStyles.headingBold4),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    FontAwesomeIcons.cloudRain,
                    size: 48.0,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text("ฝน"),
                  Text("${data.rain.toString()} มม",
                      style:
                          TextStyles.headingBold4),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    FontAwesomeIcons.smog,
                    size: 48.0,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const Text("อุณหภูมิ"),
                  Text("${data.pm25.toString()} มก/ลม",
                      style:
                          TextStyles.headingBold4),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
