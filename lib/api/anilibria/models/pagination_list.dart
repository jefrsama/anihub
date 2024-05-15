import 'title.dart';

class PaginationList {
  late List<Title> list;
  late Pagination pagination;

  PaginationList({required this.list, required this.pagination});

  factory PaginationList.fromJson(Map<String, dynamic> json) {
    return PaginationList(
      list: (json['list'] as List).map((e) => Title.fromJson(e as Map<String, dynamic>)).toList(), 
      pagination: Pagination.fromJson(json['pagination'])
    );
  }
}

class Pagination {
  late int pages;
  late int currentPage;
  late int itemsPerPage;
  late int totalItems;

  Pagination({required this.pages, required this.currentPage, required this.itemsPerPage, required this.totalItems});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      pages: json['pages'],
      currentPage: json['current_page'],
      itemsPerPage: json['items_per_page'],
      totalItems: json['total_items']
    );
  }
}