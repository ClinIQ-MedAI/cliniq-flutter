class UserSignUpRequestEntity {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;
  final String nationalId;

  const UserSignUpRequestEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.nationalId,
  });
}
