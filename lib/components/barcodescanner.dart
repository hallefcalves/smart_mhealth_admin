import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:g_json/g_json.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:smart_mhealth_admin/http/external_api.dart';
import '../globals.dart' as globals;

class BarcodeScanner {
  RegExp expNome = RegExp('([a-zA-Z]+( [a-zA-Z]+)+)');
  RegExp expQuantidade = RegExp('[A-Za-z0-9]+');

  String _result = '';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    dynamic decoded;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      debugPrint(barcodeScanRes);
      _result = await verRemedioAPI(barcodeScanRes);
      decoded = JSON.parse(_result);
      debugPrint(decoded.toString());
      if (decoded != null) {
        RegExpMatch? match =
            expNome.firstMatch(decoded["description"].toString());
        RegExpMatch? matchQuan =
            expQuantidade.firstMatch(decoded["description"].toString());
        globals.remedioNome = match![0]!;
        globals.qtd = matchQuan![0]!;
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
