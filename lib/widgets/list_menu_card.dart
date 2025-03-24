import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_viewmodel.dart';
import 'package:widgets_test/models/main_menu_model.dart';
import 'package:widgets_test/theme/color.dart';

class ListMenuCard extends ConsumerStatefulWidget {
  const ListMenuCard({
    super.key,
    required this.item,
  });

  final MainMenu item;

  @override
  ConsumerState<ListMenuCard> createState() => _ListMenuCardState();
}

class _ListMenuCardState extends ConsumerState<ListMenuCard> {
  bool _isListMenuCardHovered = false;

  @override
  Widget build(BuildContext context) {
    final mainMenuState = ref.watch(mainMenuViewModelProvider);
    // final mainMenuController = Provider.of<MainMenuController>(context);
    return Stack(
      children: [
        SizedBox(
          width: 200.0,
          child: Material(
            child: InkWell(
              onHover: (value) {
                setState(() {
                  _isListMenuCardHovered = value;
                });
              },
              onTap: () {
                if (widget.item.listOfSidebarMenu!.isNotEmpty) {
                  ref.read(mainMenuViewModelProvider.notifier).selectNewMenu(
                      widget.item.title,
                      widget.item.listOfSidebarMenu!,
                      context);
                }
              },
              child: Card(
                elevation: 2.0,
                color: mainMenuState.selectedMainMenu == widget.item.title
                    ? AppColor.brandPrimaryColor
                    : _isListMenuCardHovered
                        ? AppColor.cardHover
                        : AppColor.cardColor,
                shape: ContinuousRectangleBorder(
                    side: const BorderSide(
                        color: Color.fromARGB(82, 82, 82, 2), width: 0.5),
                    borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(widget.item.icon,
                          size: 64.0,
                          color: mainMenuState.selectedMainMenu ==
                                  widget.item.title
                              ? AppColor.whitePrimary
                              : AppColor.blackPrimary),
                      Text(
                        widget.item.title,
                        style: TextStyle(
                            color: mainMenuState.selectedMainMenu ==
                                    widget.item.title
                                ? AppColor.whitePrimary
                                : AppColor.blackPrimary),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 6.0,
          top: 2.0,
          child: IconButton(
            onPressed: () {
              setState(() {
                widget.item.isFavorite = !widget.item.isFavorite;
              });
            },
            icon: widget.item.isFavorite
                ? Icon(
                    Icons.favorite,
                    color: mainMenuState.selectedMainMenu == widget.item.title
                        ? AppColor.whitePrimary
                        : AppColor.blackPrimary,
                    size: 20.0,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: mainMenuState.selectedMainMenu == widget.item.title
                        ? AppColor.whitePrimary
                        : AppColor.blackPrimary,
                    size: 20.0,
                  ),
          ),
        )
      ],
    );
  }
}
