class Wrapper<T> {
  final String status;
  final String message;
  final T? data;

  Wrapper({
    required this.status,
    required this.message,
    this.data,
  });

  factory Wrapper.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) {
    return Wrapper<T>(
      status: json['status'].toString(),
      message: json['msg'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(
      Object? Function(T value) toJsonT,
      ) {
    return {
      'status': status,
      'msg': message,
      'data': data != null ? toJsonT(data as T) : null,
    };
  }
}
