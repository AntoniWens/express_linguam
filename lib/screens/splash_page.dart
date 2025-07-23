import 'package:express_lingua/presentation/auth/register/register_page.dart';
import 'package:express_lingua/screens/widget/gradient_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/utils/app_colors.dart';
import '../injection_container.dart';
import '../presentation/auth/register/bloc/register_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Ganti HomePage() dengan halaman tujuan Anda
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BlocProvider(
          create: (_) => sl<RegisterBloc>(),
          child: RegisterPage(),
        )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/bg_splash.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 0,
                    child: Image.asset('assets/images/bg_splash_mask.png'))
              ],
            ),
            SizedBox(height: 48),
            Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.icLauncherBackground,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/ic_launcher_foreground2.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Image.asset(
                  'assets/images/ic_header.png',
                  width: 150,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Card(
                      color: AppColors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        'SELAMAT DATANG!',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  '100%',
                  style: TextStyle(fontSize: 12, color: AppColors.black),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 8),
                    child: GradientProgressIndicator(progress: 0.5)),
                Text(
                  'Ver 1.0.3',
                  style: TextStyle(fontSize: 12, color: AppColors.versionText),
                )
              ],
            ),
            SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}
