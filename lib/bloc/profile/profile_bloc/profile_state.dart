part of 'profile_bloc.dart';

enum ProfileStatus {
  loading,
  error,
  normal,
}

enum ProfileSwitcher {
  menu,
  profile,
  ads,
  reviews,
  requests,
  wallets,
  settings,
  logout,
}

@CopyWith(generateCopyWithNull: true)
class ProfileState extends Equatable {
  final ProfileStatus status;
  final ProfileSwitcher switcher;
  final UserInfoModel? user;
  final String error;

  ProfileState({
    required this.status,
    required this.switcher,
    this.user,
    this.error = '',
  });

  @override
  List<Object?> get props => [
        status,
        switcher,
        error,
        user,
      ];
}
