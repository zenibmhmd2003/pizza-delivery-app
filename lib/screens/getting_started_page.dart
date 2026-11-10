import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/common.dart';
import 'login_page.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.gradient),
        child: SafeArea(
          child: Stack(
            children: [
              // Delivery man photo
              Positioned.fill(
                bottom: 120,
                child: const AssetOrPlaceholder(
                  'assets/images/delivery_man.png',
                  fit: BoxFit.contain,
                  fallbackIcon: Icons.delivery_dining,
                ),
              ),
              // White card at the bottom
              Positioned(
                left: 24,
                right: 24,
                bottom: 24,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DoorstepTitle(fontSize: 22),
                      const SizedBox(height: 10),
                      const Text(
                        'Home delivery and online reservation\nsystem for restaurants and cafe',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 9, color: AppColors.grey),
                      ),
                      const SizedBox(height: 20),
                      GradientButton(
                        label: 'Get Started',
                        width: 140,
                        height: 46,
                        radius: 30,
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        ),
                      ),
                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}