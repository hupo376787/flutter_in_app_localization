import 'package:flutter/material.dart';

import 'package:flutter_in_app_localization/application.dart';
import 'package:flutter_in_app_localization/helpers/app_translations.dart';

class LanguageSelectorPage extends StatefulWidget{
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage>{
  static final List<String> langiageList = application.supportedLanguages;
  static final List<String> languageCodesList = application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languageMap = {
    langiageList[0]: languageCodesList[0],
    langiageList[1]: languageCodesList[1],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(AppTranslations.of(context).text("title_select_language"))),
      body: _buildLaguageList(),
    );
  }

  _buildLaguageList(){
    return ListView.builder(
        itemCount: langiageList.length,
        itemBuilder: (context, index){
          return _buildLanguageItem(langiageList[index]);
        }
    );
  }

  _buildLanguageItem(String language){
    return InkWell(
      onTap: (){
        print(language);
        application.onLocaleChanged(Locale(languageMap[language]));
      },
      child: Center(
        child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            language,
            style: new TextStyle(
              color: Colors.orangeAccent
            ),
          ),
        ),
      ),
    );
  }
}