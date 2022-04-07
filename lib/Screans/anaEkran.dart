import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_app/Screans/oyunEkran.dart';
import 'package:sayi_tahmin_app/Tema/themes.dart';
import 'package:kartal/kartal.dart';

class AnaEkranWidget extends StatefulWidget {
  const AnaEkranWidget({Key? key}) : super(key: key);

  @override
  State<AnaEkranWidget> createState() => _AnaEkranWidgetState();
}

class _AnaEkranWidgetState extends State<AnaEkranWidget> with TickerProviderStateMixin {

  late AnimationController rotateAnimasyonControl;
  late Animation<double> rotateAnimasyonDegerleri;

  @override
  void initState() {
    super.initState();
    rotateAnimasyonControl=AnimationController(duration:Duration(milliseconds: 10000),vsync: this);
    rotateAnimasyonDegerleri=Tween(begin: 0.0,end: pi*2).animate(rotateAnimasyonControl)..addListener(() {setState(() { });});
    rotateAnimasyonControl.forward();
  }

  @override
  void dispose() {
    super.dispose();
    rotateAnimasyonControl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.myWhite,
      appBar: appBarWidget(),
      body: bodyWidget(context),
    );
  }

  Center bodyWidget(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(flex: 30,),
          Text("Tahmin Oyunu",style: TextStyle(color: myColors.myYellow,fontSize: 36),),
          Spacer(flex: 50,),
          Transform.rotate(angle: rotateAnimasyonDegerleri.value,
              child: Image.asset('Images/zar_resim.png')),
          Spacer(flex: 30,),
          SizedBox(
            height: context.dynamicHeight(0.07),
            width: context.dynamicWidth(0.7),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: myColors.myDarkGrean,
                shadowColor: myColors.myBlue,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: myColors.myYellow)
                ),
              ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => OyunEkranWidget()),);
            },
                child: Text("Start",style: TextStyle(color: myColors.myYellow),)),
          ),
          Spacer(flex: 50,),

        ],
      ),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      elevation: 10,
      centerTitle: true,
      title: Text("Sayı Tahmin Oyunu",style: TextStyle(color: myColors.myYellow,) ,),
      backgroundColor: myColors.myDarkGrean,
    );
  }
}
