import 'package:crypto/crypto.dart';
import 'dart:convert';

class MyLogin {
  late String _pass;

  set password(String text) {
    var bytes = utf8.encode(text);
    var digest = sha1.convert(bytes);
    _pass = digest.toString();
  }

  String get hashPassword{
    return _pass;
  }
}
