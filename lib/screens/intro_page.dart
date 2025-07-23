import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(
        children: [
          Stack(
            children: [
              Opacity(opacity: 0.3,child: Image.asset('assets/images/smiling_girl_pexels.jpg', height: 300,width: double.infinity,fit: BoxFit.fill,)),
              ListView.builder(
                shrinkWrap: true,
                  itemBuilder: (context, index) {

              })
            ],
          ),
        ],
      )),
    );
  }
}
