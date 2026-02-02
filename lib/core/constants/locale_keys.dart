abstract class LocaleKeys {
  // messages.success
  static const messagesSuccessVerificationCodeSent =
      "messages.success.verification_code_sent";
  static const messagesSuccessNewVerificationCodeSent =
      "messages.success.new_verification_code_sent";
  static const messagesSuccessAccountCreatedSuccessfully =
      "messages.success.account_created_successfully";
  static const messagesSuccessAccountVerifiedSuccessfully =
      "messages.success.account_verified_successfully";

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
  static const messagesFailuresInvalidVerificationCode =
      "messages.failures.invalid_verification_code";

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
  static const validationBirthDateIsRequired =
      "validation.birth_date_is_required";
  static const validationInvalidBirthDate = "validation.invalid_birth_date";

  // onboarding
  static const onboardingTitle1 = "onboarding.title_1";
  static const onboardingDescription1 = "onboarding.description_1";
  static const onboardingTitle2 = "onboarding.title_2";
  static const onboardingDescription2 = "onboarding.description_2";
  static const onboardingTitle3 = "onboarding.title_3";
  static const onboardingDescription3 = "onboarding.description_3";
  static const onboardingTitle4 = "onboarding.title_4";
  static const onboardingDescription4 = "onboarding.description_4";

  // auth_login
  static const authLoginEmailHint = "auth_login.email_hint";
  static const authLoginPasswordHint = "auth_login.password_hint";
  static const authLoginForgotPassword = "auth_login.forgot_password";
  static const authLoginButton = "auth_login.login_button";
  static const authLoginSignUp = "auth_login.sign_up";
  static const authLoginDontHaveAnAccount = "auth_login.dont_have_an_account";

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
  static const signupUserBirthDateButton = "signup.user.birth_date_button";
  static const signupUserLoginButton = "signup.user.login_button";

  // verify_email
  static const verifyEmailEnterCode = "verify_email.enter_code";
  static const verifyEmailCodeSent = "verify_email.code_sent";
  static const verifyEmailResendCode = "verify_email.resend_code";
  static const verifyEmailVerifyOtp = "verify_email.verify_otp";
  static const verifyEmailDidntReceiveCode = "verify_email.didnt_receive_code";

  // forget_password
  static const forgetPasswordForgetPassword = "forget_password.forget_password";
  static const forgetPasswordEmail = "forget_password.email";
  static const forgetPasswordEmailHint = "forget_password.email_hint";
  static const forgetPasswordSendOtp = "forget_password.send_otp";

  // verify_otp
  static const verifyOtpEnterCode = "verify_otp.enter_code";
  static const verifyOtpCodeSent = "verify_otp.code_sent";
  static const verifyOtpResendCode = "verify_otp.resend_code";
  static const verifyOtpDidntReceiveCode = "verify_otp.didnt_receive_code";
  static const verifyOtpVerifyOtp = "verify_otp.verify_otp";

  // reset_password
  static const resetPasswordSetNewPassword = "reset_password.set_new_password";
  static const resetPasswordPasswordHint = "reset_password.password_hint";
  static const resetPasswordConfirmPasswordHint =
      "reset_password.confirm_password_hint";
  static const resetPasswordReset = "reset_password.reset";
}
