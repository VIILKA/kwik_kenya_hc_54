import 'package:flutter/material.dart';
import '../styles/app_theme.dart';

class TamplateDownBar extends StatelessWidget {
  const TamplateDownBar({
    super.key,
    this.index = 0,
    required this.itemBuilder,
    required this.tamplatePages,
    this.onPageChanged,
  });

  final int index;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final List<PageModel> tamplatePages;
  final void Function(int index)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: AppTheme.brutalBlack,
        border: Border.all(color: AppTheme.electricBlue, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppTheme.electricBlue,
            offset: const Offset(4, 4),
            blurRadius: 0,
          ),
          BoxShadow(
            color: AppTheme.electricBlue,
            offset: const Offset(-4, -4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(tamplatePages.length, (i) {
            final isSelected = (i == index);

            return GestureDetector(
              onTap: () => onPageChanged?.call(i),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppTheme.electricBlue : Colors.transparent,
                  border: Border.all(
                    color:
                        isSelected ? AppTheme.neonPink : AppTheme.electricBlue,
                    width: 2,
                  ),
                  boxShadow:
                      isSelected
                          ? [
                            BoxShadow(
                              color: AppTheme.neonPink,
                              offset: const Offset(2, 2),
                              blurRadius: 0,
                            ),
                            BoxShadow(
                              color: AppTheme.neonPink,
                              offset: const Offset(-2, -2),
                              blurRadius: 0,
                            ),
                          ]
                          : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      tamplatePages[i].iconPath ?? '',
                      color:
                          isSelected
                              ? AppTheme.brutalBlack
                              : AppTheme.electricBlue,
                      width: 28,
                      height: 28,
                    ),
                    if (tamplatePages[i].title != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        tamplatePages[i].title!,
                        style: TextStyle(
                          color:
                              isSelected
                                  ? AppTheme.brutalBlack
                                  : AppTheme.electricBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class PageModel {
  final String? iconPath;
  final String? title;
  final Widget page;

  PageModel({this.iconPath, this.title, required this.page});
}
