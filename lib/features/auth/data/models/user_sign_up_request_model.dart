import 'package:cliniq/features/auth/domain/entities/user_sign_up_request_entity.dart';

class UserSignUpRequestModel extends UserSignUpRequestEntity {
  UserSignUpRequestModel({
    required super.name,
    required super.email,
    required super.password,
    required super.passwordConfirm,
    required super.phone,
    required super.gender,
    required super.birthDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': name,
      'email': email,
      'password': password,
      'confirmPassword': passwordConfirm,
      'phone': phone,
      'gender': gender.name,
      'birthDate': birthDate,
    };
  }

  factory UserSignUpRequestModel.fromEntity(UserSignUpRequestEntity entity) {
    return UserSignUpRequestModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
      passwordConfirm: entity.passwordConfirm,
      phone: entity.phone,
      gender: entity.gender,
      birthDate: entity.birthDate,
    );
  }
}
