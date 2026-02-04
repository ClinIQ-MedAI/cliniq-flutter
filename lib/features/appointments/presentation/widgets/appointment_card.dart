import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});

  final ExaminationAppointmentEntity appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: context.theme.dividerColor.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.primary.withOpacity(0.1),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: appointment.doctorImage,
                width: 60.w,
                height: 60.w,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.doctorName,
                  style: AppTextStyles.getTextStyle(16).copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.textPalette.primaryColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  appointment.doctorSpeciality,
                  style: AppTextStyles.getTextStyle(
                    13,
                  ).copyWith(color: context.textPalette.secondaryColor),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 14,
                      color: context.colorScheme.primary,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      appointment.appointmentDate,
                      style: AppTextStyles.getTextStyle(
                        12,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 12.w),
                    Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: context.colorScheme.primary,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      appointment.appointmentTime,
                      style: AppTextStyles.getTextStyle(
                        12,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: appointment.appointmentStatus == 'Upcoming'
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              appointment.appointmentStatus,
              style: AppTextStyles.getTextStyle(10).copyWith(
                color: appointment.appointmentStatus == 'Upcoming'
                    ? Colors.blue
                    : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
