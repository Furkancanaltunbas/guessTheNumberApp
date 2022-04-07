import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_app/Screans/sonucEkran.dart';
import 'package:sayi_tahmin_app/Tema/themes.dart';
import 'package:kartal/kartal.dart';

class OyunEkranWidget extends StatefulWidget {
  const OyunEkranWidget({Key? key}) : super(key: key);

  @override
  _OyunEkranWidgetState createState() => _OyunEkranWidgetState();
}

class _OyunEkranWidgetState extends State<OyunEkranWidget> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme ="";

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
    print("Rastgele Sayi : $rastgeleSayi");
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
          Text("Kalan Hak : $kalanHak",style: TextStyle(color: myColors.myYellow,fontSize: 20),),
          Spacer(flex: 30,),
          Text("Yardım : $yonlendirme",style: TextStyle(color: myColors.myYellow,fontSize: 20),),
          Spacer(flex: 50,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: tfTahmin,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Tahmin",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                )
              ),
            ),
          ),
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
                  setState(() {
                    kalanHak=kalanHak-1;
                  });
                  int tahmin=int.parse(tfTahmin.text);

                  if(tahmin==rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkranWidget(sonuc: true)));
                  }
                  if(tahmin>rastgeleSayi){
                    setState(() {
                      yonlendirme="Tahmini Azalt";
                    });
                  }
                  if(tahmin<rastgeleSayi){
                    setState(() {
                      yonlendirme="Tahmin Arttır";
                    });
                  }
                  if(kalanHak==0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkranWidget(sonuc: false)));
                  }
                  tfTahmin.text="";


                },
                child: Text("Tahmin Et",style: TextStyle(color: myColors.myYellow),)),
          ),
          Spacer(flex: 30,),
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
