import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class Dto with _$Dto {
  const factory Dto.user({
    @JsonKey(name: 'userid') required String userid,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
    @JsonKey(name: 'commercial_status') required int commercialStatus,
    @JsonKey(name: 'cell_no') required String cellNo,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'city') required String city,
    @JsonKey(name: 'province') required String province,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'gps_lat') required double gpsLat,
    @JsonKey(name: 'gps_lng') required double gpsLng,
    @Default(true) bool active,
    @JsonKey(name: 'manufacture') String? manufacture,
    @JsonKey(name: 'android_version') String? apiVersion,
    @JsonKey(name: 'apps_version') String? appVersion,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'expired_date') DateTime? expiredDate,
    @JsonKey(name: 'nama_lembaga') String? namaLembaga,
    @JsonKey(name: 'lembaga_internal') int? lembagaInternal,
    @JsonKey(name: 'jenis_login') required String jenisLogin,
    @JsonKey(name: 'datecreate') DateTime? dateCreated,
    @JsonKey(name: 'expired_date_cc') DateTime? expiredDateCc,
    @JsonKey(name: 'nohp_referral') required String nohpReferral,
  }) = User;

  factory Dto.fromJson(Map<String, dynamic> json) => _$DtoFromJson(json);
}