class UserProfileInfoWidgetModel {
  final String userId;
  final String avatarUrl;
  final String userFullName;
  final bool? isVerified;
  final DateTime? createdAt;
  final int? countUserSubscribers;
  UserProfileInfoWidgetModel({
    required this.userId,
    required this.avatarUrl,
    required this.userFullName,
    required this.isVerified,
    required this.createdAt,
    required this.countUserSubscribers,
  });
}
