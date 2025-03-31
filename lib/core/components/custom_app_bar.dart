import 'package:flutter/material.dart';
import 'package:kwik_kenya/core/app_fonts.dart';
import 'package:kwik_kenya/core/colors.dart';

class TamplateCustomAppBar extends StatefulWidget {
  final String title;
  final Widget? rightWidget;
  const TamplateCustomAppBar({
    super.key,
    required this.title,
    this.rightWidget,
  });

  @override
  State<TamplateCustomAppBar> createState() => _TamplateCustomAppBarState();
}

class _TamplateCustomAppBarState extends State<TamplateCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: AppColors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 24,
              width: 24,
              color: Colors.transparent,
              child: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        Text(
          widget.title,
          style: AppFonts.displayMedium.copyWith(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        widget.rightWidget != null
            ? SizedBox(width: 24, child: widget.rightWidget!)
            : const SizedBox(width: 24),
      ],
    );
  }
}
