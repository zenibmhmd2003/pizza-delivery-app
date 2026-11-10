import 'package:flutter/material.dart';

import '../models/food.dart';
import '../theme.dart';
import '../widgets/common.dart';

class ItemPage extends StatefulWidget {
  final Food food;
  const ItemPage({super.key, required this.food});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    return Scaffold(
      bottomNavigationBar: BottomActionButton(
        label: 'ADD TO CART',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Added $_qty × ${food.name}')),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                food.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
              const SizedBox(height: 4),
              Price(food.price, size: 16),
              const SizedBox(height: 24),
              Hero(
                tag: food.name,
                child: AssetOrPlaceholder(
                  food.detailImage ?? food.image,
                  width: food.detailSize,
                  height: food.detailSize,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),
              // Quantity selector
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _QtyButton(
                    icon: Icons.remove,
                    onTap: () => setState(() {
                      if (_qty > 1) _qty--;
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text('$_qty', style: const TextStyle(fontSize: 12)),
                  ),
                  _QtyButton(icon: Icons.add, onTap: () => setState(() => _qty++)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '\$${(food.price * _qty).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 10, color: AppColors.grey),
              ),
              const Spacer(),
              // Info row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Info(
                    icon: const Icon(Icons.star_rounded,
                        color: Color(0xFFFFC107), size: 18),
                    text: '${food.rating}',
                  ),
                  _Info(
                    icon: const Icon(Icons.local_fire_department,
                        color: Color(0xFFFF7A00), size: 18),
                    text: '${food.calories} Calories',
                  ),
                  _Info(
                    icon: const Icon(Icons.timer_outlined,
                        color: Color(0xFF3F7FD9), size: 18),
                    text: food.time,
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Icon(icon, color: Colors.white, size: 14),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final Widget icon;
  final String text;
  const _Info({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}