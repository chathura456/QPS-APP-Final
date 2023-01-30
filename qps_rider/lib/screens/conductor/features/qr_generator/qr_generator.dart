import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qps_rider/screens/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QRGenerator extends StatefulWidget {
  const QRGenerator({Key? key}) : super(key: key);

  @override
  State<QRGenerator> createState() => _QRScanner();
}

class _QRScanner extends State<QRGenerator> {
  final TextEditingController controller = TextEditingController();
  String output = '123';
  String price = '12';
  bool show = false;

  @override
  Widget build(BuildContext context) {
    final userNew = Provider.of<UserProvider>(context).user;
    String conID;
    //String? price;

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Generator'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  if (output != '123') QrImage(
                    data: output,
                    size: 250,
                    backgroundColor: Colors.white,
                  ) else Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(height: 40,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text('QR Code will appear here after you enter the ticket price..',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.kPrimaryColor,
                        ),),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: output == '123',
                maintainState: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyInputField(
                        fontSize: 20,
                        hintTextFontSize: 18,
                        textAlign: TextAlign.center,
                        controller: controller,
                        hintText: 'Enter Ticket Value',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: output=='123',
                child: RoundedButton2(
                  text: 'Show QR',
                  press: () {
                    conID = '${userNew?.uid}';

                    if (controller.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Please Enter Ticket Value');

                      setState(() {
                        output = '123';
                        show = false;
                      });
                    } else {
                      setState(() {
                        price = controller.text.trim();
                        output = conID + price!;
                        print(output);
                        show = true;
                      });
                    }
                    controller.clear();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              show
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'You Entered Ticket Amount',
                          style: TextStyle(
                              color: AppColors.kPrimaryColor, fontSize: 20),
                        ),
                        Text('Rs $price.00',
                            style: const TextStyle(
                                color: AppColors.kPrimaryColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 40),
                        RoundedButton2(text: 'New QR',press: (){
                          setState(() {
                            output = '123';
                            show = false;
                          });
                        },),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
