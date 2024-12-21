import 'package:flutter/material.dart';
import '../data/сocktails.dart';
import '../widgets/cocktail_card.dart';
import 'cocktail_full_card.dart';
import '../widgets/custom_text_field.dart';

class CocktailsPage extends StatefulWidget {
  const CocktailsPage({super.key});

  @override
  CocktailsPageState createState() => CocktailsPageState();
}

class CocktailsPageState extends State<CocktailsPage> {
  final TextEditingController _controller = TextEditingController();
  List<MapEntry<String, Map<String, dynamic>>> filteredCocktails = [];

  @override
  void initState() {
    super.initState();
    filteredCocktails = cocktails.entries.toList();
  }

  void searchCocktails(String query) {
    setState(() {
      filteredCocktails = cocktails.entries.where((entry) {
        return entry.key.toLowerCase().startsWith(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: customTextField(searchCocktails, _controller)),
        Expanded(
            child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.45),
          itemCount: filteredCocktails.length,
          itemBuilder: (context, index) {
            String cocktailName = filteredCocktails[index].key;
            String recipe =
                filteredCocktails[index].value['Recipe'] ?? 'Рецепт не найден';
            List<String> neededIngredients =
                filteredCocktails[index].value['Ingredients'];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CocktailFullCard(
                            assetName: cocktailName,
                            title: cocktailName,
                            recipe: recipe)));
              },
              child: CocktailCard(
                assetName: cocktailName,
                title: cocktailName,
                neededIngredients: neededIngredients,
              ),
            );
          },
        )),
      ],
    ));
  }
}
