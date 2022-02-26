import 'package:flutter/services.dart';

class Toast {
  Toast(String message) {
    _showToast(message);
  }

  static const platform = const MethodChannel('flutter.toast.message.channel');

  // Future<Null> _showToast(String message) async {
  //
  //    await platform.invokeMethod("showToast");
  //
  //
  //   // invoke method, provide method name and arguments.
  //   // await platform.invokeMethod('toast', {'message': message});
  // }

  Future _showToast(String message) async {
    try {
      final result = await platform.invokeMethod('showToast',{'message':message});
      print(result);
    }
    on PlatformException catch (e) {
      print(e.message);
    }
  }
}