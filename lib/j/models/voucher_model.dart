import 'package:SnipSnap/data/models/location_model.dart';

enum VoucherStatus {
  active,
  expired,
  redeemed,
  unknown,
}

class VoucherModel {
  VoucherModel(
    this.id,
    this.code,
    this.status,
    this.redemptionDateTime,
    this.dueDateTime,
    this.amount,
    this.service,
    this.specialTerms,
    this.location,
  );

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      json['id'] as int ?? 0,
      json['code'] as String ?? '',
      setStatus(json['status'] as String ?? ''),
      DateTime.tryParse(json['redemption_datetime'] as String ?? '') ??
          DateTime.now(),
      DateTime.tryParse(json['due_datetime'] as String ?? '') ?? DateTime.now(),
      json['amount'] as int ?? 0,
      json['service'] as String ?? '',
      json['special_terms'] as String ?? '',
      LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  static VoucherStatus setStatus(String type) {
    switch (type) {
      case 'active':
        return VoucherStatus.active;
      case 'expired':
        return VoucherStatus.expired;
      case 'redeemed':
        return VoucherStatus.redeemed;
      default:
        return VoucherStatus.unknown;
    }
  }

  static String getStatus(VoucherStatus type) {
    switch (type) {
      case VoucherStatus.active:
        return 'active';
      case VoucherStatus.expired:
        return 'expired';
      case VoucherStatus.redeemed:
        return 'redeemed';
      default:
        return '';
    }
  }

  final int id;
  final String code;
  final VoucherStatus status;
  final DateTime redemptionDateTime;
  final DateTime dueDateTime;
  final int amount;
  final String service;
  final String specialTerms;
  final LocationModel location;
}
