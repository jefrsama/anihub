import 'package:anihub/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anihub/theme/theme_provider.dart';
import 'package:anihub/generated/l10n.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, String>> watchingAnime = [
    {'title': 'One Punch Man', 'description': 'Description of One Punch Man'},
    {'title': 'Attack on Titan', 'description': 'Description of Attack on Titan'},
    {'title': 'Another Anime', 'description': 'Description of Another Anime'},
    //еще если надо
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'User Name', // actual username
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: watchingAnime.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.black12,
                    child: ListTile(
                      title: Text(watchingAnime[index]['title']!),
                      subtitle: Text(
                        watchingAnime[index]['description']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
