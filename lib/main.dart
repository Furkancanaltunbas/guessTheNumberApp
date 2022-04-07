import 'package:flutter/material.dart';
import 'package:sayi_tahmin_app/Screans/GirisEkran.dart';
import 'package:sayi_tahmin_app/Screans/anaEkran.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: GirisEkranWidget(),
    );
  }
}

