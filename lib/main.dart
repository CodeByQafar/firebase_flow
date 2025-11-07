import 'package:firebase_flow/src/core/utils/services/env_service.dart';
import 'package:flutter/material.dart';

import 'src/core/theme/theme.dart';
import 'src/future/chat/view/home_view.dart';


void main() async { 
 await EnvService.envLoad();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Flow',
      theme: AppTheme.theme,
      home: HomeView(),
    );
  }
}