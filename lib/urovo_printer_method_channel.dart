import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'urovo_printer_platform_interface.dart';

/// An implementation of [UrovoPrinterPlatform] that uses method channels.
class MethodChannelUrovoPrinter extends UrovoPrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('urovo_printer');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> printLine(Map<String, Object> map) async {
    return await methodChannel.invokeMethod<String>('printLine', map);
  }

  @override
  Future<String?> printText(Map<String, Object> map) async {
    return await methodChannel.invokeMethod<String>('printText', map);
  }

  @override
  Future<String?> printBarCode(Map<String, Object> map) async {
    return await methodChannel.invokeMethod<String>('printBarCode', map);
  }

  @override
  Future<String?> printQRCode(Map<String, Object> map) async {
    return await methodChannel.invokeMethod<String>('printQRCode', map);
  }

  @override
  Future<String?> doPrint(Map<String, Object> map) async {
    return await methodChannel.invokeMethod<String>('doPrint', map);
  }
}
