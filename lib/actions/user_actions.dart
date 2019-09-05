import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';

import 'package:flutter_with_redux/models/app_state.dart';


const LIST_USERS_REQUEST = 'LIST_USERS_REQUEST';
const LIST_USERS_SUCCESS = 'LIST_USERS_SUCCESS';
const LIST_USERS_FAILURE = 'LIST_USERS_FAILURE';

RSAA getUsersRequest() {
  return
    RSAA(
      method: 'GET',
      endpoint: 'http://jsonplaceholder.typicode.com/users',
      types: [
        LIST_USERS_REQUEST,
        LIST_USERS_SUCCESS,
        LIST_USERS_FAILURE,
      ],
      headers: {
        'Content-Type': 'application/json',
      },
    );
}

ThunkAction<AppState> getUsers() => (Store<AppState> store) => store.dispatch(getUsersRequest());


const GET_USER_DETAILS_REQUEST = 'GET_USER_DETAILS_REQUEST';
const GET_USER_DETAILS_SUCCESS = 'GET_USER_DETAILS_SUCCESS';
const GET_USER_DETAILS_FAILURE = 'GET_USER_DETAILS_FAILURE';

RSAA getUserDetailsRequest(int id) {
  return
    RSAA(
      method: 'GET',
      endpoint: 'http://jsonplaceholder.typicode.com/users/$id',
      types: [
        GET_USER_DETAILS_REQUEST,
        GET_USER_DETAILS_SUCCESS,
        GET_USER_DETAILS_FAILURE,
      ],
      headers: {
        'Content-Type': 'application/json',
      },
    );
}

ThunkAction<AppState> getUserDetails(int id) => (Store<AppState> store) => store.dispatch(getUserDetailsRequest(id));
