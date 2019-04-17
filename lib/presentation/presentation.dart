import "package:flutter/material.dart";
import "package:todo/model/model.dart";

class TodoPresentation extends StatelessWidget {
  final List<Item> todos;
  final Function(String body) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;
  final Function(Item) onCompleteItem;

  TodoPresentation({
    this.todos,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems,
    this.onCompleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddItem(onAddItem: onAddItem),
        Expanded(child: TodoList(todos, onRemoveItem, onCompleteItem)),
        RemoveItemsButton(onRemoveItems),
      ],
    );
  }
}

class AddItem extends StatefulWidget {
  final Function(String body) onAddItem;

  AddItem({this.onAddItem});

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = TextEditingController();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: ctrl,
        decoration: InputDecoration(hintText: "add a todo"),
        onSubmitted: (text) {
          widget.onAddItem(text);
          ctrl.text = "";
        });
  }
}

class TodoList extends StatelessWidget {
  final List<Item> todos;
  final void Function(Item) onRemove;
  final void Function(Item) onComplete;

  TodoList(this.todos, this.onRemove, this.onComplete);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: todos
          .map(
            (todo) => ListTile(
                  title: Text(todo.body),
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      onRemove(todo);
                    },
                  ),
                  trailing: Checkbox(
                    value: todo.completed,
                    onChanged: (b) {
                      onComplete(todo);
                    },
                  ),
                ),
          )
          .toList(),
    );
  }
}

class RemoveItemsButton extends StatelessWidget {
  final void Function() onRemoveItems;

  RemoveItemsButton(this.onRemoveItems);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Remove Todos"),
      onPressed: onRemoveItems,
    );
  }
}
