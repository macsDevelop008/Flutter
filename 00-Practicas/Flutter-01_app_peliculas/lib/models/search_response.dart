// To parse this JSON data, do
//
//     final seachResponse = seachResponseFromMap(jsonString);

import 'package:flutter_application_1/models/models.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class SeachResponse {
  SeachResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory SeachResponse.fromJson(String str) =>
      SeachResponse.fromMap(json.decode(str));

  factory SeachResponse.fromMap(Map<String, dynamic> json) => SeachResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
