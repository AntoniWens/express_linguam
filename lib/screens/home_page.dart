import 'package:express_lingua/core/utils/app_colors.dart';
import 'package:express_lingua/screens/intro_page.dart';
import 'package:express_lingua/screens/widget/item_main_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class MainMenu {
  String background;
  String icon;
  String title;

  MainMenu(this.background, this.icon, this.title);
}
class _HomePageState extends State<HomePage> {

  List<MainMenu> menus = [
    MainMenu('assets/images/logo_flashcard_awal.jpg', 'assets/images/icon_challenge_v2.png', 'Challenges'),
    MainMenu('assets/images/bg_stories2.jpg', 'assets/images/icon_learning_v2.png', 'Learn English Through Story'),
    MainMenu('assets/images/bg_challenge.png', 'assets/images/flash_card.png', 'Flashcards'),
    MainMenu('assets/images/logo_flashcard_awal.jpg', 'assets/images/voicepic.jpg', 'Asisten Pintar')
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => IntroPage()));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 80, right: 24),
                child: Text('Introduction to Challenges', style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white
                ),),
              ),
            ),
            SizedBox(height: 116,),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: menus.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                  return ItemMainMenu(onTap: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        backgroundColor: AppColors.white,
                        title: Text('Informasi', style: TextStyle(
                          fontSize: 16
                        ),),
                        iconPadding: EdgeInsets.zero,
                        icon: Image.asset('assets/images/ic_launcher_foreground2.png', width: 50,height: 50,),
                        content: Text('Anda belum menyelesaikan lesson 1.'),

                      );
                    });
                  },title: menus[index].title, icon: menus[index].icon, backgroundAsset: menus[index].background, lockText: '${String.fromCharCode(0x1F510)}',);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
