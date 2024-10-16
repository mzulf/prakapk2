import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/recipe_card.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteRecipesScreen({required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resep Favorit'),
      ),
      body: favoriteMeals.isEmpty
          ? Center(child: Text('Tidak ada resep favorit.'))
          : ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return RecipeCard(meal: favoriteMeals[index]);
        },
      ),
    );
  }
}
