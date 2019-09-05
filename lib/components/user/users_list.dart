import 'package:flutter/material.dart';

import 'package:redux/redux.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_with_redux/routes.dart';

import 'package:flutter_with_redux/models/app_state.dart';

import 'package:flutter_with_redux/models/user/user.dart';
import 'package:flutter_with_redux/models/user/user_state.dart';

import 'package:flutter_with_redux/actions/user_actions.dart';

class UsersList extends StatefulWidget {
  final void Function() onInit;

  UsersList({@required this.onInit});

  @override
  UsersListState createState() {
    return new UsersListState();
  }
}

class UsersListState extends State<UsersList> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UsersListProps>(
      converter: (store) => mapStateToProps(store),
      builder: (context, props) {
        List<User> data = props.listResponse.data;
        bool loading = props.listResponse.loading;

        Widget body;
        if (loading) {
          body = Center(
            child: new CircularProgressIndicator(),
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

        return body;
      }
    );
  }
}

class UsersListProps {
  final ListUsersState listResponse;
  final Function getUserDetails;

  UsersListProps({
    this.listResponse,
    this.getUserDetails,
  });
}

UsersListProps mapStateToProps(Store<AppState> store) {
  return UsersListProps(
    listResponse: store.state.user.list,
    getUserDetails: (int id) => store.dispatch(getUserDetails(id)),
  );
}
