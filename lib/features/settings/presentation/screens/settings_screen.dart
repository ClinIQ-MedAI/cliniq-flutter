import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/core/cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:cliniq/core/cubits/app_theme_cubit/app_theme_state.dart';
import 'package:cliniq/core/enums/app_theme_mode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _smsNotifications = false;
  bool _emailNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.settingsUserTitle.tr(),
          style: AppTextStyles.getTextStyle(20).copyWith(
            fontWeight: FontWeight.w700,
            color: context.textPalette.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSection(
              context,
              children: [
                _buildSwitchTile(
                  LocaleKeys.settingsUserPushNotifications.tr(),
                  _pushNotifications,
                  (val) {
                    setState(() => _pushNotifications = val);
                  },
                ),
                _buildDivider(),
                _buildSwitchTile(
                  LocaleKeys.settingsUserSmsNotifications.tr(),
                  _smsNotifications,
                  (val) {
                    setState(() => _smsNotifications = val);
                  },
                ),
                _buildDivider(),
                _buildSwitchTile(
                  LocaleKeys.settingsUserEmailNotifications.tr(),
                  _emailNotifications,
                  (val) {
                    setState(() => _emailNotifications = val);
                  },
                ),
              ],
            ),
            const VerticalGap(20),
            Text(
              'General',
              style: AppTextStyles.getTextStyle(18).copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const VerticalGap(12),
            _buildSection(
              context,
              children: [
                BlocBuilder<AppThemeCubit, AppThemeState>(
                  builder: (context, state) {
                    final themeCubit = context.read<AppThemeCubit>();
                    return _buildSwitchTile(
                      LocaleKeys.settingsUserDarkMode.tr(),
                      themeCubit.currentTheme == AppThemeMode.dark,
                      (val) {
                        themeCubit.changeTheme(
                          val ? AppThemeMode.dark : AppThemeMode.light,
                        );
                      },
                    );
                  },
                ),
                _buildDivider(),
                _buildLanguageTile(context),
              ],
            ),
            const VerticalGap(20),
            _buildSection(
              context,
              children: [
                _buildActionTile(
                  context,
                  LocaleKeys.settingsUserChangePassword.tr(),
                  Icons.lock_outline,
                  onTap: () {},
                ),
                _buildDivider(),
                _buildActionTile(
                  context,
                  LocaleKeys.settingsUserMyLocation.tr(),
                  Icons.location_on_outlined,
                  onTap: () {},
                ),
                _buildDivider(),
                _buildActionTile(
                  context,
                  LocaleKeys.settingsUserChangeNumber.tr(),
                  Icons.phone_android_outlined,
                  onTap: () {},
                ),
                _buildDivider(),
                _buildActionTile(
                  context,
                  LocaleKeys.settingsUserChangeEmail.tr(),
                  Icons.email_outlined,
                  onTap: () {},
                ),
                _buildDivider(),
                _buildActionTile(
                  context,
                  LocaleKeys.settingsUserTwoFactorAuth.tr(),
                  Icons.security_outlined,
                  onTap: () {},
                ),
              ],
            ),
            const VerticalGap(20),
            _buildSection(
              context,
              children: [
                _buildActionTile(
                  context,
                  LocaleKeys.settingsUserPrivacyPolicy.tr(),
                  Icons.privacy_tip_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.privacyPolicyScreen);
                  },
                ),
                _buildDivider(),
                _buildActionTile(
                  context,
                  LocaleKeys.settingsUserTermsAndServices.tr(),
                  Icons.description_outlined,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.termsAndConditionsScreen,
                    );
                  },
                ),
              ],
            ),
            const VerticalGap(20),
            _buildSection(
              context,
              children: [
                _buildActionTile(
                  context,
                  LocaleKeys.settingsUserLogout.tr(),
                  Icons.logout,
                  onTap: () {
                    // Logout Logic
                  },
                  textColor: Colors.red,
                  iconColor: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: AppTextStyles.getTextStyle(
          16,
        ).copyWith(fontWeight: FontWeight.w500),
      ),
      activeColor: Theme.of(context).primaryColor,
    );
  }

  Widget _buildActionTile(
    BuildContext context,
    String title,
    IconData icon, {
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? context.colorScheme.secondary),
      title: Text(
        title,
        style: AppTextStyles.getTextStyle(16).copyWith(
          fontWeight: FontWeight.w500,
          color: textColor ?? context.colorScheme.onBackground,
        ),
      ),
      trailing:
          trailing ??
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, indent: 20, endIndent: 20);
  }

  Widget _buildLanguageTile(BuildContext context) {
    return _buildActionTile(
      context,
      LocaleKeys.settingsUserLanguage.tr(),
      Icons.language_outlined,
      trailing: Text(
        context.locale.languageCode == 'en'
            ? LocaleKeys.settingsUserEnglish.tr()
            : LocaleKeys.settingsUserArabic.tr(),
        style: AppTextStyles.getTextStyle(14).copyWith(color: Colors.grey),
      ),
      onTap: () {
        _showLanguageSelectionDialog(context);
      },
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.settingsUserLanguage.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(LocaleKeys.settingsUserEnglish.tr()),
              trailing: context.locale.languageCode == 'en'
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
              onTap: () {
                context.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(LocaleKeys.settingsUserArabic.tr()),
              trailing: context.locale.languageCode == 'ar'
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
              onTap: () {
                context.setLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
