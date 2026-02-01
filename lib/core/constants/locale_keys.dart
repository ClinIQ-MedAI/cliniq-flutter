abstract class LocaleKeys {
  // messages.success
  static const messagesSuccessVerificationCodeSent =
      "messages.success.verification_code_sent";
  static const messagesSuccessNewVerificationCodeSent =
      "messages.success.new_verification_code_sent";
  static const messagesSuccessAccountCreatedSuccessfully =
      "messages.success.account_created_successfully";

  // messages.failures
  static const messagesFailuresIncorrectCredentials =
      "messages.failures.incorrect_credentials";
  static const messagesFailuresInactiveUser = "messages.failures.inactive.user";
  static const messagesFailuresUnexpectedError =
      "messages.failures.unexpected_error";
  static const messagesFailuresNationalIdAlreadyExists =
      "messages.failures.national_id_already_exists";
  static const messagesFailuresAccountAlreadyExists =
      "messages.failures.account_already_exists";
  static const messagesFailuresUsernameAlreadyExists =
      "messages.failures.username_already_exists";
  static const messagesFailuresInvalidOrExpiredCode =
      "messages.failures.invalid_or_expired_code";
  static const messagesFailuresInvalidEmail = "messages.failures.invalid_email";
  static const messagesFailuresUserAlreadyActive =
      "messages.failures.user_already_active";
  static const messagesFailuresVerificationCodeNotFound =
      "messages.failures.verification_code_not_found";
  static const messagesFailuresResetTokenExpired =
      "messages.failures.reset_token_expired";

  // validation
  static const validationFieldIsRequired = "validation.field_is_required";
  static const validationEmailIsRequired = "validation.email_is_required";
  static const validationInvalidEmail = "validation.invalid_email";
  static const validationPasswordIsRequired = "validation.password_is_required";
  static const validationPasswordTooShort = "validation.password_too_short";
  static const validationPhoneIsRequired = "validation.phone_is_required";
  static const validationInvalidPhone = "validation.invalid_phone";
  static const validationAgeIsRequired = "validation.age_is_required";
  static const validationInvalidAge = "validation.invalid_age";
  static const validationAgeTooYoung = "validation.age_too_young";
  static const validationAgeTooOld = "validation.age_too_old";
  static const validationConfirmPasswordIsRequired =
      "validation.confirm_password_is_required";
  static const validationPasswordsDoNotMatch =
      "validation.passwords_do_not_match";
  static const validationPasswordMustContain6Chars =
      "validation.password_must_contain_6_chars";
  static const validationPasswordMustContainLowercase =
      "validation.password_must_contain_lowercase";
  static const validationPasswordMustContainUppercase =
      "validation.password_must_contain_uppercase";

  static const validationInvalidNationalId = "validation.invalid_national_id";
  static const validationEnterYourEmailToResetPassword =
      "validation.enter_your_email_to_reset_password";
  static const validationGovernorateIsRequired =
      "validation.governorate_is_required";
  static const validationGovernorateTooLong = "validation.governorate_too_long";
  static const validationPasswordMustContainNumber =
      "validation.password_must_contain_number";

  // onboarding
  static const onboardingTitle1 = "onboarding.title_1";
  static const onboardingDescription1 = "onboarding.description_1";

  static const onboardingTitle2 = "onboarding.title_2";
  static const onboardingDescription2 = "onboarding.description_2";

  static const onboardingTitle3 = "onboarding.title_3";
  static const onboardingDescription3 = "onboarding.description_3";

  static const onboardingTitle4 = "onboarding.title_4";
  static const onboardingDescription4 = "onboarding.description_4";

  // auth_initial
  static const authInitialLetStart = "auth_initial.let`s_start";
  static const authInitialBestCraftsmenTitle =
      "auth_initial.best_craftsmen_title";
  static const authInitialLoginButton = "auth_initial.login_button";
  static const authInitialCreateAccountButton =
      "auth_initial.create_account_button";
  static const authInitialCreateAccountAgreeText =
      "auth_initial.create_account_agree_text";
  static const authInitialTermsAndConditions =
      "auth_initial.terms_and_conditions";

  // auth_login
  static const authLoginEmailHint = "auth_login.email_hint";
  static const authLoginPasswordHint = "auth_login.password_hint";
  static const authLoginForgotPassword = "auth_login.forgot_password";
  static const authLoginButton = "auth_login.login_button";
  static const authLoginSignUp = "auth_login.sign_up";
  static const authLoginDontHaveAnAccount = "auth_login.dont_have_an_account";

  // forget_password
  static const authForgetPasswordHelp = "auth_forget_password.help";
  static const authForgetPasswordResetPassword =
      "auth_forget_password.reset_password";
  static const authForgetPasswordEnterEmail =
      "auth_forget_password.enter_email";
  static const authForgetPasswordCodeWillBeSent =
      "auth_forget_password.code_will_be_sent";
  static const authForgetPasswordSendCode = "auth_forget_password.send_code";

  // verify_otp
  static const authVerifyOtpHelp = "auth_verify_otp.help";
  static const authVerifyOtpResetPassword = "auth_verify_otp.reset_password";
  static const authVerifyOtpEnterOtp = "auth_verify_otp.enter_otp";
  static const authVerifyOtpCodeSent = "auth_verify_otp.code_sent";
  static const authVerifyOtpConfirm = "auth_verify_otp.confirm";
  static const authVerifyOtpResendCode = "auth_verify_otp.resend_code";

  // reset_password
  static const authResetPasswordHelp = "auth_reset_password.help";
  static const authResetPasswordResetPassword =
      "auth_reset_password.reset_password";
  static const authResetPasswordEnterNewPassword =
      "auth_reset_password.enter_new_password";
  static const authResetPasswordPassword = "auth_reset_password.password";
  static const authResetPasswordConfirmPassword =
      "auth_reset_password.confirm_password";
  static const authResetPasswordConfirm = "auth_reset_password.confirm";

  // signup/user
  static const signupUserName = "signup.user.name";
  static const signupUserNameHint = "signup.user.name_hint";
  static const signupUserEmail = "signup.user.email";
  static const signupUserEmailHint = "signup.user.email_hint";
  static const signupUserGender = "signup.user.gender";
  static const signupUserGenderHint = "signup.user.gender_hint";
  static const signupUserPhone = "signup.user.phone";
  static const signupUserPhoneHint = "signup.user.phone_hint";
  static const signupUserBirthDate = "signup.user.birth_date";
  static const signupUserBirthDateHint = "signup.user.birth_date_hint";
  static const signupUserPassword = "signup.user.password";
  static const signupUserPasswordHint = "signup.user.password_hint";
  static const signupUserConfirmPassword = "signup.user.confirm_password";
  static const signupUserConfirmPasswordHint =
      "signup.user.confirm_password_hint";
  static const signupUserinticateFingerprint =
      "signup.user.inticate_fingerprint";
  static const signupUserSubmitButton = "signup.user.submit_button";
  static const signupUserAlreadyHaveAccount =
      "signup.user.already_have_account";
  static const signupUserLoginButton = "signup.user.login_button";

  // verify_email
  static const authCreateAccountVerifyEmailTitle =
      "auth_create_account.verify_email.title";
  static const authCreateAccountVerifyEmailEnterCode =
      "auth_create_account.verify_email.enter_code";
  static const authCreateAccountVerifyEmailEnterCodeSent =
      "auth_create_account.verify_email.enter_code_sent";
  static const authCreateAccountVerifyEmailConfirm =
      "auth_create_account.verify_email.confirm";
  static const authCreateAccountVerifyEmailResendCode =
      "auth_create_account.verify_email.resend_code";
  static const authCreateAccountVerifyEmailInvalidCode =
      "auth_create_account.verify_email.invalid_code";
  static const authCreateAccountVerifyEmailSuccessRegistration =
      "auth_create_account.verify_email.success_registration";
}
