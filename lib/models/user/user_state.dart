import 'package:flutter_with_redux/models/user/user.dart';

class UserState {
  ListUsersState list;
  UserDetailsState details;

  UserState({
    this.list,
    this.details,
  });

  factory UserState.initial() => UserState(
    list: ListUsersState.initial(),
    details: UserDetailsState.initial(),
  );
}

class ListUsersState {
  dynamic error;
  bool loading;
  List<User> data;

  ListUsersState({
    this.error,
    this.loading,
    this.data,
  });

  factory ListUsersState.initial() => ListUsersState(
    error: null,
    loading: false,
    data: [],
  );
}

class UserDetailsState {
  dynamic error;
  bool loading;
  UserDetails data;

  UserDetailsState({
    this.error,
    this.loading,
    this.data,
  });

  factory UserDetailsState.initial() => UserDetailsState(
    error: null,
    loading: false,
    data: null,
  );
}
