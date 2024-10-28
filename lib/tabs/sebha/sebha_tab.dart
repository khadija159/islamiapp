import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_theme.dart';
import '../settings/settings.dart';

class SebhaTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SebhaTab();

}

class _SebhaTab extends State<SebhaTab>{
  int counter=0;
  double rotate = 2;
  String words = 'سبحان الله';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 30, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 450,
            width: 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 140,
                  bottom: 310,
                  child: Image.asset(
                      'assets/images/${Provider.of<Settings>(context).sebhaHeadImage}.png'),
                ),
                GestureDetector(
                  onTap: tasbeeh,
                  child: Transform.rotate(
                    angle: rotate,
                    child: Image.asset(
                        'assets/images/${Provider.of<Settings>(context).sebhaBodyImage}.png'),
                  ),
                )
              ],
            ),
          ),
          Text('عدد التسبيحات', style: Theme.of(context).textTheme.headlineSmall,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
            width: 100,
              height: 110,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text('$counter', style: Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.center,),
              )),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Provider.of<Settings>(context).isDark ? AppTheme.gold : AppTheme.lightPrimary,
              ),
              width: 130,
              height: 51,
              child: Text(words, style:
              Provider.of<Settings>(context).isDark ? Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppTheme.black) : Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppTheme.white), textAlign: TextAlign.center,)),

        ],
      ),
    );
  }
  void tasbeeh(){
    counter++;
    if(counter>=33){
      words = 'الحمدلله';
    }
    if(counter>=66){
      words = 'الله اكبر';
    }
    rotate++;
    setState(() {});
  }

}