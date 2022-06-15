import 'package:flutter/material.dart';

class ToolbarOptionModel {
  ToolbarOptionModel(
    this.code,
    this.label,
    this.icon,
  );

  factory ToolbarOptionModel.fromJson(Map<String, dynamic> json) {
    return ToolbarOptionModel(
      json['code'] as String ?? '',
      json['label'] as String ?? '',
      json['icon'] as IconData ?? Icons.help,
    );
  }

  final String code;
  final String label;
  final IconData icon;

  @override
  String toString() => 'ToolbarOptionModel<code: $code, label: $label>';
}
