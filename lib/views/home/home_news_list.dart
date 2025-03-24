import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/viewmodels/announcement/announcement_viewmodel.dart';
import 'package:widgets_test/viewmodels/home/home_viewmodel.dart';
import 'package:widgets_test/models/announcement_model.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/widgets/common/pagination.dart';
import 'package:widgets_test/widgets/list_news_card.dart';

class HomeNewsList extends ConsumerWidget {
  const HomeNewsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);
    final announcementState = ref.watch(announcementViewModelProvider);
    // final homeController = Provider.of<HomeController>(context);
    // final announcementController = Provider.of<AnnouncementController>(context);
    List<Announcement> paginatedNews =
        ref.read(homeViewModelProvider.notifier).getPaginatedNews();
    final changePage = ref.read(homeViewModelProvider.notifier).changePage;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
              color: AppColor.whitePrimary,
              borderRadius: BorderRadius.circular(10.0)),
          width: double.infinity,
          child: Column(
            children: [
              //Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ข่าวประกาศจาก Network link",
                    style: TextStyles.heading3,
                  ),
                  Icon(
                    Icons.favorite_border,
                    size: 22.0,
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              //List of News
              SizedBox(
                height: 400.0,
                child: ListView.builder(
                  itemCount: paginatedNews.length,
                  itemBuilder: (context, index) {
                    final item = paginatedNews[index];
                    return ListNewsCard(item: item);
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),

              Pagination(
                itemLength: announcementState.announcements.length,
                itemPerPage: homeState.itemPerPage,
                changePage: changePage,
                currentPage: homeState.currentPage,
              ),
            ],
          )),
    );
  }
}
