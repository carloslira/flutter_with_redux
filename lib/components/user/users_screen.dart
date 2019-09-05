import 'package:flutter/material.dart';

import 'package:redux/redux.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_with_redux/models/app_state.dart';
import 'package:flutter_with_redux/models/user/user_state.dart';

import 'package:flutter_with_redux/actions/user_actions.dart';

import 'package:flutter_with_redux/components/user/users_list.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UsersScreenProps>(
      converter: (store) => mapStateToProps(store),
      builder: (context, props) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Users list'),
          ),
          body: UsersList(
            onInit: props.getUsers,
          ),
        );
      },
    );
  }
}

class UsersScreenProps {
  final Function getUsers;
  final ListUsersState listResponse;

  UsersScreenProps({
    this.getUsers,
    this.listResponse,
  });
}

UsersScreenProps mapStateToProps(Store<AppState> store) {
  return UsersScreenProps(
    listResponse: store.state.user.list,
    getUsers: () => store.dispatch(getUsers()),
  );
}
