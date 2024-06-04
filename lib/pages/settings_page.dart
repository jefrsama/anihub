import 'package:anihub/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anihub/theme/theme_provider.dart';
import 'package:anihub/main.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(S.of(context).toggleTheme),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              ),
            ),
            ListTile(
              title: Text(S.of(context).changeLanguage),
              trailing: DropdownButton<Locale>(
                value: localeProvider.locale,
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    localeProvider.setLocale(newLocale);
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: Locale('ru'),
                    child: Text('Russian'),
                  ),
                  DropdownMenuItem(
                    value: Locale('kk'),
                    child: Text('Kazakh'),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(S.of(context).changeFontFamily),
              trailing: DropdownButton<String>(
                value: themeProvider.fontFamily,
                onChanged: (String? newFamily) {
                  if (newFamily != null) {
                    themeProvider.setFontFamily(newFamily);
                  }
                },
                items: ['Roboto', 'Courier New', 'Times New Roman'].map((String family) {
                  return DropdownMenuItem<String>(
                    value: family,
                    child: Text(family),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
