import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../exception/env_exception.dart';

class EnvService {
 static Future<void> envLoad() async{
   try {
   await dotenv.load(fileName: ".env");
   } catch (e) {
     throw EnvFileNotFoundException(".env file is not found");
   }
  }

  static String get baseUrl=>dotenv.env["FIRBASE_BASE_URL"]??"";
} 