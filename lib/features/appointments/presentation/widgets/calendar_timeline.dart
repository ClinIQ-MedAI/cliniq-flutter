import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CalendarTimeline extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const CalendarTimeline({super.key, required this.onDateSelected});

  @override
  State<CalendarTimeline> createState() => _CalendarTimelineState();
}

class _CalendarTimelineState extends State<CalendarTimeline> {
  DateTime selectedDate = DateTime.now();
  late List<DateTime> days;

  @override
  void initState() {
    super.initState();
    _generateDays();
  }

  void _generateDays() {
    // Generate 30 days starting from today
    final now = DateTime.now();
    days = List.generate(30, (index) => now.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          final day = days[index];
          final isSelected = DateUtils.isSameDay(day, selectedDate);

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = day;
              });
              widget.onDateSelected(day);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 55.w,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(30.r),
                border: isSelected
                    ? null
                    : Border.all(
                        color: Theme.of(context).dividerColor.withOpacity(0.1),
                      ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(day),
                    style: AppTextStyles.getTextStyle(12).copyWith(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? Colors.white : Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      day.day.toString(),
                      style: AppTextStyles.getTextStyle(14).copyWith(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
