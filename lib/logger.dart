import 'package:redux/redux.dart';

import 'package:redux_api_middleware/redux_api_middleware.dart';

void loggingMiddleware<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is FSA) {
    print('{');
    print('  Action: ${action.type}');

    if (action.payload != null) {
      print('  Payload: ${action.payload}');
    }

    print('}');
  }

  next(action);
}
