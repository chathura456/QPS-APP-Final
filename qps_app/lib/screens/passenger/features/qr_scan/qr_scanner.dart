import 'dart:io';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qps_app/screens/screens.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScanner();

}

class _QRScanner extends State<QRScanner> {
  DateTime now = DateTime.now();
  late String currentDate;
  late String currentTime;
  int? base,convertQR,count,conID,value;
  String? result;
  var check ;


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
  currentDate = DateFormat('EEE, d MMM y').format(now);
  currentTime = DateFormat.jm().format(DateTime.now());
  final passenger = Provider.of<UserProvider>(context).user;

    if (controller != null && mounted ) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
    return Scaffold(
      appBar: AppBar(
    title: const Text('QR Scanner'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            icon: const Icon(Icons.flip_camera_ios),
            color: Colors.white,
            onPressed: ()async{
              await controller?.flipCamera();
              setState(() {
              });
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: FutureBuilder<bool?>(future: controller?.getFlashStatus(),
                builder: (context,snapshot){
                if(snapshot.data!=null){
                  return  Icon(
                    snapshot.data!?
                      Icons.flash_on:Icons.flash_off);
                }else{
                  return const Icon(Icons.flash_on);
                }
              },),
              onPressed: () async{
                await controller?.toggleFlash();
                setState(() {
                });
              },
            ),
          ),
        ],
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.kPrimaryColor,
    ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          _buildQRView(context, currentDate),
          //Positioned(bottom:10,child: buildViewResult()),
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
      result = '${barcode!.code}';
      check = RegExp(r'^[0-9]+$').hasMatch(result!);
      if (check == true) {
        convertQR = int.parse(result!);
        int count = result!.length;
        findBase(count);
        if(base!=0){
          conID = convertQR!~/base!;
          int value = (convertQR!%base!);
          checkConductor(conID.toString(),value.toString(),currentDate,currentTime);
         //updatePoints(value.toString());
           /* Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  QrDetails(conductorID:conID.toString(),qrData: value.toString(),getDate: currentDate,getTime: currentTime,)
                ));*/


        }else{
          dialogScreen('You Scanned the Wrong QR Code. Please scan a QR code from verified QPS Conductor.');
        }

      }else{
        dialogScreen('You Scanned the Wrong QR Code. Please scan a QR code from verified QPS Conductor.');
      }
      controller!.dispose();
    }
  }

  Future checkConductor(String conID, String package, String currentDate, String currentTime) async {
    final conductorQuery = FirebaseFirestore.instance.collection('Users').where('UserID', isEqualTo: conID);
    final isValid = conductorQuery.parameters.isNotEmpty;
    if(!isValid){
      print('error!!!!!!!!!!!!!!!!!11');
    }else{
      try{
        await conductorQuery.get().then((value) async {
          //UserModel conductor=UserModel();

          final validCheck = value.docs;
          if(validCheck.isNotEmpty){
          /*  Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  QrDetails(conductorID:conID,qrData: package,getDate: currentDate,getTime: currentTime,)
                ));*/

            final conductorID = value.docs.first.id;
            print(conductorID);
            final conductorDB = FirebaseFirestore.instance.collection('Users').doc(conductorID);
            await conductorDB.get().then((value) async {
              UserModel conductor=UserModel();
              conductor= UserModel.fromMap(value.data());
              final currentBalance = conductor.points;
              final newBalance = (int.parse(currentBalance!)+int.parse(package)).toString();
              final updateData = UserModel(points:newBalance);
             /* try{
                await conductorDB.update(updateData.updatePoints()).then((value) {
                  Fluttertoast.showToast(msg: 'Conductor Money Transfer Success');
                });
              }on FirebaseAuthException catch (e) {
                dialogScreen();
                Fluttertoast.showToast(msg: '${e.message}');
              }*/

            }).then((value1) async {
              try{
                final user = FirebaseAuth.instance.currentUser;
                final db = FirebaseFirestore.instance.collection('Users').doc(user?.uid);
                await db.get().then((value) async {
                  UserModel loginUser=UserModel();
                  loginUser= UserModel.fromMap(value.data());
                  final currentBalance = loginUser.points;
                  if(int.parse(currentBalance!)>=int.parse(package)){
                    final newBalance = (int.parse(currentBalance!)-int.parse(package)).toString();
                    final updateData = UserModel(points:newBalance);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  QrDetails(conductorID:conID,qrData: package,getDate: currentDate,getTime: currentTime,)
                        ));

                    try{
                      await conductorDB.update(updateData.updatePoints()).then((value) {
                        Fluttertoast.showToast(msg: 'Conductor Money Transfer Success');
                      });
                    }on FirebaseAuthException catch (e) {
                      dialogScreen('You Scanned the Wrong QR Code. Please scan a QR code from verified QPS Conductor.');
                      Fluttertoast.showToast(msg: '${e.message}');
                    }

                    try{
                      await db.update(updateData.updatePoints()).then((value) {
                        Fluttertoast.showToast(msg: 'Purchase Success');
                      });
                    }on FirebaseAuthException catch (e) {
                      Fluttertoast.showToast(msg: '${e.message}');
                    }
                  }else{
                    dialogScreen('Ticket amount is Rs.$package.00. You have not enough balance to pay for the ticket(you current balance is $currentBalance)');
                  }

                });

              }on FirebaseAuthException catch (e) {
                Fluttertoast.showToast(msg: '${e.message}');
              }
            });

            //conductor= UserModel.fromMap(value.docs.first);
            print(conductorID);
          }
          else{
            print('error!!!!!!!!!!!!!!!!!11');
            //Fluttertoast.showToast(msg: 'Errorrrrrrrrrrrr');
            dialogScreen('You Scanned the Wrong QR Code. Please scan a QR code from verified QPS Conductor.');
          }
        });
      }
      on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: '${e.message}');
        print('errorrrrr');
      }
    }

  }

  void dialogScreen(String msg)=>showDialog(
    context: context,
    builder: (context)=>Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('asset/animations/cancel.json',height: 200),
            Text(msg,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: AppColors.kPrimaryColor),),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: Colors.white,
                shadowColor: Colors.transparent,
                elevation: 0,
                // fixedSize: const Size(100, 50), //////// HERE
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const QRScanner(),));
              },
              child: const Text(
                'OK',
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ),
  );

  void findBase(int count){

    switch(count){
      case 8:
        base = 100;
        break;
      case 9:
        base = 1000;
        break;
      case 10:
        base = 10000;
        break;
      default:
        base = 0;
        break;
    }
  }

  Widget buildViewResult()=>Text(
    barcode !=null? 'Result : ${barcode!.code}':'',
    style: const TextStyle(color: Colors.white),
    maxLines: 3,
  );

  Widget _buildQRView(BuildContext context, String date) => QRView(
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
