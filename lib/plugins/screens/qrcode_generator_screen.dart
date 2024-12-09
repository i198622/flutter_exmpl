import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeGeneratorScreen extends StatefulWidget {
  const QrCodeGeneratorScreen({
    super.key,
  });

  @override
  State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
}

class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {
  @protected
  late QrCode qrCode;

  @protected
  late QrImage qrImage;

  @protected
  late PrettyQrDecoration decoration;

  @override
  void initState() {
    super.initState();

    qrCode = QrCode.fromData(
      data: 'https://pub.dev/packages/pretty_qr_code',
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    qrImage = QrImage(qrCode);

    decoration = const PrettyQrDecoration(
      shape: PrettyQrSmoothSymbol(
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: PrettyQrView(
        qrImage: qrImage,
        decoration: decoration,
      ),
    );
  }
}