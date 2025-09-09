import 'package:flutter/material.dart';

import 'src/core/theme/theme.dart';
import 'src/future/home/view/home_view.dart';


void main(){
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