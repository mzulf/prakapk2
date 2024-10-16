import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/article.dart';
import '../models/meal.dart';

class ApiService {
  static const String mealBaseUrl = 'https://www.themealdb.com/api/json/v1/1';
  static const String articleBaseUrl = 'https://www.masakapahariini.com/resep/';

  // Article-related methods
  static Future<List<String>> getArticleCategories() async {
    final response = await http.get(Uri.parse('$articleBaseUrl/categories'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((category) => category.toString()).toList();
    } else {
      throw Exception('Failed to load article categories');
    }
  }

  static Future<List<Article>> getArticles() async {
    final response = await http.get(Uri.parse('$articleBaseUrl/articles'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Article(
        id: json['id'],
        title: json['title'],
        summary: json['summary'],
        imageUrl: json['image_url'],
        url: json['url'],
      )).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  // Meal-related methods
  static Future<List<Meal>> getRandomMeals(int count) async {
    List<Meal> meals = [];
    for (int i = 0; i < count; i++) {
      final response = await http.get(Uri.parse('$mealBaseUrl/random.php'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        meals.add(Meal.fromJson(data['meals'][0]));
      }
    }
    return meals;
  }

  static Future<List<Meal>> searchMeals(String query) async {
    final response = await http.get(Uri.parse('$mealBaseUrl/search.php?s=$query'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['meals'] as List?)?.map((meal) => Meal.fromJson(meal)).toList() ?? [];
    }
    return [];
  }

  static Future<List<String>> getMealCategories() async {
    final response = await http.get(Uri.parse('$mealBaseUrl/list.php?c=list'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['meals'] as List?)?.map((category) => category['strCategory'] as String).toList() ?? [];
    }
    return [];
  }

  static Future<List<Meal>> getMealsByCategory(String category) async {
    final response = await http.get(Uri.parse('$mealBaseUrl/filter.php?c=$category'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['meals'] as List?)?.map((meal) => Meal.fromJson(meal)).toList() ?? [];
    }
    return [];
  }
}