import 'package:flutter_test/flutter_test.dart';
import 'package:urovo_printer/urovo_printer.dart';
import 'package:urovo_printer/urovo_printer_platform_interface.dart';
import 'package:urovo_printer/urovo_printer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUrovoPrinterPlatform
    with MockPlatformInterfaceMixin
    implements UrovoPrinterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> printBarCode(Map<String, Object> map) {
    // TODO: implement printBarCode
    throw UnimplementedError();
  }

  @override
  Future<String?> printLine(Map<String, Object> map) {
    // TODO: implement printLine
    throw UnimplementedError();
  }

  @override
  Future<String?> printQRCode(Map<String, Object> map) {
    // TODO: implement printQRCode
    throw UnimplementedError();
  }

  @override
  Future<String?> printText(Map<String, Object> map) {
    // TODO: implement printText
    throw UnimplementedError();
  }

  @override
  Future<String?> doPrint(Map<String, Object> map) {
    // TODO: implement doPrint
    throw UnimplementedError();
  }
}

void main() {
  final UrovoPrinterPlatform initialPlatform = UrovoPrinterPlatform.instance;

  test('$MethodChannelUrovoPrinter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUrovoPrinter>());
  });

  test('getPlatformVersion', () async {
    UrovoPrinter urovoPrinterPlugin = UrovoPrinter();
    MockUrovoPrinterPlatform fakePlatform = MockUrovoPrinterPlatform();
    UrovoPrinterPlatform.instance = fakePlatform;

    expect(await urovoPrinterPlugin.getPlatformVersion(), '42');
  });
}
