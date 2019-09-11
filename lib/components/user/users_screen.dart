import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

import 'package:flutter_with_redux/routes.dart';

import 'package:flutter_with_redux/models/app_state.dart';

import 'package:flutter_with_redux/models/user/user.dart';
import 'package:flutter_with_redux/models/user/user_state.dart';

import 'package:flutter_with_redux/actions/user_actions.dart';

class UsersScreen extends StatelessWidget {
  void handleInitialBuild(UsersScreenProps props) {
    props.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UsersScreenProps>(
      converter: (store) => mapStateToProps(store),
      onInitialBuild: (props) => this.handleInitialBuild(props),
      builder: (context, props) {
        List<User> data = props.listResponse.data;
        bool loading = props.listResponse.loading;

        Widget body;
        if (loading) {
          body = Center(
            child: CircularProgressIndicator(),
          );
        } else {
          body = ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: data.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, i) {
              User user = data[i];

              return ListTile(
                title: Text(
                  user.name,
                ),
                onTap: () {
                  props.getUserDetails(user.id);
                  Navigator.pushNamed(context, AppRoutes.userDetails);
                },
              );
            },
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Users list'),
          ),
          body: body,
        );
      },
    );
  }
}

class UsersScreenProps {
  final Function getUsers;
  final Function getUserDetails;
  final ListUsersState listResponse;

  UsersScreenProps({
    this.getUsers,
    this.listResponse,
    this.getUserDetails,
  });
}

UsersScreenProps mapStateToProps(Store<AppState> store) {
  return UsersScreenProps(
    listResponse: store.state.user.list,
    getUsers: () => store.dispatch(getUsers()),
    getUserDetails: (int id) => store.dispatch(getUserDetails(id)),
  );
}
