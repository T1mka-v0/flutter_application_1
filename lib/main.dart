import 'package:flutter/material.dart';
import 'card.dart';
import 'data/my_ingredients.dart';
import 'data/ingredients.dart';
import 'package:provider/provider.dart';
import 'my_ingredients_page.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => MyIngredients(),
        child: const NavigationBarApp(),
      ),
    );

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true), home: const NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  @override
  Widget build(BuildContext context) {
    final myIngredients = Provider.of<MyIngredients>(context);
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        children: [
          ...ingredients.map((ingredient) {
            return MyCard(
              title: ingredient['title'],
              onPress: () => {myIngredients.addIngredient(ingredient['title'])},
            );
          }),
        ],
      ),
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyIngredientsPage()));
                // print();
              },
              child: const Text('Second page'))
        ],
      ),
    );
  }
}



/* Иконки */
/*
flatware_outlined 

ChangeNotifierProvider(
        create: (context) => MyIngredients(),
        child: const ,
      ),
*/

/* DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Мой бар'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Мои'),
                  Tab(
                    text: 'Добавить',
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Card(
                    shadowColor: Colors.transparent,
                    margin: EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: ingredients.entries.map((item) {
                        return MyCard(
                          title: item.value,
                        );
                      }).toList(),
                    )
                    // child: SizedBox.expand(
                    //   child: Center(
                    //     child: Text(
                    //       'Home page',
                    //       style: theme.textTheme.titleLarge,
                    //     ),
                    //   ),
                    // ),
                    ),
                Card(
                  shadowColor: Colors.transparent,
                  margin: const EdgeInsets.all(8.0),
                  child: SizedBox.expand(
                    child: Center(
                      child: Text(
                        'Home page',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ), 
        
        
        bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            print("Current Page Index: $currentPageIndex");
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            // selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.local_bar_rounded),
            label: 'Коктейли',
          ),
          NavigationDestination(
            icon: Icon(Icons.liquor_rounded),
            label: 'Ингредиенты',
          ),
        ],
      ),*/