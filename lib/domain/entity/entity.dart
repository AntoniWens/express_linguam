import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';

@freezed
sealed class Entity with _$Entity {
  const factory Entity.user({
    required String userid,
    required String username,
    required String email,
    required String password,
    required int commercial_status,
    required String cell_no,
    required String address,
    required String city,
    required String province,
    required String country,
    required double gps_lat,
    required double gps_lng,
    required bool active,
    required String manufacture,
    required String api_version,
    required String app_version,
    required String avatar,
    DateTime? expired_date,
    String? nama_lembaga,
    int? lembaga_internal,
    String? jenis_login,
    DateTime? datecreated,
    DateTime? expired_date_cc,
    required String nohp_referral,
  }) = User;
}