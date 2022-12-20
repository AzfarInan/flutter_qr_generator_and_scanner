import 'package:flutter/material.dart';
import 'package:qr_rnd/Models/profile.dart';
import 'package:qr_rnd/Widgets/primary_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'individual_profile_view.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(title: "Start QR Scan", onPressed: scanQR),
            const SizedBox(
              height: 20.0,
            ),
            Text(barcode.startsWith("{") ? "" : barcode),
          ],
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', false, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    barcode = barcodeScanRes;

    if (!barcode.startsWith("{")) {
      setState(() {});
    } else if (barcode != "" || barcode != "-1") {
      Profile profile = profileFromJson(barcode);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IndividualProfile(
            profile: profile,
          ),
        ),
      );
    }
  }
}
