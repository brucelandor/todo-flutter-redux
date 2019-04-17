import "package:redux/redux.dart";
import "package:todo/action/action.dart";
import "package:todo/model/model.dart";

AppState addItemReducer(AppState state, AddItemAction action) {
  var todos = List<Item>.from(state.todos)
    ..add(Item(id: action.id, body: action.body));
  return AppState(todos: todos);
}

AppState removeItemReducer(AppState state, RemoveItemAction action) {
  final newTodos = List<Item>.from(state.todos)..remove(action.item);
  return AppState(todos: newTodos);
}

AppState removeItemsReducer(AppState state, RemoveItemsAction action) {
  return AppState.initial();
}

AppState completeItemReducer(AppState state, CompleteItemAction action) {
  var todos = state.todos.map((item) {
    if (item == action.item) {
      return Item(
          id: action.item.id,
          body: action.item.body,
          completed: !action.item.completed);
    }
    return item;
  }).toList();
  return AppState(todos: todos);
}

AppState appReducer(AppState state, action) {
  final reducer = combineReducers<AppState>([
    TypedReducer<AppState, AddItemAction>(addItemReducer),
    TypedReducer<AppState, RemoveItemAction>(removeItemReducer),
    TypedReducer<AppState, RemoveItemsAction>(removeItemsReducer),
    TypedReducer<AppState, CompleteItemAction>(completeItemReducer),
  ]);
  return reducer(state, action);
}
