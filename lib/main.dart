import 'package:flutter/material.dart';
//import 'package:anihub/pages/anime_page.dart';
import 'package:anihub/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSectionTitle(context, 'HOT'),
            _buildHotSection(),
            _buildSectionTitle(context, 'WHAT\'S NEW'),
            _buildWhatsNewSection(),
            _buildSectionTitle(context, 'NEW RELEASES'),
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