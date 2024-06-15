import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final _languages = [
    Language(name: "O'zbek", code: 'uz'),
    Language(name: "Русский", code: 'ru'),
    Language(name: "English", code: 'en'),
    Language(name: "Español", code: 'es'),
    Language(name: "한국어", code: 'ko'),
    Language(name: "عربي", code: 'ar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("settings".tr()),
      ),
      body: Center(
        child: Column(
          children: [
            SwitchListTile(value: AdaptiveTheme.of(context).mode.isDark, onChanged: (v) {
              if(v) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
            }, title: Text("theme".tr())),
            const SizedBox(height: 20),
           CupertinoButton.filled(onPressed: _showLanguageDialog, child: Text("ch_ln".tr()))
          ],
        ),
      ),
    );
  }
  void _showLanguageDialog() {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("ch_ln".tr()),
      content: SizedBox(
        height: 350,
        width: 300,
        child: ListView.builder(
          itemCount: _languages.length,
          itemBuilder: (context, index) {
            return RadioListTile(value: context.locale.languageCode, groupValue: _languages[index].code, onChanged: (v) {
               Navigator.of(context).pop();
              context.setLocale(Locale(_languages[index].code));
            },title: Text(_languages[index].name));
          },
        ),
      ),
    ));
  }
}
class Language {
  String code;
  String name;

  Language({required this.name, required this.code});
}
