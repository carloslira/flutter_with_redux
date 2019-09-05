import 'package:meta/meta.dart';

import 'package:flutter_with_redux/models/user/user_state.dart';

@immutable
class AppState {
  final UserState user;

  AppState({
    this.user,
  });

  factory AppState.initial() => AppState(
    user: UserState.initial(),
  );

  AppState copyWith({
    UserState user,
  }) {
    return AppState(
      user: user ?? this.user,
    );
  }
}
