import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  SimpleLogPrinter();

  @override
  List<String> log(LogEvent event) {
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    return ['$emoji ${event.message}'];
  }
}
