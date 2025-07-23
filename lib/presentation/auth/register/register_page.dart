import 'package:express_lingua/data/models/request/generate_otp_body.dart';
import 'package:express_lingua/data/models/request/register_body.dart';
import 'package:express_lingua/data/models/request/send_information_body.dart';
import 'package:express_lingua/presentation/auth/register/bloc/register_bloc.dart';
import 'package:express_lingua/presentation/auth/register/bloc/register_event.dart';
import 'package:express_lingua/presentation/auth/register/bloc/register_state.dart';
import 'package:express_lingua/presentation/auth/login/login_page.dart';
import 'package:express_lingua/screens/widget/custom_button.dart';
import 'package:express_lingua/screens/widget/custom_button1.dart';
import 'package:express_lingua/screens/widget/custom_textfield.dart';
import 'package:express_lingua/core/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/util.dart' as Util;
import '../../../screens/main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController emailC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController phoneReferralC = TextEditingController();
  TextEditingController otpC = TextEditingController();

  String buttonText = "Daftar Akun";

  String userId = "";
  String password = "";
  bool _checked = false;

  bool _showOtpForm = false;
  bool _showRegisterForm = false;

  String _otp = '';

  @override
  void initState() {
    userId = Util.generateUserID(usernameC.text);
    password = Util.generatePassword(30);
    super.initState();
  }


  void _openTermsAndConditions() async {
    final url = Uri.parse("https://expresslingua.com/terms-and-conditions/");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if(state is GenerateOTPLoaded) {
            _otp = state.otp;
            setState(() {
              buttonText = state.buttonText;
            });
          }else if (state is GenerateOTPInitial) {
            setState(() {
              _showOtpForm = true;
            });
          } else if (state is RegisterLoaded) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage()), (e) => false );
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is OpenRegisterForm) {
            if (state.user != null) {
              emailC.text = state.user!.user!.email!;
              usernameC.text = state.user!.user!.displayName!;
            } else {
              setState(() {
                _showRegisterForm = true;
              });
            }
          } else if (state is RegisterChecked) {
            showDialog(context: context, builder: (context) {
              return Dialog(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/ic_launcher_ealing.png', width: 40,height: 40,),
                          Text('Information', style: TextStyle(
                            fontSize: 18,color: AppColors.black,
                            fontWeight: FontWeight.w500
                          ),),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Text('Anda belum menyetujui Syarat dan Ketentuan', style: TextStyle(
                          fontSize: 16,color: AppColors.black,fontWeight: FontWeight.w400
                      ),),
                    ],
                  ),
                ),
              );
            });
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                              child: Image.asset('assets/images/bg_splash_mask.png'),
                            ),
                          ],
                        ),
                        SizedBox(height: 48),
                        Image.asset(
                          'assets/images/ic_header.png',
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 16),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(color: AppColors.backgroundReg),
                            child: _showRegisterForm ? registerForm() : registerView(),
                          ),

                        _showOtpForm ? otp(state) : SizedBox(),

                      ],
                    ),
                  ),
                ),
                _showRegisterForm ? SizedBox() :RichText(
                  text: TextSpan(
                    text: 'Sudah punya akun sebelumnya?',
                    style: TextStyle(color: AppColors.s4B594F),
                    children: [
                      TextSpan(
                        text: '  Masuk',
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()));
                        },
                        style: TextStyle(
                          color: AppColors.s2BB352,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          );
        }
      ),
    );
  }

  Widget registerForm() {
    return Column(
      children: [
        CustomTextfield(
          hint: 'Username',
          image: 'assets/images/ic_icon_user.png',
          controller: usernameC,
        ),
        SizedBox(height: 8),
        CustomTextfield(
          hint: 'Email',
          image: 'assets/images/ic_icon_mail.png',
          controller: emailC,
        ),
        SizedBox(height: 8),
        CustomTextfield(
          hint: 'Phone',
          image: 'assets/images/ic_icon_phone.png',
          controller: phoneC,
        ),
        SizedBox(height: 8),
        CustomTextfield(
          hint: 'Referal Phone (boleh kosong)',
          image: 'assets/images/ic_icon_phone.png',
          controller: phoneReferralC,
        ),
        SizedBox(height: 8),
        CustomButton1(onTap: () async {
          final body = GenerateOtpBody(userId: userId, email: emailC.text, username: usernameC.text, password: password, nohp: phoneC.text);
          context.read<RegisterBloc>().add(GenerateOTP(body));
        }, text: buttonText,fSize: 16,),
      ],
    );
  }

  Widget registerView() {
    return Column(
      children: [
        Text(
          'Pendaftaran Akun',
          style: TextStyle(
            color: AppColors.s0a1c78,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onTap: () => context.read<RegisterBloc>().add(GoogleLogged(_checked)),
                  image: 'assets/images/ic_google.png',
                  text: 'Google',
                ),
                CustomButton(
                  onTap: ()=> context.read<RegisterBloc>().add(ORegisterForm(_checked)),
                  image: 'assets/images/ic_icon_user.png',
                  text: 'Input Data',
                ),
              ],


        ),
        SizedBox(height: 16),
        Row(
          children: [
            Checkbox(
              value: _checked,
              onChanged: (e) {
                setState(() {
                  _checked = e!;
                });
              },
              activeColor: AppColors.black,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'Dengan mendaftar, saya menyetujui',
                  style: TextStyle(color: AppColors.black, fontSize: 12),
                  children: [
                    TextSpan(
                      text: ' Syarat Dan Ketentuan',
                      recognizer: TapGestureRecognizer()..onTap = () {
                        _openTermsAndConditions();
                      },
                      style: TextStyle(
                        color: AppColors.s0E488C,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget otp(RegisterState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '4 digit OTP ada di WA / email pada Folder Spam / Inbox',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: CustomTextfield(
                  controller: otpC,
                  hint: 'Input Kode OTP',
                  image: 'assets/images/ic_done.png',
                ),
              ),
              SizedBox(width: 16),
              state is RegisterLoading ? CircularProgressIndicator() :CustomButton1(
                width: 100,
                onTap: () async {

                  final body = RegisterBody(
                    userid: userId,
                    username: usernameC.text,
                    email: emailC.text,
                    password: password,
                    commercial: "0",
                    phone: phoneC.text,
                    address: "",
                    city: "DKI Jakarta",
                    province: "Jakarta Bart",
                    country: "Indonesia",
                    latitude: "0.0",
                    longitude: "0.0",
                    nohpReferral: phoneReferralC.text,
                  );

                  final sendInformationBody = SendInformationBody(
                    userId: "",
                    username: usernameC.text,
                    email: emailC.text,
                    phone: phoneC.text,
                    phoneReferral: phoneReferralC.text,
                    pesanEmail:
                    "Anda sudah didaftar. Selamat bergabung dan terima kasih.",
                    pesanWa: "Selamat. Teman Anda sudah berhasil didaftar:",
                    kirimEmail: '1',
                    kirimWa: '1',
                  );

                  context.read<RegisterBloc>().add(RegisterUser(body, sendInformationBody, otpC.text, _otp));

                },
                text: 'Send',
                fSize: 19,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
