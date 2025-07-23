import 'package:express_lingua/domain/entity/entity.dart' as entity;

import '../db/user/user_data_user.dart';
extension EntityUserMapper on entity.User {
  UserDataUser toUserData() {
    return UserDataUser(
      userid: userid,
      username: username,
      email: email,
      password: password,
      commercialStatus: commercial_status,
      cellNo: cell_no,
      address: address,
      city: city,
      province: province,
      country: country,
      gpsLat: gps_lat,
      gpsLng: gps_lng,
      active: active,
      manufacture: manufacture,
      apiVersion: api_version,
      appVersion: app_version,
      avatar: avatar,
      expiredDate: expired_date,
      namaLembaga: nama_lembaga,
      lembagaInternal: lembaga_internal,
      jenisLogin: jenis_login,
      dateCreated: datecreated,
      expiredDateCc: expired_date_cc,
      nohpReferral: nohp_referral,
    );
  }
}
