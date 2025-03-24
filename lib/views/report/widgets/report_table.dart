import 'package:flutter/material.dart';
import 'package:widgets_test/models/report_table_model.dart';
import 'package:widgets_test/theme/color.dart';

TableRow reportTable(int index, ReportTable item) {
  return TableRow(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColor.evenColumn : AppColor.oddColumn,
      ),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              (index + 1).toString(),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              item.vehicleType.icon,
              size: 22.0,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.vehicleType.title,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.suggestedLane.toString(),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.usedLane.toString(),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "${item.usedSpeed.toString()} / ${item.suggestedSpeed.toString()}",
              textAlign: TextAlign.start,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.fraudType.title,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.registrationNumber,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              item.registrationImage,
              width: 40.0,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              item.carImage,
              width: 40.0,
            ),
          ),
        ),
      ]);
}
