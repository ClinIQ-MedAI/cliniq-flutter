import 'package:flutter/material.dart';
import 'package:cliniq/core/constants/storage_keys.dart';
import 'package:cliniq/core/enums/role.dart';
import 'package:cliniq/core/helpers/app_storage_helper.dart';
import 'package:cliniq/features/auth/presentation/widgets/customer_sign_up_body.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late Role selectedRole;

  @override
  void initState() {
    super.initState();
    getUserRole();
  }

  getUserRole() {
    String? role = AppStorageHelper.getString(StorageKeys.userRole);
    if (role != null) {
      selectedRole = Role.values.firstWhere((element) => element.name == role);
    } else {
      selectedRole = Role.user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const CustomerSignUpBody();
  }
}
