class EndPoints {
  // Auth
  static const String refreshToken = "Auth/RefreshToken/refresh-token";
  static const String login = "Auth/Login/login";
  static const String userSignUp = "Auth/RegisterCustomer/register/customer";
  static const String doctorSignUp = "Auth/RegisterDoctor/register/doctor";
  static const String logOut = "Auth/Logout/logout";

  static const String verifyEmail = "Auth/VerifyEmail/verify";
  static const String resendVerifyEmail =
      "Auth/ResendVerification/resend-verification";

  static const String forgetPassword = "Auth/ForgotPassword/forgot-password";
  static const String resetPassword = "Auth/ResetPassword/reset-password";
  static const String verifyResetCode =
      "Auth/VerifyResetCode/verify-reset-code";
  static const String resendResetCode =
      "Auth/ResendResetCode/resend-reset-code";

  static const String getMe = "Auth/GetCurrentUser/me";
}
