import 'package:flutter/material.dart';
import '../../widgets/my_widgets.dart';
import '../screens.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: AppColors.kPrimaryColorDark,
        child: SafeArea(
          //Appbar designs
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.35,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: const AppBar1(
                height1: 0.3,
                height2: 0.18,
              ),
            ),

            //Body elements design
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 40, 0, 0),
                    child: AppText(
                      text: 'Welcome to,',
                      size: 40,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        // <-- use a sized box and change the height
                        height: 130.0,
                        child: ListTile(
                          title: Center(
                            child: Text(
                              'QPS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 128,
                                fontFamily: 'Forte',
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        // <-- use a sized box and change the height
                        height: 25.0,
                        child: ListTile(
                          title: Center(
                            child: Text(
                              'Make your journey easy...',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lucidia',
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              elevation: 0.0,
              color: Colors.transparent,
              child: AppBar4(
                height1: 0.15,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
