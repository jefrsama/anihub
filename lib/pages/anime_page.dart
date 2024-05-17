import 'dart:developer';

import 'package:flutter/material.dart';
import '../api/anilibria/anilibria_api_client.dart';
import '../database/db_helper.dart';
import '../database/anime_model.dart';

class AnimePage extends StatefulWidget {
  @override
  _AnimePageState createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  final dbHelper = AnimeDBHelper();
  List<Anime> animes = [];

  @override
  void initState() {
    super.initState();
    refreshAnimeList();
  }

  Future<void> refreshAnimeList() async {
    final List<Anime> animeList = await dbHelper.getAnimes();
    setState(() {
      animes = animeList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var client = AnilibriaApiClient();
    client.getUpdates().then((value) => {
      for(var title in value.list) {
        log(title.names?.ru ?? "None")
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Anime CRUD'),
      ),
      body: ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) {
          final anime = animes[index];
          return ListTile(
            title: Text(anime.title),
            subtitle: Text(anime.description),
            onTap: () {
              _navigateToAddOrUpdateAnimeScreen(context, anime);
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                dbHelper.deleteAnime(anime.id);
                refreshAnimeList();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddOrUpdateAnimeScreen(context, null);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddOrUpdateAnimeScreen(BuildContext context, Anime? anime) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddOrUpdateAnimeScreen(anime: anime),
      ),
    );
    if (result != null && result) {
      refreshAnimeList();
    }
  }
}

class AddOrUpdateAnimeScreen extends StatefulWidget {
  final Anime? anime;

  AddOrUpdateAnimeScreen({required this.anime});

  @override
  _AddOrUpdateAnimeScreenState createState() => _AddOrUpdateAnimeScreenState();
}

class _AddOrUpdateAnimeScreenState extends State<AddOrUpdateAnimeScreen> {
  final dbHelper = AnimeDBHelper();
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _genres;

  @override
  void initState() {
    super.initState();
    _title = widget.anime?.title ?? '';
    _description = widget.anime?.description ?? '';
    _genres = widget.anime?.genres ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.anime == null ? 'Add Anime' : 'Update Anime'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                initialValue: _genres,
                decoration: InputDecoration(labelText: 'Genres'),
                onSaved: (value) {
                  _genres = value!;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final updatedAnime = Anime(
                      id: widget.anime?.id ?? 0,
                      title: _title,
                      description: _description,
                      genres: _genres,
                    );
                    if (widget.anime == null) {
                      final added = await dbHelper.addAnime(updatedAnime);
                      if (added) {
                        Navigator.of(context).pop(true);
                      } else {
                        // Handle error adding anime
                      }
                    } else {
                      dbHelper.updateAnime(updatedAnime);
                      Navigator.of(context).pop(true);
                    }
                  }
                },
                child: Text(widget.anime == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
