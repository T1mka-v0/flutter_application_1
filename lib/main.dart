import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/ingredients_page.dart';
import 'package:flutter_application_1/views/my_ingredients_page.dart';
import 'app/my_ingredients_provider.dart';
import 'package:provider/provider.dart';
import 'views/cocktails_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Flutter code sample for [NavigationBar].

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MyIngredientsAdapter());

  final box = await Hive.openBox<MyIngredients>('myIngredientsBox');
  final myIngredients = box.get('ingredients') ?? MyIngredients();

  runApp(
    ChangeNotifierProvider(
      create: (context) => myIngredients,
      child: const NavigationBarApp(),
    ),
  );
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.light()),
      home: const NavigationExample(),
      darkTheme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.dark()),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  void dispose() async {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.local_bar_rounded),
              label: 'Коктейли',
            ),
            NavigationDestination(
              icon: Icon(Icons.liquor_rounded),
              label: 'Ингредиенты',
            ),
          ],
        ),
        body: [
          Scaffold(
            appBar: AppBar(title: const Text('Коктейли')),
            body: const CocktailsPage(),
          ),
          DefaultTabController(
              length: 2,
              animationDuration: const Duration(milliseconds: 800),
              child: Scaffold(
                appBar: AppBar(
                  bottom: const TabBar(tabs: [
                    Tab(
                      text: 'Новые',
                    ),
                    Tab(
                      text: 'Мои',
                    )
                  ]),
                  title: const Text('Ингридиенты'),
                ),
                body: const TabBarView(
                    children: [IngredientsPage(), MyIngredientsPage()]),
              ))
        ][currentPageIndex]);
  }
}
