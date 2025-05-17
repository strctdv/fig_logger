// Just a tiny wrapper we like to use internally — nothing fancy, nothing serious.
// If it saves you a coffee break of work, then hey, that’s a win. ☕😉

import 'dart:developer' as dev;
import 'dart:async';

FigLogger getLogger(String className, {String? prefix, String? extra}) {
  return FigLogger(className, prefix: prefix, extra: extra);
}

mixin WithFigLogger {
  late final FigLogger l = getLogger(runtimeType.toString());
}

class FigLogger {
  final String separator;
  final String className;
  final String? prefix;
  final String? extra;

  FigLogger(
    this.className, {
    this.prefix,
    this.extra,
    this.separator = " ",
  });

  void v(String message, {Object? error, StackTrace? stackTrace, Zone? zone}) =>
      _log(message,
          level: 10, error: error, stackTrace: stackTrace, zone: zone);

  void d(String message, {Object? error, StackTrace? stackTrace, Zone? zone}) =>
      _log(message,
          level: 20, error: error, stackTrace: stackTrace, zone: zone);

  void w(String message, {Object? error, StackTrace? stackTrace, Zone? zone}) =>
      _log(message,
          level: 30, error: error, stackTrace: stackTrace, zone: zone);

  void e(String message, {Object? error, StackTrace? stackTrace, Zone? zone}) =>
      _log(message,
          level: 40, error: error, stackTrace: stackTrace, zone: zone);

  String _createChunk(String? str) => str != null ? "[$str]$separator" : "";

  void _log(
    String message, {
    required int level,
    Object? error,
    StackTrace? stackTrace,
    Zone? zone,
  }) {
    final effectiveMessage =
        "${_createChunk(prefix)}${_createChunk(extra)}$message";

    dev.log(
      effectiveMessage,
      name: className,
      level: level,
      error: error,
      stackTrace: stackTrace,
      time: DateTime.now(),
      zone: zone,
    );
  }
}
