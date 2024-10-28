import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_theme.dart';
import '../settings/settings.dart';

class RadioTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Settings settingsProvider = Provider.of<Settings>(context);
    return Container(
      margin: EdgeInsets.only(top: 170),
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/radio_image.png'),
          Text('اذاعة القرآن الكريم',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.skip_previous,size: 36, color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,),
                Icon(Icons.play_arrow, size: 36, color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,),
                Icon(Icons.skip_next, size: 36, color: settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,),
              ],
            ),
          ),
        ],
      ),
    );
  }

}