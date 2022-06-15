import 'package:equatable/equatable.dart';

class ButtonGroupModel extends Equatable {
  const ButtonGroupModel({
    this.id,
    this.label,
  });

  factory ButtonGroupModel.fromJson(Map<String, dynamic> json) {
    return ButtonGroupModel(
      id: json['id'] as String ?? '',
      label: json['label'] as String ?? '',
    );
  }

  final String id;
  final String label;

  @override
  List<Object> get props => <String>[id];
}
