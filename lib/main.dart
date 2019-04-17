import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:todo/container/container.dart';
import 'package:todo/model/model.dart';
import 'package:todo/reducer/reducer.dart';

void main() async {
  final persistor = Persistor<AppState>(
    serializer: JsonSerializer<AppState>(AppState.decode),
    storage: SharedPreferencesEngine(),
  );
  final initialState = await persistor.load();
  final store = Store<AppState>(
    appReducer,
    initialState: initialState ?? AppState.initial(),
    middleware: [persistor.createMiddleware()],
  );

  runApp(StoreProvider<AppState>(
    store: store,
    child: MaterialApp(
      title: "todo",
      home: TodoContainer(),
    ),
  ));
}
