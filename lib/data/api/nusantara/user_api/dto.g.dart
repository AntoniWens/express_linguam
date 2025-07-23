// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userid: json['userid'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      commercialStatus: (json['commercial_status'] as num).toInt(),
      cellNo: json['cell_no'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      country: json['country'] as String,
      gpsLat: (json['gps_lat'] as num).toDouble(),
      gpsLng: (json['gps_lng'] as num).toDouble(),
      active: json['active'] as bool? ?? true,
      manufacture: json['manufacture'] as String?,
      apiVersion: json['android_version'] as String?,
      appVersion: json['apps_version'] as String?,
      avatar: json['avatar'] as String?,
      expiredDate: json['expired_date'] == null
          ? null
          : DateTime.parse(json['expired_date'] as String),
      namaLembaga: json['nama_lembaga'] as String?,
      lembagaInternal: (json['lembaga_internal'] as num?)?.toInt(),
      jenisLogin: json['jenis_login'] as String,
      dateCreated: json['datecreate'] == null
          ? null
          : DateTime.parse(json['datecreate'] as String),
      expiredDateCc: json['expired_date_cc'] == null
          ? null
          : DateTime.parse(json['expired_date_cc'] as String),
      nohpReferral: json['nohp_referral'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'commercial_status': instance.commercialStatus,
      'cell_no': instance.cellNo,
      'address': instance.address,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'gps_lat': instance.gpsLat,
      'gps_lng': instance.gpsLng,
      'active': instance.active,
      'manufacture': instance.manufacture,
      'android_version': instance.apiVersion,
      'apps_version': instance.appVersion,
      'avatar': instance.avatar,
      'expired_date': instance.expiredDate?.toIso8601String(),
      'nama_lembaga': instance.namaLembaga,
      'lembaga_internal': instance.lembagaInternal,
      'jenis_login': instance.jenisLogin,
      'datecreate': instance.dateCreated?.toIso8601String(),
      'expired_date_cc': instance.expiredDateCc?.toIso8601String(),
      'nohp_referral': instance.nohpReferral,
    };
