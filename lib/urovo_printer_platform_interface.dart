import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'urovo_printer_method_channel.dart';

abstract class UrovoPrinterPlatform extends PlatformInterface {
  /// Constructs a UrovoPrinterPlatform.
  UrovoPrinterPlatform() : super(token: _token);

  static final Object _token = Object();

  static UrovoPrinterPlatform _instance = MethodChannelUrovoPrinter();

  /// The default instance of [UrovoPrinterPlatform] to use.
  ///
  /// Defaults to [MethodChannelUrovoPrinter].
  static UrovoPrinterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UrovoPrinterPlatform] when
  /// they register themselves.
  static set instance(UrovoPrinterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> printLine(Map<String, Object> map) {
    throw UnimplementedError(
        'printLine(Map<String, Object> map) has not been implemented.');
  }

  Future<String?> printText(Map<String, Object> map) {
    throw UnimplementedError(
        'printText(Map<String, Object> map) has not been implemented.');
  }

  Future<String?> printBarCode(Map<String, Object> map) {
    throw UnimplementedError(
        'printBarCode(Map<String, Object> map) has not been implemented.');
  }

  Future<String?> printQRCode(Map<String, Object> map) {
    throw UnimplementedError(
        'printQRCode(Map<String, Object> map) has not been implemented.');
  }

  Future<String?> doPrint(Map<String, Object> map) {
    throw UnimplementedError(
        'donePrint(Map<String, Object> map) has not been implemented.');
  }
}
