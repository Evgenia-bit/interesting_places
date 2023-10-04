import 'package:flutter/material.dart';

@immutable
class Category {
  const Category({required this.id, required this.name});
  final int id;
  final String name;
}
