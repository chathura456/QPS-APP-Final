import 'package:flutter/material.dart';
import '../colors.dart';

AppBar commonAppBar(String title, BuildContext context){
  return AppBar(
    title: Text(title),
    centerTitle: false,
    titleSpacing: 0.0,
    backgroundColor: AppColors.kPrimaryColor,
    leading: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.white,
        onPressed: (){
          Navigator.pop(context);
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
  );
}