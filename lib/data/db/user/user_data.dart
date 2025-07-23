import 'package:express_lingua/data/db/user/user_data_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_data.dart';

part 'user_data.freezed.dart';

@freezed
sealed class UserData with _$UserData {
  const factory UserData.user(UserDataUser user) = _UserDataUser;
}