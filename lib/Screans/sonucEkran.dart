import 'package:flutter/material.dart';
import 'package:sayi_tahmin_app/Tema/themes.dart';
import 'package:kartal/kartal.dart';

class SonucEkranWidget extends StatefulWidget {

  bool sonuc;
  SonucEkranWidget({required this.sonuc});



  @override
  _SonucEkranWidgetState createState() => _SonucEkranWidgetState();
}

class _SonucEkranWidgetState extends State<SonucEkranWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.myWhite,
      appBar: widgetAppBar(),
      body: widgetBody(context),
    );
  }
  AppBar widgetAppBar() {
    return AppBar(
      elevation: 10,
      centerTitle: true,
      title: Text("Sayı Tahmin Oyunu",style: TextStyle(color: myColors.myYellow,) ,),
      backgroundColor: myColors.myDarkGrean,
    );
  }

  Center widgetBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(flex: 30,),
          widget.sonuc ? Image.asset('Images/mutlu_resim.png') : Image.asset("Images/uzgun_resim.png"),
          Spacer(flex: 30,),
          Text(widget.sonuc ? "Kazandınız" : "Kaybettiniz" ,style: TextStyle(color: myColors.myYellow,fontSize: 36),),
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
                  Navigator.pop(context);
                },
                child: Text("Tekrar Dene",style: TextStyle(color: myColors.myYellow),)),
          ),
          Spacer(flex: 50,),
        ],
      ),
    );
  }


}
