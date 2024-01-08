import 'package:flutter/material.dart';

class Logger {
  static LogMode _logMode = LogMode.debug;

  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(String tag, dynamic message) {
    if (_logMode == LogMode.debug) {
      if (tag != null) {
        debugPrint('[$tag] : $message');
      } else {
        debugPrint(message);
      }
    }
  }
}

enum LogMode { debug, live }
