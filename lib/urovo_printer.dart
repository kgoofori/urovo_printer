import 'urovo_printer_platform_interface.dart';

class UrovoPrinter {
  Future<String?> getPlatformVersion() {
    return UrovoPrinterPlatform.instance.getPlatformVersion();
  }

  Future<String?> printLine(String text,
      {int size = 25,
      int x = 25,
      int y = 25,
      bool bold = false,
      bool italics = false}) {
    return UrovoPrinterPlatform.instance.printLine({
      "text": text,
      "size": size,
      "y": y,
      "x": x,
      "bold": bold,
      "italics": italics,
    });
  }

  Future<String?> printText(String text,
      {int size = 25,
      int x = 25,
      int y = 25,
      int width = 384,
      int height = -1,
      int style = 0}) {
    return UrovoPrinterPlatform.instance.printText({
      "text": text,
      "size": size,
      "y": y,
      "x": x,
      "width": width,
      "height": height,
      "style": style,
    });
  }

  Future<String?> printBarCode(String text,
      {int size = 25, int x = 25, int y = 25, int type = 1}) {
    return UrovoPrinterPlatform.instance.printBarCode(
        {"text": text, "size": size, "y": y, "x": x, "type": type});
  }

  Future<String?> printQRCode(String text,
      {int size = 25, int x = 25, int y = 25}) {
    return UrovoPrinterPlatform.instance
        .printQRCode({"text": text, "size": size, "y": y, "x": x});
  }

  Future<String?> doPrint({int feed = 5}) {
    return UrovoPrinterPlatform.instance.doPrint({"feed": feed});
  }
}
