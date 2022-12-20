import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateScreen extends StatefulWidget {
  const GenerateScreen({Key? key}) : super(key: key);

  @override
  State<GenerateScreen> createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {
  String _dataString = "https://www.google.com";
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("QR Code Generator"),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: TextFormField(
                initialValue: _dataString,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    _dataString = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 34.0),
            Center(
              child: RepaintBoundary(
                child: QrImage(
                  data: _dataString,
                  version: QrVersions.auto,
                  size: MediaQuery.of(context).size.width * 0.9,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
