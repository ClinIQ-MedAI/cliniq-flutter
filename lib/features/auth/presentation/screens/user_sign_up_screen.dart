import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/widgets/custom_modal_progress_hud.dart';
import 'package:cliniq/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/user_sign_up_body.dart';

class UserSignUpScreen extends ConsumerWidget {
  const UserSignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomModalProgressHUD(
      inAsyncCall: ref.watch(signUpProvider).isLoading,
      child: const UserSignUpBody(),
    );
  }
}
