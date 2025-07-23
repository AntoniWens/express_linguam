import 'package:express_lingua/presentation/auth/login/bloc/login_bloc.dart';
import 'package:express_lingua/presentation/auth/login/bloc/login_state.dart';
import 'package:express_lingua/core/utils/app_colors.dart';
import 'package:express_lingua/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/util.dart';
import '../../../injection_container.dart';
import '../register/bloc/register_bloc.dart';
import '../register/register_page.dart';
import 'bloc/login_event.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<LoginBloc,LoginState>(
            listener: (context,state) {
              if (state is LoginLoading) {
                showLoading(context);
              } else if (state is LoginError) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is LoginLoaded) {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage()), (e) => false );
              }
            },
            builder: (context,state) {
              return Scaffold(
                backgroundColor: AppColors.sb9dbf7,
                body: SafeArea(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 48, right: 48, top: 24),
                      child: Image.asset('assets/images/ic_header.png',),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Text('www.expresslingua.com', style: TextStyle(fontSize: 24),),
                    ),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: TextField(
                        controller: emailC,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.s194274)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: AppColors.s194274)
                          ),
                          hintText: 'User ID',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(6),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset('assets/images/ic_icon_user.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: TextField(
                        controller: passwordC,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: AppColors.s194274)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: AppColors.s194274)
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500
                          ),
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(6),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset('assets/images/ic_icon_lock.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                          if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
                            context.read<LoginBloc>().add(LoggedIn(emailC.text, passwordC.text));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Mohon isi semua field')),
                            );
                          }
                        },style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(AppColors.s3D6DA2),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ))
                        ), child: Text('Login', style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20
                        ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => BlocProvider(
                              create: (_) => sl<RegisterBloc>(),
                              child: RegisterPage(),
                            )),
                          );
                        },style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(AppColors.s65b1f1),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ))
                        ), child: Text('Daftar Penguna Baru', style: TextStyle(
                            color: AppColors.white,
                          fontSize: 20
                        ),)),
                      ),
                    )
                  ],
                )),
              );
            }
          );
        }
      ),
    );
  }
}
