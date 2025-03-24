import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/models/traffic_model.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/widgets/common/custom_tooltip_box.dart';

class ViolatedVehiclePieChart extends ConsumerStatefulWidget {
  final dynamic data;
  const ViolatedVehiclePieChart({
    super.key,
    this.data,
  });

  @override
  ConsumerState<ViolatedVehiclePieChart> createState() =>
      _ViolatedVehiclePieChartState();
}

class _ViolatedVehiclePieChartState
    extends ConsumerState<ViolatedVehiclePieChart> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Map<VehicleType, int> vehicleSummary = {
      VehicleType.bus: widget.data
          .where((item) =>
              (item.vehicleType == VehicleType.bus && item.speed > 120))
          .length,
      VehicleType.car: widget.data
          .where(
              (item) => item.vehicleType == VehicleType.car && item.speed > 120)
          .length,
      VehicleType.motorcycle: widget.data
          .where((item) =>
              item.vehicleType == VehicleType.motorcycle && item.speed > 120)
          .length,
      VehicleType.truck: widget.data
          .where((item) =>
              item.vehicleType == VehicleType.truck && item.speed > 120)
          .length
    };
    final totalVehicle =
        vehicleSummary.entries.fold(0, (prev, item) => prev + item.value);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                height: 200,
                child: PieChart(PieChartData(
                    sectionsSpace: 4.0,
                    centerSpaceRadius: 60.0,
                    sections: vehicleSummary.entries.map((entry) {
                      return PieChartSectionData(
                          value: entry.value.toDouble(),
                          color: entry.key.color,
                          showTitle: false,
                          radius: 14.0);
                    }).toList(),
                    pieTouchData: PieTouchData(
                      enabled: true,
                      touchCallback: (FlTouchEvent event,
                          PieTouchResponse? pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse != null &&
                              pieTouchResponse.touchedSection != null &&
                              pieTouchResponse
                                      .touchedSection!.touchedSectionIndex !=
                                  -1) {
                            hoveredIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          } else {
                            hoveredIndex = null;
                          }
                        });
                      },
                    )))),
            Positioned(
              child: Text(
                totalVehicle.toString(),
                style: TextStyles.headingBold1,
              ),
            ),
            if (hoveredIndex != null)
              Align(
                child: TooltipBox(
                  color: vehicleSummary.keys.elementAt(hoveredIndex!).color,
                  text:
                      "${vehicleSummary.keys.elementAt(hoveredIndex!).title} : ${vehicleSummary.values.elementAt(hoveredIndex!)}",
                ),
              ),
          ],
        ),
        Center(
          child: Wrap(
              spacing: 10.0,
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 8.0,
              children: VehicleType.values.map((item) {
                return SizedBox(
                  width: 180,
                  child: Row(
                    children: [
                      Container(
                        width: 14.0,
                        height: 14.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: item.color),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        item.title,
                        style: TextStyles.caption,
                      )
                    ],
                  ),
                );
              }).toList()),
        ),
        Column(children: [
          const Padding(
              padding: EdgeInsets.only(top: 28, bottom: 8.0),
              child: Row(
                children: [
                  Text(
                    "รถที่ทำความเร็วเกินกำหนด",
                    style:
                        TextStyles.bodyBold,
                  ),
                ],
              )),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ปริมาณรถ",
                style: TextStyles.bodyBold,
              ),
              Text(
                "จำนวน",
                style: TextStyles.bodyBold,
              )
            ],
          ),
          ...vehicleSummary.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key.title),
                  Text("${entry.value.toString()} คัน"),
                ],
              ),
            );
          }),
        ])
      ]),
    );
  }
}
