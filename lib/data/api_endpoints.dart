/// lib/config/api_endpoints.dart
class ApiEndpoints {
  // Auth
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String refreshToken = "/auth/refresh";

  // User
  static const String getProfile = "/user/profile";
  static const String updateProfile = "/user/update";

  // Events
  static const String getEvents = "/events";
  static const String createEvent = "/events/create";
  static const String eventDetails = "/events/details"; // add /:id dynamically

  // Payments
  static const String createPayment = "/payments/create";
  static const String getPayments = "/payments";

  // Health
  static const String health = "/health";
}
