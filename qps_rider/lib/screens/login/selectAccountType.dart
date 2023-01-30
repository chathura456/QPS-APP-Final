import 'package:qps_rider/screens/login/verify_otp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qps_rider/screens/model/conductor_model.dart';
import 'package:qps_rider/screens/model/owner_model.dart';
import 'package:qps_rider/screens/model/seller_model.dart';
import '../../main.dart';
import '../model/userModel.dart';
import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountSelect extends StatefulWidget {
  const AccountSelect({Key? key}) : super(key: key);

  @override
  State<AccountSelect> createState() => _AccountSelect();
}

class _AccountSelect extends State<AccountSelect> {
  final User? user = FirebaseAuth.instance.currentUser;
  String? acctype;
  String? _genderRadioBtnVal;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: AppColors.kPrimaryColorDark,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.3,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: const AppBar2(
                height1: 0.3,
                height2: 0.15,
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Select Account Type',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff80065d)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: AppText(
                          fontWeight: FontWeight.w500,
                          text:
                              "Once you choose your account type, it cannot be undone. So choose correctly."),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: "C",
                                          groupValue: _genderRadioBtnVal,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      AppColors.kPrimaryColor),
                                          onChanged: _handleGenderChange,
                                        ),
                                        const AppText(text: 'Conductor'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: "O",
                                          groupValue: _genderRadioBtnVal,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      AppColors.kPrimaryColor),
                                          onChanged: _handleGenderChange,
                                        ),
                                        const AppText(text: 'Owner'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: "S",
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      AppColors.kPrimaryColor),
                                          groupValue: _genderRadioBtnVal,
                                          onChanged: _handleGenderChange,
                                        ),
                                        const AppText(text: 'Seller'),
                                        /*Flexible(
                                          flex: 1,
                                          child: Row(
                                            children: [

                                              const AppText(text: 'Seller'),
                                            ],
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RoundedButton(
                          text: 'Confirm',
                          press: () {
                            if (_genderRadioBtnVal == null) {
                              Fluttertoast.showToast(
                                msg: "Please Select Account Type",
                                backgroundColor: AppColors.kPrimaryColorDark,
                                textColor: Colors.white,
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => MyDialogBox(
                                      type: acctype!,
                                      press: () {
                                        updateAccType();
                                       /* Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const VerifyOTP()));*/
                                      }));
                            }
                          },
                        ),
                      ],
                    )),
                    //const SizedBox(height: 20,),
                    /*ElevatedButton(onPressed: (){
                      signOut();
                    }, child: const Text('Logout'))*/
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomAppBar(
              elevation: 0.0,
              color: Colors.transparent,
              child: AppBar3(
                height1: 0.15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleGenderChange(String? value) {
    setState(() {
      _genderRadioBtnVal = value;
      if (_genderRadioBtnVal == "C") {
        acctype = "Conductor";
      } else if (_genderRadioBtnVal == "O") {
        acctype = "Owner";
      }
      if (_genderRadioBtnVal == "S") {
        acctype = "Seller";
      }
    });
  }
  Future<void>signOut()async{
    await FirebaseAuth.instance.signOut();
  }

  Future updateAccType() async{
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: AppColors.kPrimaryColor,
                ),
                SizedBox(height: 20,),
                Text('Validating Data..', style: TextStyle(color: AppColors.kPrimaryColor,fontSize: 16,fontWeight: FontWeight.w500),)
              ],
            ),
          ),
        );
        /*return const Center(
          child: CircularProgressIndicator(
            color: AppColors.kPrimaryColor,
            backgroundColor: Colors.white,
          ),
        );*/
      },
    );
    try{
      final userRef= FirebaseFirestore.instance.collection("Users").doc(user?.uid);

      final currentUser = UserModel(
        type: acctype,
        //passenger: passenger
      );
      await userRef.update(currentUser.updateAccTypeJason());
      if(acctype == 'Conductor'){
        const conductor = ConductorModel(
            payment: 'no data',
          amount: 'no data',
          description: 'no data',
          date: 'no data'
        );
        await userRef.collection('Payment_History').doc(user?.uid).set(conductor.toJason()).whenComplete(() async {
           const curruntBus = CurrentBus(
             owner: 'no data',
             duration: 'no data',
             busNo: 'no data',
           );
           await userRef.collection('CurrentBus').doc(user?.uid).set(curruntBus.toJason());
        });
      }
      else if(acctype == 'Owner'){
        const owner = OwnerModel(
            route: 'no data',
            busNo: 'no data',
          income: 'no data',
        );
        await userRef.collection('Bus_Details').doc(user?.uid).set(owner.toJason()).whenComplete(() async {
          const bankDetails = BankDetailsModel(
            bank: 'no data',
            branch: 'no data',
            accNo: 'no data',
          );
          await userRef.collection('Bank_Details').doc(user?.uid).set(bankDetails.toJason());
        });
      }else if(acctype == 'Seller'){
        const seller = SellerModel(
            package: 'no data',
          type: 'no data',
          duration: '12 sec'
        );
        await userRef.collection('Create_Ad').doc(user?.uid).set(seller.toJason()).whenComplete(() async {
          const myAds = MyAdsModel(
              adID: 'no data',
            views: 'no data',
          );
          await userRef.collection('My_Ads').doc(user?.uid).set(myAds.toJason());
        });
      }
    }on FirebaseException catch (e){
      Fluttertoast.showToast(msg: '${e.message}');
    }
    Fluttertoast.showToast(msg: 'User Registration Success...');
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
