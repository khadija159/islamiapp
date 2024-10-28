import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'language.dart';

class SettingsTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingsTab();
  }

class _SettingsTab extends State<SettingsTab>{
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar'),
  ];

  @override
  Widget build(BuildContext context) {
    Settings settingsProvider = Provider.of<Settings>(context);

    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30, top: 100),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.themedark,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(value: settingsProvider.isDark,
                  activeColor: AppTheme.gold,
                onChanged: (value) => settingsProvider.changeTheme(value ? ThemeMode.dark : ThemeMode.light),),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.langs,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButtonHideUnderline(child:
              DropdownButton<Language>(
                value: languages.firstWhere((language)
                => language.code == settingsProvider.languageCode),
                  items: languages.map(
                          (language) => DropdownMenuItem(
                            child: Text(language.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            value: language,),
                  ).toList(),
                  onChanged: (selectedLanguage){
                  if(selectedLanguage != null){
                    settingsProvider.changeLanguage(selectedLanguage.code);
                  }
                  },
                borderRadius: BorderRadius.circular(20),
                dropdownColor: settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white,

              ),
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}
