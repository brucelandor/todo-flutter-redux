// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState(
      todos: (json['list'] as List)
              ?.map((e) =>
                  e == null ? null : Item.fromJson(e as Map<String, dynamic>))
              ?.toList() ??
          []);
}

Map<String, dynamic> _$AppStateToJson(AppState instance) =>
    <String, dynamic>{'list': instance.todos};

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      id: json['id'] as int,
      body: json['body'] as String,
      completed: json['completed'] as bool ?? false);
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'completed': instance.completed
    };
