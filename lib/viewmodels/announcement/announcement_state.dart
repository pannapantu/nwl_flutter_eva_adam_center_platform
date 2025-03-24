import 'package:widgets_test/models/announcement_model.dart';

class AnnouncementState {
  final List<Announcement> announcements;

  AnnouncementState({required this.announcements});

  AnnouncementState copyWith({
    List<Announcement>? announcements,
  }) {
    return AnnouncementState(
        announcements: announcements ?? this.announcements);
  }
}
