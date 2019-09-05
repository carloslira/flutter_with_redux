import 'package:flutter_with_redux/models/app_state.dart';
import 'package:flutter_with_redux/reducers/user_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    user: userReducer(state.user, action),
  );
}
