import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/extensions/either_extensions.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/features/auth/presentation/providers/get_auth_repo_provider.dart';

final verifyResetCodeProvider =
    AsyncNotifierProvider.autoDispose<VerifyResetCodeNotifier, Success?>(
      VerifyResetCodeNotifier.new,
    );

class VerifyResetCodeNotifier extends AsyncNotifier<Success?> {
  @override
  Future<Success?> build() async {
    return null;
  }

  Future<void> verifyResetCode({
    required String email,
    required String code,
  }) async {
    state = const AsyncLoading();
    await ref
        .read(getAuthRepoProvider)
        .verifyResetCode(email: email, code: code)
        .onSuccess((_) async {
          state = const AsyncData(Success());
        })
        .onFailure((l) {
          state = AsyncError(l, StackTrace.current);
        });
  }
}
