import 'package:anihub/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anihub/theme/theme_provider.dart';
import 'package:anihub/pages/login_page.dart';

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
      home: MainPage(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: _buildEndDrawer(context),
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

  Widget _buildEndDrawer(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                ),
                SizedBox(height: 10),
                Text(
                  S.of(context).userProfileName,    //mock username for now (changes on language)
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Toggle Theme'),
            onTap: () {
              themeProvider.toggleTheme();
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Change Language'),
            trailing: DropdownButton<Locale>(
              value: localeProvider.locale,
              icon: Icon(Icons.arrow_drop_down),
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
        ],
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
