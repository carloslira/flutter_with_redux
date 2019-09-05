import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_with_redux/logger.dart';
import 'package:flutter_with_redux/routes.dart';

import 'package:flutter_with_redux/models/app_state.dart';
import 'package:flutter_with_redux/reducers/app_reducer.dart';

import 'package:flutter_with_redux/components/user/users_screen.dart';
import 'package:flutter_with_redux/components/user/user_details_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware, apiMiddleware, loggingMiddleware],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: this.store,
      child: MaterialApp(
        title: "Flutter with redux",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.users: (context) => UsersScreen(),
          AppRoutes.userDetails: (context) => UserDetailsScreen(),
        },
      ),
    );
  }
}
