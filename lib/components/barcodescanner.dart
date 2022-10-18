import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:g_json/g_json.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:smart_mhealth_admin/http/external_api.dart';
import '../globals.dart' as globals;

class BarcodeScanner {
  RegExp expNome = RegExp('[A-Za-z0-9]+');
  RegExp expQuantidade = RegExp('[0-9]+');

  String _result = '';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    dynamic decoded;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
      _result = await verRemedioAPI(barcodeScanRes);
      decoded = JSON.parse(_result);

      debugPrint(barcodeScanRes);

      debugPrint(decoded.description);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (decoded != null) {
      RegExpMatch? match =
          expNome.firstMatch(decoded["description"].toString());
      Iterable<RegExpMatch> matchQtd =
          expQuantidade.allMatches(decoded["description"].toString());
      globals.remedioNome = match![0]!;
      if (matchQtd.length > 1) {
        globals.qtd = matchQtd.last[0].toString();
        globals.remedioNome =
            '${globals.remedioNome} ${matchQtd.first[0]}MG';
      } else {
        globals.qtd = matchQtd.first[0].toString();
      }
    }
  }
}
