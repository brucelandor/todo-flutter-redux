import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";
import "package:redux/redux.dart";
import "package:todo/action/action.dart";
import "package:todo/model/model.dart";
import "package:todo/presentation/presentation.dart";

class ViewModel {
  final Store<AppState> store;
  final List<Item> todos;
  ViewModel(this.store, this.todos);

  onAddItem(String body) {
    final action = AddItemAction(body);
    store.dispatch(action);
  }

  onRemoveItem(Item item) {
    final action = RemoveItemAction(item);
    store.dispatch(action);
  }

  onRemoveItems() {
    final action = RemoveItemsAction();
    store.dispatch(action);
  }

  onCompleteItem(item) {
    final action = CompleteItemAction(item);
    store.dispatch(action);
  }
}

class TodoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Todos"),
      ),
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) {
          return ViewModel(store, store.state.todos);
        },
        builder: (BuildContext context, ViewModel vm) {
          return TodoPresentation(
            todos: vm.todos,
            onAddItem: vm.onAddItem,
            onRemoveItem: vm.onRemoveItem,
            onRemoveItems: vm.onRemoveItems,
            onCompleteItem: vm.onCompleteItem,
          );
        },
      ),
    );
  }
}
