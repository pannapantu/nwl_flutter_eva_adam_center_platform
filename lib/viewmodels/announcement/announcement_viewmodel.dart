import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_test/models/announcement_model.dart';
import 'package:widgets_test/viewmodels/announcement/announcement_state.dart';

part 'announcement_viewmodel.g.dart';

@riverpod
class AnnouncementViewModel extends _$AnnouncementViewModel {
  @override
  AnnouncementState build() {
    return AnnouncementState(announcements: listOfNews);
  }

  List<Announcement> listOfNews = [
    Announcement(id: 1, caption: loremIpsum(words: 10), link: "/1"),
    Announcement(id: 2, caption: loremIpsum(words: 20), link: "/2"),
    Announcement(id: 3, caption: loremIpsum(words: 30), link: "/3"),
    Announcement(id: 4, caption: loremIpsum(words: 40), link: "/4"),
    Announcement(id: 5, caption: loremIpsum(words: 50), link: "/5"),
    Announcement(id: 6, caption: loremIpsum(words: 60), link: "/6"),
    Announcement(id: 7, caption: loremIpsum(words: 70), link: "/7"),
    Announcement(id: 8, caption: loremIpsum(words: 80), link: "/8"),
    Announcement(id: 9, caption: loremIpsum(words: 90), link: "/9"),
    Announcement(id: 10, caption: loremIpsum(words: 100), link: "/10"),
    Announcement(id: 11, caption: loremIpsum(words: 100), link: "/11"),
    Announcement(id: 12, caption: loremIpsum(words: 100), link: "/12"),
    Announcement(id: 13, caption: loremIpsum(words: 100), link: "/13"),
    Announcement(id: 14, caption: loremIpsum(words: 100), link: "/14"),
    Announcement(id: 15, caption: loremIpsum(words: 100), link: "/15"),
    Announcement(id: 16, caption: loremIpsum(words: 100), link: "/16"),
    Announcement(id: 17, caption: loremIpsum(words: 100), link: "/17"),
    Announcement(id: 18, caption: loremIpsum(words: 100), link: "/18"),
    Announcement(id: 19, caption: loremIpsum(words: 100), link: "/19"),
    Announcement(id: 20, caption: loremIpsum(words: 100), link: "/20"),
  ];
}
