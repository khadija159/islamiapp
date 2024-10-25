import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/loading_indicator.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:flutter/services.dart';

class SuraContentScreen extends StatefulWidget{
  static const String routeName = '/sura-content';

  @override
  State<StatefulWidget> createState() => _SuraContentScreen();

}

class _SuraContentScreen extends State<SuraContentScreen>{
  List<String> ayat = [];

  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    if(ayat.isEmpty){
      loadSuraFile();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.suraName),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.07,
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ayat.isEmpty
            ? LoadingIndicator()
            : ListView.builder(
                itemBuilder: (_,index) => Text(
                    ayat[index],
                  style: Theme.of(context).textTheme.titleLarge,
              ),
            itemCount: ayat.length,
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/texts/${args.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState((){});
  }

}