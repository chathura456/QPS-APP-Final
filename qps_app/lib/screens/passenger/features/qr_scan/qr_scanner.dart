import 'dart:io';

import 'package:qps_app/screens/passenger/features/qr_scan/qr_details.dart';
import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScanner();
}

class _QRScanner extends State<QRScanner> {
   final qrKey = GlobalKey(debugLabel: 'QR');
   QRViewController? controller;
   Barcode? barcode;

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();

    if(Platform.isAndroid){
      controller?.pauseCamera();
      controller?.resumeCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null && mounted ) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
    return Scaffold(
      appBar: AppBar(
    title: const Text('QR Scanner'),
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.kPrimaryColor,
    ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          _buildqrView(context),
          Positioned(bottom:10,child: buildViewResult()),
          /*barcode!=null?Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  QrDetails(qrData: 'Result : ${barcode!.code}')
              )
          ),*/
          Positioned(
            bottom: 45,
            child: ElevatedButton(
                onPressed: (){Navigator.pop(context);},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.kPrimaryColor)),
                child: const Text('Back to Home Page'),
              ),
            ),
        ],
      ),
      /*
      * Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildqrView(context),
           /* ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('back')),*/
          ],
        ),
      ),*/
    );
  }

  void qrCheck(){
    if(barcode!=null){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  QrDetails(qrData: 'Result : ${barcode!.code}')
    ));
      controller!.dispose();
    }
  }

  Widget buildViewResult()=>Text(
    barcode !=null? 'Result : ${barcode!.code}':'',
    style: const TextStyle(color: Colors.white),
    maxLines: 3,
  );

  Widget _buildqrView(BuildContext context) => QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      borderColor: AppColors.kPrimaryColor,
      borderLength: 20,
      borderWidth: 10,
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
    ),
  );

  void onQRViewCreated(QRViewController controller)
  {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
      qrCheck();

    });
  }
   @override
   void dispose() {
     // TODO: implement dispose
     controller?.dispose();
     super.dispose();
   }

}
