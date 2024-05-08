import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../database/anime_model.dart';

class AnimeDBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'anime.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE anime(id INTEGER PRIMARY KEY, title TEXT, description TEXT, genres TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<bool> addAnime(Anime anime) async {
    try {
      final db = await this.db;
      final id = await db!.insert('anime', anime.toMap());
      anime.id = id;
      return true;
    } catch (e) {
      print('Error inserting anime: $e');
      return false;
    }
  }

  Future<List<Anime>> getAnimes() async {
    final db = await this.db;
    final List<Map<String, dynamic>> maps = await db!.query('anime');
    return List.generate(
      maps.length,
      (i) => Anime.fromMap(maps[i]),
    );
  }

  Future<void> updateAnime(Anime anime) async {
    final db = await this.db;
    await db!.update(
      'anime',
      anime.toMap(),
      where: 'id = ?',
      whereArgs: [anime.id],
    );
  }

  Future<void> deleteAnime(int id) async {
    final db = await this.db;
    await db!.delete(
      'anime',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
