import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';

class TrainingFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isDisabled;
  final String? requirements;
  final VoidCallback onTap;

  const TrainingFilterChip({
    required this.label,
    required this.isSelected,
    this.isDisabled = false,
    this.requirements,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isDisabled && requirements != null ? requirements! : '',
      child: GestureDetector(
        onTap: isDisabled ? null : onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.neonPink : AppTheme.brutalBlack,
            border: Border.all(
              color: isSelected ? AppTheme.brutalBlack : AppTheme.electricBlue,
              width: 3,
            ),
          ),
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              color: isSelected ? AppTheme.brutalWhite : AppTheme.electricBlue,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
