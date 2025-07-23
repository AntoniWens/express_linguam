class GenerateOtpBody {
  final String userId;
  final String email;
  final String username;
  final String password;
  final String nohp;

  GenerateOtpBody({
    required this.userId,
    required this.email,
    required this.username,
    required this.password,
    required this.nohp,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'username': username,
      'password': password,
      'nohp': nohp,
    };
  }
}
