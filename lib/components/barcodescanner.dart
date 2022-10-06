import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_json/g_json.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:smart_mhealth_admin/http/external_api.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String _scanBarcode = 'Unknown';
  late String? _result;

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    dynamic decoded;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
      _result = await verRemedioAPI(barcodeScanRes);
      decoded = JSON.parse(_result!);
      print(barcodeScanRes);
      print(decoded.description);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = decoded["description"].toString();
    });
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.defaultTheme.primaryColor,
                      textStyle: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 20,
                      ),
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () => scanBarcodeNormal(),
                  child: const Text('Start barcode scan')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.defaultTheme.primaryColor,
                      textStyle: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 20,
                      ),
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () => scanQR(),
                  child: const Text('Start QR scan')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.defaultTheme.primaryColor,
                      textStyle: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 20,
                      ),
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () => startBarcodeScanStream(),
                  child: const Text('Start barcode scan stream')),
              const SizedBox(
                height: 5,
              ),
              Text('Scan result : $_scanBarcode\n',
                  style: const TextStyle(fontSize: 20))
            ]));
  }
}
