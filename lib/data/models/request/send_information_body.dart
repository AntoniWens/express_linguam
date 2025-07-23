class SendInformationBody {
  final String userId;
  final String username;
  final String email;
  final String phone;
  final String phoneReferral;
  final String pesanEmail;
  final String pesanWa;
  final String kirimEmail;
  final String kirimWa;

  SendInformationBody({
    required this.userId,
    required this.username,
    required this.email,
    required this.phone,
    required this.phoneReferral,
    required this.pesanEmail,
    required this.pesanWa,
    required this.kirimEmail,
    required this.kirimWa,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'phone': phone,
      'phone_referral': phoneReferral,
      'pesan_email': pesanEmail,
      'pesan_wa': pesanWa,
      'kirim_email': kirimEmail,
      'kirim_wa': kirimWa,
    };
  }
}
