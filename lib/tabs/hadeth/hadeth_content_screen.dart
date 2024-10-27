import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:provider/provider.dart';
import '../../app_theme.dart';
import '../settings/settings.dart';



class HadethContentScreen extends StatelessWidget{
  static const String routeName = '/hadeth-content';

  @override
  Widget build(BuildContext context) {
    Settings settingsProvider = Provider.of<Settings>(context);
    Hadeth args = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/${Provider.of<Settings>(context).backgroundImage}.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.07,
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            color: settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child:ListView.builder(
            itemBuilder: (_,index) => Text(
              args.content[index],
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            itemCount: args.content.length,
          ),
        ),
      ),
    );
  }

}