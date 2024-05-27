import 'package:anihub/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anihub/theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'Anime Hub',
      theme: themeProvider.themeData,
      home: MainPage(),                   //starting page
      locale: localeProvider.locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
              themeProvider.toggleTheme();
            },
          ),
          DropdownButton<Locale>(
            value: localeProvider.locale,
            icon: Icon(Icons.language, color: Colors.grey),
            dropdownColor: const Color.fromARGB(255, 30, 30, 30),
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                localeProvider.setLocale(newLocale);
              }
            },
            items: [
              DropdownMenuItem(
                value: Locale('en'),
                child: Text('English', style: TextStyle(color: Colors.grey)),
              ),
              DropdownMenuItem(
                value: Locale('ru'),
                child: Text('Russian', style: TextStyle(color: Colors.grey)),
              ),
              DropdownMenuItem(
                value: Locale('kk'),
                child: Text('Kazakh', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle(context, S.of(context).hot),
            _buildHotSection(),
            _buildSectionTitle(context, S.of(context).whatsNew),
            _buildWhatsNewSection(),
            _buildSectionTitle(context, S.of(context).newReleases),
            _buildNewReleasesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _buildHotSection() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildHotItem('One Punch Man', 'Description of One Punch Man'),
          _buildHotItem('Attack on Titan', 'Description of Attack on Titan'),
          _buildHotItem('Another Anime', 'Description of Another Anime'),
        ],
      ),
    );
  }

  Widget _buildHotItem(String title, String description) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8.0),
      color: Colors.black12,
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatsNewSection() {
    return Container(
      height: 150,
      margin: EdgeInsets.all(8.0),
      color: Colors.black12,
      child: Center(
        child: Text(
          'Lorem ipsum or whatever gsndsdngsdngs gds',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildNewReleasesSection() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildCategoryChips(),
          _buildNewReleaseItem('Восхождение героя щита', 'Описание Восхождение героя щита'),
          _buildNewReleaseItem('Поднятие уровней в одиночку', 'Описание Поднятие уровней в одиночку'),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 8.0,
      children: [
        Chip(label: Text('fantasy')),
        Chip(label: Text('action')),
        Chip(label: Text('placebo')),
        Chip(label: Text('placebo')),
      ],
    );
  }

  Widget _buildNewReleaseItem(String title, String description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.black12,
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
