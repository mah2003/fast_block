import 'package:flutter/material.dart';

class NavigationHelper {
  // Navigate to a new screen
  static void push(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // Navigate to a new screen and replace the current screen
  static void navigateAndReplace(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // Navigate to a new screen and remove all previous screens
  static void navigateAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  // Go back to the previous screen
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  // Navigate to a new screen with arguments
  static void navigateWithArguments(
      BuildContext context, Widget screen, Object arguments) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(arguments: arguments),
      ),
    );
  }
}
