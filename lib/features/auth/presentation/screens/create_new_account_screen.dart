import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/widgets/back_help_app_bar.dart';
import 'package:cliniq/core/widgets/custom_modal_progress_hud.dart';
import 'package:cliniq/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:cliniq/features/auth/presentation/providers/verify_email_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/create_new_account_body.dart';

class CreateNewAccountScreen extends ConsumerWidget {
  const CreateNewAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomModalProgressHUD(
      inAsyncCall:
          ref.watch(signUpProvider).isLoading ||
          ref.watch(verifyEmailProvider).isLoading,
      child: const Scaffold(
        appBar: BackHelpAppBar(),
        body: CreateNewAccountBody(),
      ),
    );
  }
}
