import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/extensions/either_extensions.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/features/auth/presentation/providers/get_auth_repo_provider.dart';

final verifyEmailProvider =
    AsyncNotifierProvider.autoDispose<VerifyEmailNotifier, Success?>(
      VerifyEmailNotifier.new,
    );

class VerifyEmailNotifier extends AsyncNotifier<Success?> {
  @override
  Future<Success?> build() async {
    return null;
  }

  Future<void> verifyEmail({
    required String email,
    required String code,
  }) async {
    state = const AsyncLoading();
    await ref
        .read(getAuthRepoProvider)
        .verifyEmail(email: email, code: code)
        .onSuccess((_) async {
          state = const AsyncData(Success());
        })
        .onFailure((l) {
          state = AsyncError(l, StackTrace.current);
        });
  }
}
