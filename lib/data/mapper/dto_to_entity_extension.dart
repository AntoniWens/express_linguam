

import '../../domain/entity/entity.dart' as entity;
import '../api/nusantara/user_api/dto.dart';

extension UserDtoMapper on Dto {
  entity.User? toEntity() {
    return when(
      user:
          (
            userid,
            username,
            email,
            password,
            commercialStatus,
            cellNo,
            address,
            city,
            province,
            country,
            gpsLat,
            gpsLng,
            active,
            manufacture,
            apiVersion,
            appVersion,
            avatar,
            expiredDate,
            namaLembaga,
            lembagaInternal,
            jenisLogin,
            dateCreated,
            expiredDateCc,
            nohpReferral,
          ) => entity.User(
            userid: userid,
            username: username,
            email: email,
            password: password,
            commercial_status: commercialStatus,
            cell_no: cellNo,
            address: address,
            city: city,
            province: province,
            country: country,
            gps_lat: gpsLat,
            gps_lng: gpsLng,
            active: active,
            manufacture: manufacture ?? '',
            api_version: apiVersion ?? '',
            app_version: appVersion ?? '',
            avatar: avatar ?? '',
            expired_date: expiredDate,
            nama_lembaga: namaLembaga,
            lembaga_internal: lembagaInternal,
            jenis_login: jenisLogin.isNotEmpty ? jenisLogin : 'Manual',
            datecreated: dateCreated,
            expired_date_cc: expiredDateCc,
            nohp_referral: nohpReferral,
          ),
    );
  }
}
