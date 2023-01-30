import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';
import 'package:qps_app/widgets/my_widgets.dart';
import 'package:lottie/lottie.dart';

class QrDetails extends StatefulWidget {
  const QrDetails({Key? key, required this.qrData, required this.getDate, required this.getTime, required this.conductorID}) : super(key: key);
  final String qrData;
  final String getDate;
  final String getTime;
  final String conductorID;

  @override
  State<QrDetails> createState() => _QrDetailsState();
}

class _QrDetailsState extends State<QrDetails> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  bool timerOut = true;
  @override
  Widget build(BuildContext context) {
    final userNew = Provider.of<UserProvider>(context).user;
    double customWith = MediaQuery.of(context).size.width;
    return Scaffold(
     /* appBar: AppBar(
        title: const Text('Ticket Details'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.kPrimaryColor,
      ),*/
      body: SingleChildScrollView(
        child:  Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              Column(
                    children: [
                      Lottie.asset('asset/animations/QR_Scan.json',height: 150,fit: BoxFit.cover)
                    ],
                  ),

              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Payment',
                    style: TextStyle(
                      height: 0.9,
                        fontSize: 32,
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Success!',
                    style: TextStyle(
                      height: 0.9,
                        fontSize: 48,
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const TicketData(leftText1: 'Bus No', rightText1: 'KH - 3417'),
              const SizedBox(
                height: 15,
              ),
              const TicketData(
                  leftText1: 'Route', rightText1: '(129) Kottawa - Moragahahena'),
              const SizedBox(
                height: 15,
              ),
              TicketData(leftText1: 'Con. ID', rightText1: 'C - ${widget.conductorID}'),
              const SizedBox(
                height: 15,
              ),
              TicketData(leftText1: 'Date', rightText1: widget.getDate/*'15 Apr 2022'*/),
              const SizedBox(
                height: 15,
              ),
              TicketData(leftText1: 'Time', rightText1: widget.getTime/*'10.52 am'*/),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Ticket Amount',
                        style: TextStyle(
                          height: 1.5,
                            color: AppColors.kPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rs ${widget.qrData}.00',
                        style: const TextStyle(
                          height: 1,
                            color: AppColors.kPrimaryColor,

                            fontSize: 55,
                            fontWeight: FontWeight.w900),

                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '(Your Current Balance : Rs ${userNew?.points}.00)',
                        style: TextStyle(
                          height: 0.9,
                            color: AppColors.kPrimaryColorLight, fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: Colors.white70,
                            disabledForegroundColor: AppColors.kPrimaryColor30,
                            foregroundColor: AppColors.kPrimaryColorLight,
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: timerOut?AppColors.kPrimaryColorLight:AppColors.kPrimaryColor30,
                              width: 2.0,
                            ),
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            fixedSize: const Size(150, 50), //////// HERE
                          ),
                          onPressed: timerOut==true?() {
                            stopTimer();
                            dialogScreen();
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const QRScanner(),));
                          }:null,
                          child: Text(
                            timerOut==true?'Cancel (${seconds}s)':'Cancel',
                            style: TextStyle(
                                color: timerOut?AppColors.kPrimaryColorLight:AppColors.kPrimaryColor30, fontSize: 19),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kPrimaryColor,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            fixedSize: const Size(150, 50), //////// HERE
                          ),
                          onPressed: () {
                            stopTimer();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageNavigator(),));
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                      ),
                     ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                  SizedBox(
                    width: customWith*0.8,
                    child: const Text(
                    '**Transaction is already done. please press confirm button to go to the home screen.**',
                    style: TextStyle(color: AppColors.kPrimaryColorLight,fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                ),
                  ),
                  ],
                ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  SizedBox(
                    width: customWith*0.8,
                    child: const Text(
                      "**If you have a problem with this transaction, you can press the 'Cancel' button after notifying the conductor. (This option requires the permission of the conductor and is valid only one minute after scanning the QR code.).**",
                      style: TextStyle(color: AppColors.kPrimaryColorLight,fontSize: 12),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),

    );
  }

  void startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if(seconds>0){
        seconds--;}
        else{
          stopTimer();
          timerOut = false;
        }
      });
    });
  }

  void stopTimer(){
    setState(() {
      timer?.cancel();
    });
  }


  void dialogScreen()=>showDialog(
      context: context,
      builder: (context)=>Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('asset/animations/Wait.json',height: 200),
              const Text('Your cancellation request will be sent to the conductor. Please contact him to reverse the transaction and get your refund.',
                textAlign: TextAlign.justify,
                style: TextStyle(color: AppColors.kPrimaryColor),),
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
                  //Navigator.popUntil(context, (route) => false);
                  //Navigator.pop(context);

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageNavigator(),));
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
}
