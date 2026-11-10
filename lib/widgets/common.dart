import 'package:flutter/material.dart';

import '../theme.dart';

/// Coral gradient button with soft shadow (Get Started / Login / ADD TO CART).
class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double radius;
  final double height;
  final double? width;

  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.radius = 8,
    this.height = 48,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: AppColors.gradient,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.35),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onPressed,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Image loaded from assets, with a visible fallback if the file is missing.
class AssetOrPlaceholder extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final IconData fallbackIcon;

  const AssetOrPlaceholder(
      this.path, {
        super.key,
        this.width,
        this.height,
        this.fit = BoxFit.cover,
        this.fallbackIcon = Icons.local_pizza,
      });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: AppColors.primary.withOpacity(0.12),
        child: Icon(fallbackIcon, color: AppColors.primary, size: 40),
      ),
    );
  }
}

/// Big "Quick Delivery at your Doorstep" title with coral highlight.
class DoorstepTitle extends StatelessWidget {
  final double fontSize;
  const DoorstepTitle({super.key, this.fontSize = 22});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.dark,
          height: 1.15,
        ),
        children: const [
          TextSpan(text: 'Quick Delivery at\nyour '),
          TextSpan(text: 'Doorstep', style: TextStyle(color: AppColors.primary)),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Bottom button used on Login / Home / Item so it sits in the exact same
/// place (same width, height and distance from the bottom) on every screen.
/// Use it as `Scaffold(bottomNavigationBar: BottomActionButton(...))`.
class BottomActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BottomActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 8, 40, 40),
        child: GradientButton(
          label: label,
          height: 40,
          radius: 6,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class Price extends StatelessWidget {
  final double value;
  final double size;
  const Price(this.value, {super.key, this.size = 14});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '\$',
            style: TextStyle(color: AppColors.primary, fontSize: size * 0.6),
          ),
          TextSpan(
            text: value.toStringAsFixed(2),
            style: TextStyle(
              color: AppColors.dark,
              fontSize: size,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}