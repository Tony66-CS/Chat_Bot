import 'package:flutter/material.dart';

import '../../core/colors_manager.dart';
import '../../core/routes_manager.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
        children: [
          Text('Your AI Assistant',style: TextStyle(
           fontSize: 23,
           color: ColorsManager.blue
          ),),
          SizedBox(height: 14,),
          Text('Using this software,you can ask you questions and receive articles using artificial intelligence assistant',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: ColorsManager.grey,
            ),),
          SizedBox(height: 30,),
          Expanded(child: Image.asset('assets/ONBoarding.png')),
          SizedBox(height: 30,),
          TextButton(
            onPressed: () {Navigator.pushNamed(context, RoutesManager.mainLayout);},
            style: TextButton.styleFrom(
              backgroundColor: ColorsManager.blue, // optional
              foregroundColor: ColorsManager.white, // text color
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Continue'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                ],

          ),


          ),
          SizedBox(height: 10,),

        ]
        ),
      ),
    );
  }
}