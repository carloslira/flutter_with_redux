import 'package:flutter/material.dart';
import 'package:flutter_with_redux/models/user/user.dart';

import 'package:redux/redux.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_with_redux/models/app_state.dart';
import 'package:flutter_with_redux/models/user/user_state.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserDetailsScreenProps>(
      converter: (store) => mapStateToProps(store),
      builder: (context, props) {
        UserDetails data = props.detailsResponse.data;
        bool loading = props.detailsResponse.loading;

        TextStyle textStyle = TextStyle(
          height: 2,
          fontSize: 20,
        );

        Widget body;
        if (loading) {
          body = Center(
            child: CircularProgressIndicator(),
          );
        } else {
          body = Center(
            child: IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(data.name, style: textStyle),
                  Text(data.email, style: textStyle),
                  Text(data.website, style: textStyle),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('User details'),
          ),
          body: body,
        );
      },
    );
  }
}

class UserDetailsScreenProps {
  final UserDetailsState detailsResponse;

  UserDetailsScreenProps({
    this.detailsResponse,
  });
}

UserDetailsScreenProps mapStateToProps(Store<AppState> store) {
  return UserDetailsScreenProps(
    detailsResponse: store.state.user.details,
  );
}
