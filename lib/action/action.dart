import "package:todo/model/model.dart";

class AddItemAction {
  static int _id = 0;
  final String body;

  AddItemAction(this.body) {
    _id++;
  }
  int get id => _id;
}

class RemoveItemAction {
  final Item item;
  RemoveItemAction(this.item);
}

class RemoveItemsAction {}

class CompleteItemAction {
  Item item;
  CompleteItemAction(this.item);
}
