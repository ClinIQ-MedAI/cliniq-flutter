import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/presentation/screens/booking_screen.dart';
import 'package:cliniq/features/home/domain/entities/doctor_entity.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:cliniq/features/home/presentation/widgets/see_all_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDoctorsWidget extends StatelessWidget {
  const HomeDoctorsWidget({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suggested Doctors',
                style: AppTextStyles.getTextStyle(16).copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.textPalette.primaryColor,
                ),
              ),
              SeeAllButton(
                onPressed: () {},
              ),
            ],
          ),
        ),
        const VerticalGap(16),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return GestureDetector(
                onTap: () {
                  final appointment = ExaminationAppointmentEntity(
                    id: doctor.id,
                    doctorName: doctor.name,
                    doctorSpeciality: doctor.speciality,
                    doctorImage: doctor.image,
                    appointmentDate: DateFormat(
                      'yyyy-MM-dd',
                    ).format(DateTime.now()),
                    appointmentTime: '09:00 AM',
                    appointmentStatus: 'Available',
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingScreen(doctor: appointment),
                    ),
                  );
                },
                child: Container(
                  width: 140.w,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.shadow.withValues(
                          alpha: 0.05,
                        ),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: doctor.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.person),
                          ),
                        ),
                      ),
                      const VerticalGap(8),
                      Text(
                        doctor.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.getTextStyle(14).copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.textPalette.primaryColor,
                        ),
                      ),
                      Text(
                        doctor.speciality,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.getTextStyle(
                          12,
                        ).copyWith(color: context.textPalette.secondaryColor),
                      ),
                      const VerticalGap(4),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            doctor.rating,
                            style: AppTextStyles.getTextStyle(
                              10,
                            ).copyWith(color: context.textPalette.helperColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}