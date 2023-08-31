package com.example.urovo_printer

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.device.PrinterManager

/** UrovoPrinterPlugin */
class UrovoPrinterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private val  printManager: PrinterManager = PrinterManager()

  var yH: Int = 0; /// for tracking the hieght of text

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "urovo_printer")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

    val args = call.arguments<Map<String, Any>>()

    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "printText"){
      val rec : Int = printManager.status

      if(rec == 0) {
        yH += printManager.drawTextEx(
          (args?.get("text") ?: "") as String?,
          (args?.get("x") ?: 5) as Int,
          (args?.get("y") ?: 5) as Int,
          (args?.get("width") ?: 384) as Int,
          (args?.get("height") ?: -1) as Int,
          "/system/fonts/kaishu.ttf",
          (args?.get("size") ?: 30) as Int,
          0,
          (args?.get("style") ?: 0) as Int,
          0
        )

        result.success("0")
      }else{
        result.error(rec.toString(), "Please check printer", null);
      }

    }else if(call.method == "printLine"){
      val rec : Int = printManager.status

      if(rec == 0) {
        yH += printManager.drawText(
          (args?.get("text") ?: "") as String?,
          (args?.get("x") ?: 0) as Int,
          (args?.get("y") ?: yH) as Int,
          "/system/fonts/kaishu.ttf",
          (args?.get("size") ?: 30) as Int,
          (args?.get("bold") ?: false) as Boolean,
          (args?.get("italic") ?: false) as Boolean,
          0
        )
        result.success("0")
      }else{
        result.error(rec.toString(), "Please check printer", null);
      }

    }else if(call.method == "printBarCode"){
      val rec : Int = printManager.status

      if(rec == 0) {
        yH += printManager.drawBarcode(
          (args?.get("text") ?: "") as String?,
          (args?.get("x") ?: 25) as Int,
          (args?.get("y") ?: yH) as Int,
          (args?.get("type") ?: 1) as Int,
          3,
          (args?.get("size") ?: 10) as Int,
          0,
        )
        result.success("0")
      }else{
        result.error(rec.toString(), "Please check printer", null);
      }

    }else if(call.method == "printQRCode"){
      val rec : Int = printManager.status

      if(rec == 0) {
        yH += printManager.drawBarcode(
          (args?.get("text") ?: "") as String?,
          (args?.get("x") ?: 60) as Int,
          (args?.get("y") ?: yH) as Int,
          58,
          (args?.get("size") ?: 100) as Int,
          (args?.get("size") ?: 100) as Int,
          0,
        )
        result.success("0" )
      }else{
        result.error(rec.toString(), "Please check printer", null);
      }

    }else if(call.method == "doPrint"){
      yH = 0;
      printManager.open()
      printManager.printPage(0)
      printManager.paperFeed((args?.get("feed") ?: 5) as Int)
      result.success("Is printing")

    }else{
      result.notImplemented();
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
