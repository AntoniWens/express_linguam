import 'package:express_lingua/core/utils/app_colors.dart';
import 'package:express_lingua/screens/account_page.dart';
import 'package:express_lingua/screens/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  void _onSelectMenu(String key) {
    Navigator.pop(context); // Tutup drawer

    switch (key) {
      case 'home':
        setState(() => _selectedIndex = 0);
        break;
      case 'profile':
        setState(() => _selectedIndex = 1);
        break;
      case 'setting':
        setState(() => _selectedIndex = 2);
        break;
      case 'help':
      // buka halaman bantuan
        break;
      case 'exit':
        showDialog(context: context, builder: (context) {
          return AlertDialog(
           backgroundColor: AppColors.white,
           title: Text('Keluar', style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w500
           ),),
            content: Text('Anda yakin keluar dari aplikasi?', textAlign: TextAlign.center,),
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            icon: Image.asset('assets/images/ic_launcher_ealing.png', width: 50,height: 50,),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text('Tidak', style: TextStyle(
                color: AppColors.s194274
              ),)),
              TextButton(onPressed: () {}, child: Text('Ya', style: TextStyle(
                  color: AppColors.s194274
              ),))
            ],
          );
        });
        break;
      default:
        print('Clicked: $key');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: Drawer(
        backgroundColor: AppColors.sb9dbf7,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/ic_header.png'),
                  SizedBox(height: 8,),
                  Text('Dalam 2 bulanan Anda sudah bisa ', style: TextStyle(
                    fontSize: 14
                  ),),
                  Text(' ngobrol dalam bahasa Inggris!',style: TextStyle(
                      fontSize: 14
                  ),)
                ],
              ),
            ),

            // --- Main Menu ---
            ListTile(
              leading: Icon(Icons.home), // Ganti dengan Image.asset jika pakai custom icon
              title: Text('Home'),
              onTap: () => _onSelectMenu('home'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account and Order'),
              onTap: () => _onSelectMenu('profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('General Settings'),
              onTap: () => _onSelectMenu('setting'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () => _onSelectMenu('help'),
            ),

            // --- Group Submenu ---
            ExpansionTile(
              leading: Icon(Icons.group),
              title: Text('Group'),
              children: [
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Groups'),
                  onTap: () => _onSelectMenu('group'),
                ),
                ListTile(
                  leading: Icon(Icons.group_add),
                  title: Text('New Group'),
                  onTap: () => _onSelectMenu('new_group'),
                ),
              ],
            ),

            // --- Admin Submenu ---
            ExpansionTile(
              title: Text('Admin'),
              children: [
                ListTile(
                  leading: Icon(Icons.play_arrow),
                  title: Text('Test Play Audio'),
                  onTap: () => _onSelectMenu('test_play_audio'),
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Insert sentence ke Skipped'),
                  onTap: () => _onSelectMenu('insert_sentence'),
                ),
                ListTile(
                  leading: Icon(Icons.import_export),
                  title: Text('Export'),
                  onTap: () => _onSelectMenu('export'),
                ),
                ListTile(
                  leading: Icon(Icons.backup),
                  title: Text('Backup'),
                  onTap: () => _onSelectMenu('backup'),
                ),
                ListTile(
                  leading: Icon(Icons.upload_file),
                  title: Text('Import Users'),
                  onTap: () => _onSelectMenu('import_user'),
                ),
              ],
            ),

            // --- Exit ---
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () => _onSelectMenu('exit'),
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Background image (seperti SliverAppBar)
            Image.asset(
              'assets/images/bg_v2.webp',
              height: 260,
              width: double.infinity,
              fit: BoxFit.fill,
            ),

            // Header icon (kanan atas)
            Positioned(
              top: 40,
              right: 16,
              left: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) {
                      return GestureDetector(onTap: () {
                        Scaffold.of(context).openDrawer();
                      },child: Icon(Icons.reorder));
                    }
                  ),
                  Image.asset(
                    'assets/images/ic_header.png',
                    width: 140,
                    height: 31,
                  ),
                ],
              ),
            ),
            Positioned.fill(
                child: HomePage())
          ],
        ),
      ),
    );
  }
}
