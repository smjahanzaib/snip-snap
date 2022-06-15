import 'package:flutter/material.dart';

class SearchTabModel {
  SearchTabModel(
    this.id,
    this.globalKey,
    this.label,
  );

  factory SearchTabModel.fromJson(Map<String, dynamic> json) {
    return SearchTabModel(
      json['id'] as int ?? 0,
      json['globalKey'] as GlobalKey,
      json['label'] as String ?? '',
    );
  }

  final int id;
  final GlobalKey globalKey;
  final String label;
}
