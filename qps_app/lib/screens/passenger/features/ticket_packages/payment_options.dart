import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qps_app/widgets/my_widgets.dart';
import 'package:qps_app/screens/screens.dart';


class PaymentOptions extends StatefulWidget {
  const PaymentOptions({Key? key, required this.package}) : super(key: key);
  final String package;

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  var cardNoController = TextEditingController();
  var cardHolderController = TextEditingController();
  var cardDateController = TextEditingController();
  var cardCVVController = TextEditingController();
  var ezCashNoController = TextEditingController();
  var ezCashPinController = TextEditingController();
  var mCashNoController = TextEditingController();
  var mCashPinController = TextEditingController();
  int value = 1;
  bool saveCard = false;
  String cardNo='',holderName='';
  CardType cardType = CardType.Invalid;

  @override
  void initState() {
    cardNoController.addListener(
          () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          title: const Text('Payment Options'),
          centerTitle: false,
          titleSpacing: 0.0,
          backgroundColor: AppColors.kPrimaryColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: (){
                /*setState(() {
                  value = 0;
                });*/
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const TicketPackages(balance: 100)));
              },
            ),
          ),
          /*leading: GestureDetector(
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),*/
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  //const SizedBox(height: 20,),
                  /*Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Select Your Payment Method',style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                    ],
                  ),*/
                  const SizedBox(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: (){
                                    setState(() {
                                      value = 1;
                                    });
                                  },
                                    title: Text('Debit/Credit Card',style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: value==1?AppColors.kPrimaryColor:AppColors.kPrimaryColor60,
                                    ),),
                                    leading: Radio(
                                      fillColor: MaterialStateColor.resolveWith((states) =>
                                      value==1?AppColors.kPrimaryColor:AppColors.kPrimaryColor60),
                                      value: 1,
                                      groupValue: value,
                                      onChanged: (value) {
                                        setState(() {
                                          value=1;
                                        });
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                           Padding(
                             padding: const EdgeInsets.only(right: 30),
                             child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){
                                    setState(() {
                                      value=1;
                                    });
                                  },
                                    icon: Icon(value!=1?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,
                                    color: value==1?AppColors.kPrimaryColor:AppColors.kPrimaryColor60,size: 30,),),
                                ],
                              ),
                           ),
                        ],
                      ),
                      Padding(padding: const EdgeInsets.only(left: 30,right: 40,top: 5,bottom: 5),
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: value!=2?AppColors.kPrimaryColor30:AppColors.kPrimaryColor60,
                          ),
                        ),
                      ),
                       Visibility(
                         visible: value==1,
                         maintainState: true,
                         child: SizedBox(
                           height: 390,
                           child: Padding(
                               padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                               child: Column(
                                   children: [
                                     MyTextInputField(
                                               keyboardType: TextInputType.number,
                                               inputFormatters: [
                                                 FilteringTextInputFormatter.digitsOnly,
                                                 LengthLimitingTextInputFormatter(19),
                                                 CardNumberInputFormatter(),
                                               ],
                                               icon: Icons.credit_card_sharp,
                                               hintText: 'Enter Card Number',
                                               suffixIcon: CardUtils.getCardIcon(cardType),
                                               //isEnabled: _cardEnable,
                                               controller: cardNoController),
                                           const SizedBox(height: 25,),
                                           MyTextInputField(
                                               icon: Icons.person,
                                               hintText: 'Enter Card Holder Name',
                                               //isEnabled: _cardEnable,
                                               controller: cardHolderController),
                                     const SizedBox(height: 25,),
                                     Row(
                                       children: [
                                         Expanded(
                                           child: MyTextInputField(
                                             icon: Icons.calendar_month,
                                               keyboardType: TextInputType.number,
                                               inputFormatters: [
                                                 FilteringTextInputFormatter.digitsOnly,
                                                 LengthLimitingTextInputFormatter(4),
                                                 CardMonthInputFormatter(),
                                               ],
                                               hintText: 'MM/YY',
                                               //isEnabled: _cardEnable,
                                               controller: cardDateController),
                                         ),
                                         const SizedBox(width: 16),
                                         Expanded(
                                           child: MyTextInputField(
                                               keyboardType: TextInputType.number,
                                               icon: Icons.password,
                                               inputFormatters: [
                                                 FilteringTextInputFormatter.digitsOnly,
                                                 LengthLimitingTextInputFormatter(4),
                                               ],
                                               hintText: 'CVV',
                                               isPassword: true,
                                               controller: cardCVVController),
                                         ),
                                       ],
                                     ),
                                     const SizedBox(height: 0,),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       children: [
                                         Expanded(
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.end,
                                             children: [
                                               Text('Save Card',style: TextStyle(fontSize: 16,color: AppColors.kPrimaryColor60,fontWeight: FontWeight.bold),),
                                               Switch(
                                                 activeColor: AppColors.kPrimaryColor,
                                                 inactiveThumbColor: AppColors.kPrimaryColor10,
                                                 inactiveTrackColor: AppColors.kPrimaryColor10,
                                                 value: saveCard,
                                                 onChanged: (value)=>setState(() {
                                                   if(saveCard==false) {
                                                     saveCard=true;
                                                   }else{
                                                     saveCard=false;
                                                   }
                                                 }),
                                               ),
                                             ],
                                           )
                                         ),/*
                                         const Expanded(
                                           child: Text('Save Card',style: TextStyle(fontSize: 16,color: AppColors.kPrimaryColor,fontWeight: FontWeight.bold),),
                                         ),
                                         const SizedBox(width: 1),
                                         Expanded(
                                           child: Switch(
                                             value: saveCard,
                                             onChanged: (value)=>setState(() {
                                               saveCard=true;
                                             }),
                                           ),
                                         ),*/
                                       ],
                                     ),
                                     Row(
                                       children: [
                                         Expanded(
                                           child: Column(
                                             children: [
                                               const SizedBox(height: 10,),
                                               const Text('Total',style: TextStyle(fontSize: 14,color: AppColors.kPrimaryColor),),
                                               Text('${widget.package} LKR',style: const TextStyle(fontSize: 26,color: AppColors.kPrimaryColor,fontWeight: FontWeight.w900),),
                                             ],
                                           ),
                                         ),
                                         const SizedBox(width: 1),
                                         Expanded(
                                           child: RoundedButton2(press: (){

                                             setState(() {
                                               cardNo=cardNoController.text.trim();
                                             });
                                           },text: 'Process',),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                             ),


                         ),
                       ),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: (){
                                    setState(() {
                                      value = 2;
                                    });
                                  },
                                  title: Text('eZ Cash',style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: value==2?AppColors.kPrimaryColor:AppColors.kPrimaryColor60,
                                  ),),
                                  leading: Radio(
                                    fillColor: MaterialStateColor.resolveWith((states) =>
                                    value==2?AppColors.kPrimaryColor:AppColors.kPrimaryColor60),
                                    value: 2,
                                    groupValue: value,
                                    onChanged: (value) {
                                      setState(() {
                                        value=2;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){
                                  setState(() {
                                    value=2;
                                  });
                                },
                                  icon: Icon(value!=2?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,
                                    color: value==2?AppColors.kPrimaryColor:AppColors.kPrimaryColor60,size: 30,),),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Visibility(
                        visible: value==2,
                        maintainState: true,
                        child: SizedBox(height: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                            child: Column(
                              children: [
                                MyTextInputField(
                                    keyboardType: TextInputType.number,
                                    hintText: 'eZ Cash Account Number',
                                    //isEnabled: _cardEnable,
                                    controller: ezCashNoController),
                                const SizedBox(height: 20,),
                                MyTextInputField(
                                    keyboardType: TextInputType.number,
                                    hintText: 'eZ Cash Pin No',
                                    //isEnabled: _cardEnable,
                                    controller: ezCashPinController),
                                const SizedBox(height: 10,),
                                RoundedButton2(text: 'Confirm',press: (){},
                                buttonColor: AppColors.kPrimaryColor60,),
                                const SizedBox(height: 10,),
                                Text('This feature is not yet available. It will be available soon'
                                ,style: TextStyle(color: AppColors.kPrimaryColor60,),textAlign: TextAlign.center,)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(left: 30,right: 40,top: 5),
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: value!=2?AppColors.kPrimaryColor30:AppColors.kPrimaryColor60,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: (){
                                    setState(() {
                                      value = 3;
                                    });
                                  },
                                  title: Text('mCash',style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: value==3?AppColors.kPrimaryColor:AppColors.kPrimaryColor60,
                                  ),),
                                  leading: Radio(
                                    fillColor: MaterialStateColor.resolveWith((states) =>
                                    value==3?AppColors.kPrimaryColor:AppColors.kPrimaryColor60),
                                    value: 3,
                                    groupValue: value,
                                    onChanged: (value) {
                                      setState(() {
                                        value=3;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){
                                  setState(() {
                                    value=3;
                                  });
                                },
                                  icon: Icon(value!=3?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,
                                    color: value==3?AppColors.kPrimaryColor:AppColors.kPrimaryColor60,size: 30,),),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Visibility(
                        visible: value==3,
                        maintainState: true,
                        child: SizedBox(height: 350,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                            child: Column(
                              children: [
                                MyTextInputField(
                                    keyboardType: TextInputType.number,
                                    hintText: 'mCash Account Number',
                                    //isEnabled: _cardEnable,
                                    controller: mCashNoController),
                                const SizedBox(height: 20,),
                                MyTextInputField(
                                    keyboardType: TextInputType.number,
                                    hintText: 'mCash Pin No',
                                    //isEnabled: _cardEnable,
                                    controller: ezCashPinController),
                                const SizedBox(height: 20,),
                                RoundedButton2(text: 'Confirm',press: (){},
                                  buttonColor: AppColors.kPrimaryColor60,),
                                const SizedBox(height: 10,),
                                Text('This feature is not yet available. It will be available soon'
                                  ,style: TextStyle(color: AppColors.kPrimaryColor60,),textAlign: TextAlign.center,)


                              ],
                            ),
                          ),
                        ),
                      ),
                      Text('card No :$cardNo')
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void getCardTypeFrmNumber() {
    if (cardNoController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(cardNoController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }
}
