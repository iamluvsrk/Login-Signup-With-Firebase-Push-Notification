import 'package:login_demo/core/error/app_errors.dart';

extension AppErrorExtension on Object {
  toAppException() {
    if (this is Exception) {
      return this;
    }
    return DataParsingException();
  }
}
