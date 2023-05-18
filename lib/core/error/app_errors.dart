// ignore_for_file: annotate_overrides

// App Exception Errors
abstract class AppException {
  final String code;
  final String message;
  AppException({this.code = '', this.message = ''});

  @override
  String toString() {
    return message;
  }
}

class NoConnectionException extends AppException {
  NoConnectionException({this.code = '', this.message = ''})
      : super(code: code, message: message);
  final String code;
  final String message;
}

class DataParsingException extends AppException {
  DataParsingException(
      {this.code = '', this.message = 'An Unexpected error occured'})
      : super(code: code, message: message);
  final String code;
  final String message;
}
