import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part "model.g.dart";

@JsonSerializable()
class AppState {
  @JsonKey(name: "list", defaultValue: <Item>[])
  List<Item> todos;

  AppState({@required this.todos});

  static AppState decode(dynamic json) {
    if (json == null) {
      return AppState.initial();
    }
    var state = AppState.fromJson(json);
    return state;
  }

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(todos: List.unmodifiable(<Item>[]));

  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}

@JsonSerializable()
class Item {
  final int id;
  final String body;
  @JsonKey(name: "completed", defaultValue: false)
  final bool completed;

  static Item decode(dynamic json) {
    return Item.fromJson(json);
  }

  Item({@required this.id, @required this.body, this.completed = false});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
