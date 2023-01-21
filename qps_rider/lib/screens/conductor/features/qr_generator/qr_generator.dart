import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  QrImage(
                    data: output,
                    size: 250,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
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
              RoundedButton2(
                text: 'Show QR',
                press: () {
                  conID = '174258';

                  if (controller.text.isEmpty) {
                    setState(() {
                      output = '125';
                    });
                  } else {
                    setState(() {
                      price = controller.text.trim();
                      output = conID + price!;
                      show = true;
                    });
                  }
                  controller.clear();
                },
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
