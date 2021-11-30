import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_quiz_app/model/quiz_model.dart';

class APIManager {
  final String baseUrl = 'https://beta-trivia.bongo.best';
  final String searchCategory = '/?category=';
  final String requiredAttributes = '&type=multiple&difficulty=medium&limit=10';

   Future<List<QuizModel>> getHistoryQuestions() async {
    final response = await http.get(
        Uri.parse(baseUrl + searchCategory + 'history' + requiredAttributes));
    return checkResponse(response);
  }

  Future<List<QuizModel>> getEntertainmentQuestions() async {
    final response = await http.get(Uri.parse(
        baseUrl + searchCategory + 'entertainment' + requiredAttributes));
    return checkResponse(response);
  }

  Future<List<QuizModel>> getMythologyQuestions() async {
    final response = await http.get(
        Uri.parse(baseUrl + searchCategory + 'mythology' + requiredAttributes));
    return checkResponse(response);
  }
}

List<QuizModel> checkResponse(http.Response response) {
  if (response.statusCode == 200) {
    final List<dynamic> responseJson = json.decode(response.body);
    return responseJson.map((quiz) => QuizModel.fromMap(quiz)).toList();
  } else if (response.statusCode == 404) {
    throw Exception('Failed to load Quiz. Page was not found 404');
  } else if (response.statusCode == 500) {
    throw Exception('Failed to load Quiz. Something unexpected went wrong 500');
  } else {
    throw Exception('Failed to load Quiz. ${response.statusCode}');
  }
}
