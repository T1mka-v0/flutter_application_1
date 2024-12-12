import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CocktailCard extends StatelessWidget {
  final String assetName;
  final String title;

  const CocktailCard({required this.assetName, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // Радиус скругления
                child: Image.asset(
                  'assets/$assetName',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover, // Настройка отображения изображения
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(title),
              ),
            ],
          ),
        ));
  }
}

/* ,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,*/
