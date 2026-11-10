import 'package:flutter/material.dart';

import '../models/food.dart';
import '../theme.dart';
import '../widgets/common.dart';
import 'item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomActionButton(
        label: 'ADD TO CART',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to cart')),
          );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App bar row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, color: AppColors.dark),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.search, color: Colors.white, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text('Hi Alex',
                  style: TextStyle(color: AppColors.primary, fontSize: 13)),
              const SizedBox(height: 2),
              const Text(
                'Find your Delicious Food',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
              const SizedBox(height: 16),
              // Categories
              Row(
                children: const [
                  _CategoryChip(label: 'Italian', asset: 'assets/images/italian.png'),
                  SizedBox(width: 16),
                  _CategoryChip(label: 'Japanese', asset: 'assets/images/sushi.png'),
                ],
              ),
              const SizedBox(height: 48),
              const Text(
                'Popular',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final item in popularFoods) ...[
                    Expanded(child: _FoodCard(item: item)),
                    if (item != popularFoods.last) const SizedBox(width: 16),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final String asset;
  const _CategoryChip({required this.label, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AssetOrPlaceholder(asset, fallbackIcon: Icons.restaurant),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 7)),
      ],
    );
  }
}

class _FoodCard extends StatelessWidget {
  final Food item;
  const _FoodCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ItemPage(food: item)),
      ),
      // The image already contains the whole card (name, calories, price,
      // border), so we only display it as-is.
      child: Image.asset(
        item.image,
        width: double.infinity,
        fit: BoxFit.fitWidth,
        errorBuilder: (_, __, ___) => Container(
          height: 200,
          color: AppColors.primary.withOpacity(0.12),
          child: const Icon(Icons.local_pizza, color: AppColors.primary, size: 40),
        ),
      ),
    );
  }
}