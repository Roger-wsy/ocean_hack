import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(printer: EhpLogger(className));
}

class EhpLogger extends LogPrinter {
  final String className;

  EhpLogger(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = color!('$emoji $className - ${event.message}');
    return [message];
  }
}
