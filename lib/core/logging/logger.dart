import 'dart:developer';
import 'package:flutter/foundation.dart';

// because this function was used a lot of time in this project
// so we set it as a global function
void printOut(String? msg) async {
  if (msg != null && msg.isNotEmpty && kDebugMode) {
    try {
      log('::: $msg');
    } catch (error) {
      log(msg);
    }
  } else {
    log('S.O.S => printing a null value');
  }
}
