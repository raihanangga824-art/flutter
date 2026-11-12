// To parse this JSON data, do
//
//     final todoDart = todoDartFromJson(jsonString);
import 'package:flutter/material.dart';


import 'dart:convert';

List<TodoDart> todoDartFromJson(String str) => List<TodoDart>.from(json.decode(str).map((x) => TodoDart.fromJson(x)));

String todoDartToJson(List<TodoDart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoDart {
    final int userId;
    final int id;
    final String title;
    final bool completed;

    TodoDart({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    factory TodoDart.fromJson(Map<String, dynamic> json) => TodoDart(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
