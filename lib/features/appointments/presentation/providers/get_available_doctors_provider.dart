import 'package:cliniq/features/appointments/presentation/providers/appointments_repo_provider.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAvailableDoctorsProvider =
    FutureProvider.family<List<ExaminationAppointmentEntity>, String>((
      ref,
      date,
    ) async {
      final repo = ref.watch(appointmentsRepoProvider);
      final result = await repo.getAvailableDoctors(date);
      return result.fold(
        (failure) => throw failure.message,
        (doctors) => doctors,
      );
    });
