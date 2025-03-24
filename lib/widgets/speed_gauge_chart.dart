import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:widgets_test/theme/text_styles.dart';

class SpeedGaugeChart extends ConsumerWidget {
  final dynamic data;
  const SpeedGaugeChart({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final averageSpeed =
        data.fold(0, (prev, item) => (item.speed + prev)) / data.length;

    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, bottom: 40.0, right: 40, left: 40),
      child: Column(
        children: [
          SizedBox(
            height: 180.0,
            width: 200.0,
            child:
                SfRadialGauge(enableLoadingAnimation: true, axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
                GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
                GaugeRange(startValue: 100, endValue: 150, color: Colors.red)
              ], pointers: <GaugePointer>[
                NeedlePointer(value: averageSpeed.toDouble())
              ], annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        padding: const EdgeInsets.only(
                          top: 100.0,
                        ),
                        child: Text('${averageSpeed.toStringAsFixed(2)} km/h',
                            style: TextStyles.headingBold2)),
                    angle: 90,
                    positionFactor: 0.5)
              ])
            ]),
          ),
          const SizedBox(
            height: 40.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ความเร็วเฉลี่ย",
                style: TextStyles.bodyBold,
              ),
              Text(
                "กิโลเมตร/ชั่วโมง",
                style: TextStyles.bodyBold,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "ความเร็วเฉลี่ย",
                style: TextStyles.caption,
              ),
              Text(
                "${averageSpeed.toStringAsFixed(2)} กม./ชม.",
                style: TextStyles.caption,
              )
            ],
          ),
        ],
      ),
    );
  }
}
