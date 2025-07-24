import 'package:logger/logger.dart';

enum LogFormat { simple, extended }

/// A structured and configurable logger wrapper using the `logger` package.
class AppLogger {
  static late Logger _logger;
  static late Level _level;
  static late LogFormat _logFormat;
  late final String _name;

  AppLogger({String name = "Logger"}) : _name = name;

  AppLogger.getLogger(String name) {
    _name = name;
  }

  /// Configure the logger globally. Must be called before using the logger.
  static void configure({
    required bool isProduction,
    LogFormat logFormat = LogFormat.extended,
    bool logToFile = false, // Reserved for future file output support
  }) {
    _level = isProduction ? Level.info : Level.debug;
    _logFormat = logFormat;

    final LogPrinter printer =
        _logFormat == LogFormat.simple
            ? SimplePrinter(printTime: true)
            : _CustomPrettyPrinter();

    _logger = Logger(
      level: _level,
      printer: printer,
      filter: isProduction ? ProductionFilter() : DevelopmentFilter(),
      output: ConsoleOutput(),
    );
  }

  // Helper to format messages
  String _format(dynamic message, [List<dynamic>? args]) {
    var formatted = '[$_name] $message';
    if (args != null) {
      for (var arg in args) {
        formatted = formatted.replaceFirst("{}", arg.toString());
      }
    }
    return formatted;
  }

  void trace(dynamic message, [List<Object?>? args]) =>
      _logger.t(_format(message, args));

  void debug(dynamic message, [List<Object?>? args]) =>
      _logger.d(_format(message, args));

  void info(dynamic message, [List<Object?>? args]) =>
      _logger.i(_format(message, args));

  void warn(dynamic message, [List<Object?>? args]) =>
      _logger.w(_format(message, args));

  void error(dynamic message, [List<Object?>? args]) =>
      _logger.e(_format(message, args));

  @override
  String toString() =>
      "AppLogger(name: $_name, level: ${_level.name}, format: ${_logFormat.name})";
}

/// Custom PrettyPrinter with cleaner output
class _CustomPrettyPrinter extends PrettyPrinter {
  _CustomPrettyPrinter()
    : super(
        methodCount: 1,
        errorMethodCount: 3,
        lineLength: 100,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.dateAndTime,
      );

  @override
  List<String> log(LogEvent event) {
    final color = levelColors?[event.level] ?? const AnsiColor.none();
    final emoji = levelEmojis?[event.level] ?? '';
    final time = DateTime.now().toIso8601String();

    return [
      color(
        '$emoji [$time] ${event.level.name.toUpperCase()} → ${event.message}',
      ),
    ];
  }
}
