import 'dart:developer';
import 'dart:io';

Future<bool> hasInternetConnection() async {
  try {
    final result = await InternetAddress.lookup("google.com");
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } catch (e) {
    log("hasInternetConnection error: ${e.toString()}");
    return false;
  }
}
