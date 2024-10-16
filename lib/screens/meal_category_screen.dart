import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/api_services.dart';
import '../widgets/recipe_card.dart';

class MealCategoryScreen extends StatefulWidget {
  final String category;

  MealCategoryScreen({required this.category});

  @override
  _MealCategoryScreenState createState() => _MealCategoryScreenState();
}

class _MealCategoryScreenState extends State<MealCategoryScreen> {
  List<Meal> meals = [];

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    final loadedMeals = await ApiService.getMealsByCategory(widget.category);
    setState(() {
      meals = loadedMeals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: meals.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: meals.length,
        itemBuilder: (context, index) => RecipeCard(meal: meals[index]),
      ),
    );
  }
}