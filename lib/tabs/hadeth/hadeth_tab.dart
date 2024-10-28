import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/loading_indicator.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:provider/provider.dart';
import '../../app_theme.dart';
import '../settings/settings.dart';
import 'hadeth.dart';

class HadethTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HadethTab();
}

class _HadethTab extends State<HadethTab>{
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if(ahadeth.isEmpty){
      loadAhadethFile();
    }

    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        Divider(
          color: Provider.of<Settings>(context).isDark ? AppTheme.gold : AppTheme.lightPrimary,
          thickness: 4,
        ),
        Text('الأحاديث',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Divider(
          color: Provider.of<Settings>(context).isDark ? AppTheme.gold : AppTheme.lightPrimary,
          thickness: 4,
        ),
        Expanded(
            child: ahadeth.isEmpty
            ?LoadingIndicator()
            :ListView.separated(
                padding: EdgeInsets.only(top: 16),
                itemBuilder: (_,index) => InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    HadethContentScreen.routeName,
                    arguments: ahadeth[index],
                  ),
                  child: Text(
                    ahadeth[index].title,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                separatorBuilder: (_,__) => SizedBox(height: 12,),
                itemCount: ahadeth.length)
        ),
      ]
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/texts/ahadeth.txt');
    List<String> ahadethStrings = ahadethFileContent.split('#');
    ahadeth = ahadethStrings.map((hadethString){
      List<String> hadthLines = hadethString.trim().split('\n');
      String title = hadthLines[0];
      hadthLines.remove(0);
      List<String> content = hadthLines;
      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}