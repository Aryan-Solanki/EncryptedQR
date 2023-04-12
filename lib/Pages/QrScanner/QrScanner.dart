import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../Components/encrypt.dart';
import '../otherInfoPage/otherInfoPage.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {

  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildQrView(context),
      ),
    );
  }
  
  Widget buildQrView(BuildContext context)=>QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        cutOutSize: MediaQuery.of(context).size.width,
        borderWidth: 10,
        borderLength: 20,
        borderRadius: 10,
        borderColor: Colors.white
      ),

  );

  void onQRViewCreated(QRViewController controller){
    setState(()=> this.controller = controller);


    controller.scannedDataStream
    .listen((barcode) {

      var data=decrypt(barcode.code!);
      print(data);
      print(data.substring(0,5));
      if(data.substring(0,5)==".#.#."){

        print("----");
        print(data.substring(0,5));

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => otherInfoPage(data:data.substring(5))));
      }





      // print(barcode);

    });
  }
  
}
