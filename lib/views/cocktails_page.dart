import 'package:flutter/material.dart';
import '../data/сocktails.dart';
import '../widgets/cocktail_card.dart';
import 'cocktail_full_card.dart';

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
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
                labelText: 'Поиск...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)))),
            onChanged: searchCocktails,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredCocktails.length,
            itemBuilder: (context, index) {
              String cocktailName = filteredCocktails[index].key;
              String recipe = filteredCocktails[index].value['Recipe'] ??
                  'Рецепт не найден';
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
                child:
                    CocktailCard(assetName: cocktailName, title: cocktailName),
              );
            },
          ),
        ),
      ],
    ));
  }
}
/*
class CocktailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, Map<String, dynamic>>> CocktailsPage =
        cocktails.entries.toList();

    List<Widget> cardWidgets = CocktailsPage.map((entry) {
      String cocktailName = entry.key;
      // String recipe = entry.value['Recipe'] ?? 'Рецепт не найден';
      // var tempArr = entry.value.entries.map((entry) {return entry.key;}).toList();
      return CocktailCard(assetName: 'vodka.webp', title: cocktailName);
    }).toList();

    return ListView(
      children: cardWidgets,
    );
  }
} 
 */