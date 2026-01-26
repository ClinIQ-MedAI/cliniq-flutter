import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/widgets/back_help_app_bar.dart';
import 'package:cliniq/core/widgets/custom_modal_progress_hud.dart';
import 'package:cliniq/features/auth/presentation/providers/forget_password_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/forget_password_body.dart';

class ForgetPasswordScreen extends ConsumerWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomModalProgressHUD(
      inAsyncCall: ref.watch(forgetPasswordProvider).isLoading,
      child: const Scaffold(
        appBar: BackHelpAppBar(),
        body: ForgetPasswordBody(),
      ),
    );
  }
}
