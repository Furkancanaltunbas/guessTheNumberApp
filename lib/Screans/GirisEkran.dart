import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sayi_tahmin_app/Screans/anaEkran.dart';
import 'package:sayi_tahmin_app/Tema/themes.dart';

class GirisEkranWidget extends StatefulWidget {
  const GirisEkranWidget({Key? key}) : super(key: key);

  @override
  _GirisEkranWidgetState createState() => _GirisEkranWidgetState();
}

class _GirisEkranWidgetState extends State<GirisEkranWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
            height: context.dynamicHeight(1.0),
            width: context.dynamicWidth(1.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(
                    'Images/Giris_resmi.jpg'
                ),
                    fit: BoxFit.cover
                ),
              ),
              child: Column(
                children: [
                  Spacer(flex: 20,),
                  Text("KAÇ TUTTUM ? \n",style: TextStyle(color: myColors.myDarkPurple,fontSize: 25,fontWeight: FontWeight.w900,fontStyle: FontStyle.italic),),
                  Text("Tahmin Ettiğim"
                      "\n                 sayıyı bil "
                      "\n                       oyunu kazan !",style: TextStyle(color: myColors.myDarkGrean,fontSize: 25,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                  Spacer(flex: 80,),
                  SizedBox(
                    width: context.dynamicWidth(0.5),
                    height: context.dynamicHeight(0.05),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: myColors.myDarkPurple,
                        shadowColor: myColors.myDarkPurple,
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                      ),
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AnaEkranWidget()),);
                    }, child: Text("Next")
                    ),
                  ),
                  Spacer(flex: 5,),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
