class Api {
// https://development.hamropahal.org/api/auth
  // static final String baseUrl = "https://development.hamropahal.org";
  // static final String imageUrl =

  static final String baseUrl = "https://development2.hamropahal.org";

  static const String prefix = "/api";
  static const String auth = "/auth";
// auth
  static final String signupUrl = "$baseUrl$prefix$auth/register";

  static final String loginUrl = "$baseUrl$prefix$auth/login";
  static final String forgotPassword = "$baseUrl$prefix$auth/forgot-password";
  static final String verifyOTP = "$baseUrl$prefix$auth/verify-otp";
  static final String resetPassword = "$baseUrl$prefix$auth/reset-password";
  static final String changePw = "$baseUrl$prefix$auth/change-password";

  // homepage
  static final String getMoviesCollection = "$baseUrl$prefix/movie/lists";
  static final String movieDetail = "$baseUrl/api/movie/list/#id#";

  // homepage2
  static final String getDate = "$baseUrl$prefix/movie/get-date";

  // -----------------------------
  static final String seatAvailability =
      "$baseUrl$prefix/movie/seat-availability";
}
