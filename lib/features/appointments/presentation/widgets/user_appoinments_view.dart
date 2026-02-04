import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/presentation/widgets/appointment_card.dart';
import 'package:cliniq/features/appointments/presentation/widgets/calendar_timeline.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAppointmentsView extends ConsumerStatefulWidget {
  const UserAppointmentsView({super.key});

  @override
  ConsumerState<UserAppointmentsView> createState() =>
      _UserAppointmentsViewState();
}

class _UserAppointmentsViewState extends ConsumerState<UserAppointmentsView> {
  DateTime selectedDate = DateTime.now();
  String selectedStatus = 'Upcoming';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.bookingTitle.tr(),
          style: AppTextStyles.getTextStyle(
            20,
          ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: context.colorScheme.primary,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const VerticalGap(20),
          // First thing: Horizontal Calendar
          CalendarTimeline(
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          const VerticalGap(24),
          // Second thing: Status Toggle (Assuming this is the second thing)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: context.colorScheme.onSurface.withOpacity(0.05),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: [
                  _buildStatusItem('Upcoming'),
                  _buildStatusItem('Completed'),
                  _buildStatusItem('Cancelled'),
                ],
              ),
            ),
          ),
          const VerticalGap(20),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: 3, // Dummy data for demonstration
              itemBuilder: (context, index) {
                return AppointmentCard(
                  appointment: ExaminationAppointmentEntity(
                    id: index.toString(),
                    doctorName: index % 2 == 0
                        ? 'Dr. Sarah Johnson'
                        : 'Dr. Mohamed Ahmed',
                    doctorSpeciality: index % 2 == 0
                        ? 'Pediatrician'
                        : 'Cardiologist',
                    doctorImage: index % 2 == 0
                        ? 'https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg'
                        : 'https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg',
                    appointmentDate: DateFormat(
                      'yyyy-MM-dd',
                    ).format(selectedDate),
                    appointmentTime: '${10 + index}:30 AM',
                    appointmentStatus: selectedStatus,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem(String status) {
    final isSelected = selectedStatus == status;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedStatus = status;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(21.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: context.colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            status,
            style: AppTextStyles.getTextStyle(13).copyWith(
              color: isSelected
                  ? Colors.white
                  : context.textPalette.secondaryColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
