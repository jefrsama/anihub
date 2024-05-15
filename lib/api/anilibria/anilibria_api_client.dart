import 'dart:async';

import 'package:anihub/api/anilibria/models/title.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/pagination_list.dart';

abstract class AAnilibriaApiClient {
  /*
  GET title – Получить информацию о тайтле
GET title/list – Получить информацию о нескольких тайтлах сразу
GET title/updates – Список тайтлов, отсортированные по времени добавления нового релиза
GET title/changes – Список тайтлов, отсортированные по времени изменения
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
   Future<Title?> getTitle({int? id, String? code});
   Future<List<Title>?> getTitleList({int? id, String? code});
   Future<PaginationList> getUpdates({String? filter, String? remove, int? limit, int? since, String? descriptionType, String? playlistType, int? after, int? page, int? itemsPerPage});
}

class AnilibriaApiClient extends AAnilibriaApiClient {
  String baseUrl = "https://api.anilibria.tv/v3";

  @override
  Future<Title?> getTitle({id, code}) async {
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

  }
  
  @override
  Future<List<Title>?> getTitleList({int? id, String? code}) async {
    var queryParameters = <String, String>{};
    if (id != null) {
      queryParameters['id'] = id.toString();
    }
    if (code != null) {
      queryParameters['code'] = code;
    }
    var url = Uri.parse('$baseUrl/title/list').replace(queryParameters: queryParameters);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Future.value((jsonDecode(response.body) as List<Map<String, dynamic>>).map((e) => Title.fromJson(e)).toList());
    } else {
      return null;
    }
  }
  
  @override
  Future<PaginationList> getUpdates({String? filter, String? remove, int? limit, int? since, String? descriptionType, String? playlistType, int? after, int? page, int? itemsPerPage}) async {
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
}
