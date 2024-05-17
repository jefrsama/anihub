import 'dart:async';

import 'package:anihub/api/anilibria/models/title.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/pagination_list.dart';

abstract class AAnilibriaApiClient {
  /*
  GET title – 
GET title/list – 
GET title/updates – 
GET title/changes – 
GET title/schedule – Расписание выхода тайтлов, отсортированное по дням недели
GET title/random – Возвращает случайный тайтл из базы
GET title/search – Возвращает список найденных по фильтрам тайтлов
GET title/search/advanced – Поиск информации по продвинутым фильтрам с поддержкой сортировки
GET title/franchises – Получить информацию о франшизе по ID тайтла
GET youtube – Информация о вышедших роликах на наших YouTube каналах в хронологическом порядке
GET feed – Список обновлений тайтлов и роликов на наших YouTube каналах в хронологическом порядке
GET years – Возвращает список годов выхода доступных тайтлов по возрастанию
GET genres – Возвращает список всех жанров по алфавиту
GET team – Возвращает список участников команды, когда-либо существовавших на проекте.
GET torrent/seed_stats – Возвращает список пользователей и их статистику на трекере.
GET torrent/rss – Возвращает список обновлений на сайте в одном из форматов RSS ленты
GET franchise/list – Возвращает список всех франшиз
   */
  /// Get information about the title
  /// * [id] - Title ID
  /// * [code] - Title code
  /// * [torrentId] - ID of the torrent file
  /// * [filter] - List of values that will be in the response
  /// * [remove] - List of values that will be removed from the response
  /// * [include] - List of file types that will be returned as a base64 string. [More...](https://github.com/anilibria/docs/blob/master/api_v3.md#include)
  /// * [descriptionType] - Type of description received. [More...](https://github.com/anilibria/docs/blob/master/api_v3.md#description_type)
  /// * [playlistType] - Format of the resulting list of series, `object` or `array`. Default is `object`
  Future<Title?> getTitle({int? id, String? code, int? torrentId, String? filter, String? remove, String? include, String? descriptionType, String? playlistType});
  
  /// Get information about several titles at once
  /// * [idList] - List of title IDs
  /// * [codeList] - List of title codes
  /// * [filter] - List of values that will be in the response
  /// * [remove] - List of values that will be removed from the response
  /// * [include] - List of file types that will be returned as a base64 string. [More...](https://github.com/anilibria/docs/blob/master/api_v3.md#include)
  /// * [descriptionType] - Type of description received. [More...](https://github.com/anilibria/docs/blob/master/api_v3.md#description_type)
  /// * [playlistType] - Format of the resulting list of series, `object` or `array`.  Default is `object`
  /// * [page] - Page number
  /// * [itemsPerPage] - Number of elements on the page
  /// 
  /// In the `filter` and `remove` parameters, you can specify the full path to the key that you want to keep or remove, for example: `names.alternative` or `team.voice[0]`. Since version 2.8 it became possible to get the values of one key in all objects in an array, for example: `torrents.list[*].torrent_id`
  Future<List<Title>?> getTitles({List<int>? idList, List<String>? codeList, List<int>? torrentIdList, String? filter, String? remove, String? include, String? descriptionType, String? playlistType, int? page, int? itemsPerPage});
  /// Список тайтлов, отсортированные по времени изменения
  Future<PaginationList> getChanges({String? filter, String? remove, String? include, int? limit,  int? since, String? playlistType, int? after, int? page, int? itemsPerPage});
  /// Список тайтлов, отсортированные по времени добавления нового релиза
  Future<PaginationList> getUpdates({String? filter, String? remove, String? include, int? limit, int? since, String? descriptionType, String? playlistType, int? after, int? page, int? itemsPerPage});

  Future getSchedule();
  Future getRandomTitle();
  Future getYears();
  Future getGenres();
  Future searchTitles();
}

class AnilibriaApiClient extends AAnilibriaApiClient {
  String baseUrl = "https://api.anilibria.tv/v3";

/*
    var queryParameters = <String, String>{};
    if (id != null) {
      queryParameters['id'] = id.toString();
    }
    if (code != null) {
      queryParameters['code'] = code;
    }
    var url = Uri.parse('$baseUrl/title').replace(queryParameters: queryParameters);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Future.value(Title.fromJson(jsonDecode(response.body)));
    } else {
      return null;
    }
 */
  
  @override
  Future<PaginationList> getUpdates({String? filter, String? remove, String? include, int? limit, int? since, String? descriptionType, String? playlistType, int? after, int? page, int? itemsPerPage}) async {
    var queryParameters = <String, String>{};
    if (filter != null) {
      queryParameters['filter'] = filter;
    }
    if (remove != null) {
      queryParameters['remove'] = remove;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (since != null) {
      queryParameters['since'] = since.toString();
    }
    if (descriptionType != null) {
      queryParameters['description_type'] = descriptionType;
    }
    if (remove != null) {
      queryParameters['remove'] = remove;
    }
    if (include != null) {
      queryParameters['include'] = include;
    }
    if (playlistType != null) {
      queryParameters['playlist_type'] = playlistType;
    }
    if (after != null) {
      queryParameters['after'] = after.toString();
    }
    if (page != null) {
      queryParameters['page'] = page.toString();
    }
    if (itemsPerPage != null) {
      queryParameters['items_per_page'] = itemsPerPage.toString();
    }
    var url = Uri.parse('$baseUrl/title/updates').replace(queryParameters: queryParameters);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Future.value(PaginationList.fromJson(jsonDecode(response.body)));
    } else {
      return PaginationList(
        list: List.empty(),
        pagination: Pagination(currentPage: 0, itemsPerPage: 0, pages: 0, totalItems: 0)
      );
    }
  }
  
  @override
  Future<PaginationList> getChanges({String? filter, String? remove, String? include, int? limit, int? since, String? playlistType, int? after, int? page, int? itemsPerPage}) {
    // TODO: implement getChanges
    throw UnimplementedError();
  }
  
  @override
  Future getGenres() {
    // TODO: implement getGenres
    throw UnimplementedError();
  }
  
  @override
  Future getRandomTitle() {
    // TODO: implement getRandomTitle
    throw UnimplementedError();
  }
  
  @override
  Future getSchedule() {
    // TODO: implement getSchedule
    throw UnimplementedError();
  }
  
  @override
  Future<Title?> getTitle({int? id, String? code, int? torrentId, String? filter, String? remove, String? include, String? descriptionType, String? playlistType}) {
    // TODO: implement getTitle
    throw UnimplementedError();
  }
  
  @override
  Future<List<Title>?> getTitles({List<int>? idList, List<String>? codeList, List<int>? torrentIdList, String? filter, String? remove, String? include, String? descriptionType, String? playlistType, int? page, int? itemsPerPage}) {
    // TODO: implement getTitles
    throw UnimplementedError();
  }
  
  @override
  Future getYears() {
    // TODO: implement getYears
    throw UnimplementedError();
  }
  
  @override
  Future searchTitles() {
    // TODO: implement searchTitles
    throw UnimplementedError();
  }
}
