import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/features/auth/domain/repos/auth_repo.dart';
import 'package:cliniq/core/services/get_it_service.dart';

final getAuthRepoProvider = Provider<AuthRepo>((ref) {
  return getIt<AuthRepo>();
});
