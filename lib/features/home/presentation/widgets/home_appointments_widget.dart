import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppointmentsWidget extends StatelessWidget {
  const HomeAppointmentsWidget({super.key, required this.appointments});

  final List<ExaminationAppointmentEntity> appointments;

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.homeExaminationAppointments.tr(),
                style: AppTextStyles.getTextStyle(18).copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.textPalette.primaryColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.calendar_month_rounded,
                  color: context.colorScheme.primary,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        const VerticalGap(16),
        SizedBox(
          height: 140.h,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: appointments.length,
            padEnds: false,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.colorScheme.primary,
                      context.colorScheme.primary.withValues(alpha: 0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.primary.withValues(
                        alpha: 0.25,
                      ),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: appointment.doctorImage,
                          width: 64.w,
                          height: 64.w,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.white24,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            appointment.doctorName,
                            style: AppTextStyles.getTextStyle(16).copyWith(
                              fontWeight: FontWeight.w700,
                              color: context.colorScheme.onPrimary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const VerticalGap(4),
                          Text(
                            appointment.doctorSpeciality,
                            style: AppTextStyles.getTextStyle(13).copyWith(
                              color: context.colorScheme.onPrimary.withValues(
                                alpha: 0.9,
                              ),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const VerticalGap(12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: context.textPalette.primaryColor
                                  .withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  color: context.colorScheme.onPrimary,
                                  size: 14,
                                ),
                                const HorizontalGap(6),
                                Text(
                                  '${appointment.appointmentDate} • ${appointment.appointmentTime}',
                                  style: AppTextStyles.getTextStyle(12)
                                      .copyWith(
                                        color: context.colorScheme.onPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
