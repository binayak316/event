class Api {
// https://development.hamropahal.org/api/auth
  // static final String baseUrl = "https://development.hamropahal.org";
  // static final String imageUrl =

  static final String baseUrl = "https://development2.hamropahal.org";

  static final String imageUrl = "$baseUrl/";

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
  static final String getAllEvents = "$baseUrl$prefix$auth/getallevent";

  static final String storeEvent = "$baseUrl$prefix$auth/store-event";
  static final String becomeOrganizer = "$baseUrl$prefix$auth/become-organizer";
  static final String eventDetails =
      "$baseUrl$prefix$auth/geteventdetails/#id#";

  static final String myEvents = "$baseUrl$prefix$auth/getorganizerevent";
  static final String getCategories = "$baseUrl$prefix$auth/getallcategory";
  static final String getallevent = "$baseUrl$prefix$auth/getallevent";

  static final String getallvenue = "$baseUrl$prefix$auth/getallvenue";

  static final String bookEvent = "$baseUrl$prefix$auth/book-event";

  static final String searchEvents = "$baseUrl$prefix$auth/searchevent";
  static final String bookedEvents = "$baseUrl$prefix$auth/getorganizerevent";
}
