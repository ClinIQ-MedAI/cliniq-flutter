import 'package:cliniq/core/enums/gender.dart';

class UserSignUpRequestEntity {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;
  final String phone;
  final Gender gender;

  const UserSignUpRequestEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.phone,
    required this.gender,
  });
}
