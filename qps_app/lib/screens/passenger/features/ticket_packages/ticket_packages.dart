import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TicketPackages extends StatefulWidget {
  const TicketPackages({Key? key, required this.balance}) : super(key: key);
  final int balance;

  @override
  State<TicketPackages> createState() => _QRScanner();
}

class _QRScanner extends State<TicketPackages> {
  var controller = TextEditingController();
  String package='000';
  bool show = false;
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child ){
        return Scaffold(
          appBar: commonAppBar('Ticket Packages ${userProvider.user?.passenger?.amount}', context),
         // appBar: commonAppBar('Ticket Packages ', context),
          body: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(id==4?'Enter custom Ticket Package Amount':'Please Select your Ticket Package',
                        style: const TextStyle(color: AppColors.kPrimaryColor,
                            fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Visibility(
                      maintainState: true,
                      visible: id!=4,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 280,
                            child:  Column(
                              children: [
                                Expanded(
                                  child: CustomScrollView(
                                    primary: false,
                                    slivers: [
                                      SliverPadding(
                                        padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
                                        sliver: SliverGrid.count(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 40,
                                          mainAxisSpacing: 30,
                                          children:  [
                                            MyListTiles2(
                                              text: '100',
                                              textColor: id==1?Colors.white:AppColors.kPrimaryColor,
                                              backColor: id!=1?Colors.white:AppColors.kPrimaryColor,
                                              press: (){
                                                setState(() {
                                                  package='100';
                                                  show = true;
                                                  id=1;
                                                });
                                              },
                                            ),
                                            MyListTiles2(
                                              textColor: id==2?Colors.white:AppColors.kPrimaryColor,
                                              backColor: id!=2?Colors.white:AppColors.kPrimaryColor,
                                              text: '200',
                                              press: (){
                                                setState(() {
                                                  package='200';
                                                  show = true;
                                                  id=2;
                                                });
                                              },
                                            ),
                                            MyListTiles2(
                                              textColor: id==3?Colors.white:AppColors.kPrimaryColor,
                                              backColor: id!=3?Colors.white:AppColors.kPrimaryColor,
                                              text: '500',
                                              press: (){
                                                setState(() {
                                                  package='500';
                                                  show = true;
                                                  id=3;
                                                });
                                              },
                                            ),
                                            MyListTiles1(
                                              text: 'Enter\nCustom\nAmount',
                                              press: (){
                                                if(mounted){
                                                  setState(() {
                                                    if(package!=''){
                                                      package='000';
                                                    }
                                                    show = true;
                                                    id=4;
                                                    controller.clear();
                                                  });
                                                }

                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],

                            ),
                          ),
                        ],
                      )),
                  Visibility(
                    maintainState: true,
                    visible: id==4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyInputField(
                            fontSize: 20,
                            hintTextFontSize: 18,
                            textAlign: TextAlign.center,
                            controller: controller,
                            hintText: 'Enter Custom Amount',
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                          ),
                        ],
                      ),
                    ),
                  ),

                  RoundedButton2(text: 'Buy Now',press: (){

                    if(id!=4){
                      if(package!='000'){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PaymentOptions(package: package,)));}
                      else{
                        Fluttertoast.showToast(msg: 'Please Select Ticket Package');
                      }
                    }else{
                      if(mounted){
                        setState(() {
                          package=controller.text;
                        });
                      }
                      if(package!=''){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => PaymentOptions(package: package,)));}
                      else{
                        Fluttertoast.showToast(msg: 'Please Select Ticket Package');
                      }
                    }

                  },),
                  id==4?TextButton(onPressed: (){
                    if(mounted) {
                      setState(() {
                        id=0;
                        if(package!=''){
                          package='000';
                        }
                      });
                    }
                  }, child: const Text('Switch to Select Packages',style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.kPrimaryColor,fontSize: 16
                  ),)):const SizedBox(height: 10,),
                  BorderButton(text: 'Send Credits to Friend',press: (){},),
                  BorderButton(text: 'Purchase history',press: (){},),
                  // Text(package),
                  const SizedBox(height: 80,),




                ],
              ),
            ),
          ),

        );
      },

    );
  }
}
