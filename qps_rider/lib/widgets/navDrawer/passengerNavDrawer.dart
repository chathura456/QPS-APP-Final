import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class DrawerHeader1 extends StatefulWidget {
  const DrawerHeader1({Key? key}) : super(key: key);

  @override
  State<DrawerHeader1> createState() => _DrawerHeader1();
}

class _DrawerHeader1 extends State<DrawerHeader1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 14, 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.23,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/profile/profile.jpg'),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  "P-145875",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "John Doe",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
