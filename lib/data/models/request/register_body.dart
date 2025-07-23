class RegisterBody {
  final String userid;
  final String username;
  final String email;
  final String password;
  final String commercial;
  final String phone;
  final String address;
  final String city;
  final String province;
  final String country;
  final String latitude;
  final String longitude;
  final String? jenisLogin;
  final String nohpReferral;

  RegisterBody({
    required this.userid,
    required this.username,
    required this.email,
    required this.password,
    required this.commercial,
    required this.phone,
    required this.address,
    required this.city,
    required this.province,
    required this.country,
    required this.latitude,
    required this.longitude,
    this.jenisLogin,
    required this.nohpReferral,
  });

  Map<String, String?> toJson() {
    return {
      'userid': userid,
      'username': username,
      'email': email,
      'password': password,
      'commercial_status': commercial,
      'cell_no': phone,
      'address': address,
      'city': city,
      'province': province,
      'country': country,
      'gps_latitude': latitude,
      'gps_longitude': longitude,
      'jenis_login': jenisLogin,
      'nohp_referral': nohpReferral,
    };
  }

  factory RegisterBody.fromJson(Map<String, dynamic> json) {
    return RegisterBody(
      userid: json['userid'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      commercial: json['commercial'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      province: json['province'] ?? '',
      country: json['country'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      jenisLogin: json['jenisLogin'] ?? '',
      nohpReferral: json['nohpReferral'] ?? '',
    );
  }
}
