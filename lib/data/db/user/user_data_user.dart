import 'package:floor/floor.dart';

@Entity(tableName: 'user')
class UserDataUser {
  @primaryKey
  final String userid;
  final String username;
  final String email;
  final String password;
  final int commercialStatus;
  final String cellNo;
  final String address;
  final String city;
  final String province;
  final String country;
  final double gpsLat;
  final double gpsLng;
  final bool active;
  final String manufacture;
  final String apiVersion;
  final String appVersion;
  final String avatar;
  final DateTime? expiredDate;
  final String? namaLembaga;
  final int? lembagaInternal;
  final String? jenisLogin;
  final DateTime? dateCreated;
  final DateTime? expiredDateCc;
  final String nohpReferral;

  UserDataUser({
    required this.userid,
    required this.username,
    required this.email,
    required this.password,
    required this.commercialStatus,
    required this.cellNo,
    required this.address,
    required this.city,
    required this.province,
    required this.country,
    required this.gpsLat,
    required this.gpsLng,
    required this.active,
    required this.manufacture,
    required this.apiVersion,
    required this.appVersion,
    required this.avatar,
    required this.expiredDate,
    required this.namaLembaga,
    required this.lembagaInternal,
    required this.jenisLogin,
    required this.dateCreated,
    required this.expiredDateCc,
    required this.nohpReferral,
  });
}
