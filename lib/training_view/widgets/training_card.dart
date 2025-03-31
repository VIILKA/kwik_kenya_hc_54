import 'package:flutter/material.dart';
import 'package:kwik_kenya/styles/app_theme.dart';

class TrainingCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;
  final bool isLocked;

  const TrainingCard({
    required this.title,
    required this.imageUrl,
    required this.onTap,
    this.isLocked = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 143,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.brutalBlack,
          border: Border.all(
            color: isLocked ? AppTheme.neonPink : AppTheme.electricBlue,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: isLocked ? AppTheme.neonPink : AppTheme.electricBlue,
              offset: const Offset(4, 4),
              blurRadius: 0,
            ),
            BoxShadow(
              color: isLocked ? AppTheme.neonPink : AppTheme.electricBlue,
              offset: const Offset(-4, -4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  if (isLocked)
                    Container(color: AppTheme.neonPink.withOpacity(0.5)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: isLocked ? AppTheme.neonPink : AppTheme.brutalYellow,
              child: Row(
                children: [
                  if (isLocked)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppTheme.brutalBlack,
                        border: Border.all(
                          color: AppTheme.brutalWhite,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.lock,
                        color: AppTheme.brutalWhite,
                        size: 14,
                      ),
                    ),
                  if (isLocked) const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color:
                            isLocked
                                ? AppTheme.brutalWhite
                                : AppTheme.brutalBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
