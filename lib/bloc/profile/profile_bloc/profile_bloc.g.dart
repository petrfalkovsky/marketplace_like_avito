// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ProfileStateCopyWith on ProfileState {
  ProfileState copyWith({
    String? error,
    ProfileStatus? status,
    ProfileSwitcher? switcher,
    UserInfoModel? user,
  }) {
    return ProfileState(
      error: error ?? this.error,
      status: status ?? this.status,
      switcher: switcher ?? this.switcher,
      user: user ?? this.user,
    );
  }

  ProfileState copyWithNull({
    bool user = false,
  }) {
    return ProfileState(
      error: error,
      status: status,
      switcher: switcher,
      user: user == true ? null : this.user,
    );
  }
}
