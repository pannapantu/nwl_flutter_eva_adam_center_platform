import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/models/announcement_model.dart';
import 'package:widgets_test/theme/color.dart';

class ListNewsCard extends ConsumerWidget {
  const ListNewsCard({
    super.key,
    required this.item,
  });

  final Announcement item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14.0),
      shadowColor: AppColor.mainMenuShadow,
      elevation: 2.0,
      color: const Color(0xFFf5f5f5),
      shape:
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "${item.id}. ${item.caption}",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
