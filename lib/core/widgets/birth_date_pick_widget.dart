import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/utils/validators.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_text_form_field.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthDatePickWidget extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;

  const BirthDatePickWidget({super.key, required this.onDateSelected});

  @override
  State<BirthDatePickWidget> createState() => _BirthDatePickWidgetState();
}

class _BirthDatePickWidgetState extends State<BirthDatePickWidget> {
  final TextEditingController _controller = TextEditingController();
  DateTime? selectedDate;

  void _showCupertinoPicker(BuildContext context) {
    DateTime tempPickedDate = DateTime(2000);

    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (_) {
        return Center(
          child: Container(
            height: 250,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: Column(
              children: [
                Expanded(
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          fontSize: 20,
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      backgroundColor: CupertinoColors.black,
                      initialDateTime: DateTime(2000),
                      minimumDate: DateTime(1900),
                      maximumDate: DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        tempPickedDate = newDate;
                      },
                    ),
                  ),
                ),
                CustomButton(
                  text: LocaleKeys.signupUserBirthDateButton,
                  onPressed: () {
                    setState(() {
                      selectedDate = tempPickedDate;

                      _controller.text = DateFormat(
                        'dd-MM-yyyy',
                      ).format(tempPickedDate);
                    });

                    widget.onDateSelected(tempPickedDate);

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.signupUserBirthDate.tr(),
          style: AppTextStyles.getTextStyle(16).copyWith(
            fontWeight: FontWeight.w600,
            color: context.textPalette.primaryColor,
          ),
        ),
        const VerticalGap(16),
        CustomTextFormField(
          controller: _controller,
          onTap: () => _showCupertinoPicker(context),
          validator: Validators.validateBirthDate,
          hintText: LocaleKeys.signupUserBirthDateHint,
          keyboardType: TextInputType.datetime,
          suffixIcon: Icon(
            Icons.calendar_month,
            color: context.colorScheme.onSurface,
            size: 24,
          ),
          readOnly: true,
          focusedBorderWidth: 0,
        ),
      ],
    );
  }
}
