import 'package:package_info_plus/package_info_plus.dart';

class Environment {
  static const String _packageName = "com.neosolusi.expresslingua";
  static const String _packageNameDebug = "$_packageName.debug";

  static String baseUrl = 'http://fire.neosolusi.com/';
  static String mobileBaseUrl = '';
  static String buildNumber = '0';
  static String version = '';

  static Future<void> initialize() async {
    final packageInfo = await PackageInfo.fromPlatform();

    switch (packageInfo.packageName) {
      case _packageName:
        baseUrl =  'http://fire.neosolusi.com/';
        mobileBaseUrl =  'http://101.50.0.157:3000/';
       buildNumber = packageInfo.buildNumber;
       version = packageInfo.version;
        break;
      case _packageNameDebug:
        baseUrl =  'http://fire.neosolusi.com/';
        mobileBaseUrl =  'http://101.50.0.157:3000/';
        buildNumber = packageInfo.buildNumber;
        version = packageInfo.version;
        break;

      default:
        break;
    }
  }
}
