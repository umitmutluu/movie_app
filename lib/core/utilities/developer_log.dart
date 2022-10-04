import 'dart:developer' as dev;

extension Log on Object {
  void log() {
    dev.log(toString());
  }
}