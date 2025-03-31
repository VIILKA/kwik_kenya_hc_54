import 'package:flutter/material.dart';
import 'package:kwik_kenya/core/btm.dart';
import 'package:kwik_kenya/core/config/config.dart';
import 'package:kwik_kenya/styles/app_theme.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tamplatePages[_currentIndex].page,
      bottomNavigationBar: TamplateDownBar(
        index: _currentIndex,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        tamplatePages: tamplatePages,
        itemBuilder: (BuildContext context, int index) {
          final isSelected = index == _currentIndex;

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tamplatePages[index].iconPath != null)
                Image.asset(
                  tamplatePages[index].iconPath!,
                  color: isSelected ? AppTheme.orange : Colors.grey,
                  width: 24,
                  height: 24,
                ),
              if (tamplatePages[index].title != null) ...[
                const SizedBox(height: 4),
                Text(
                  tamplatePages[index].title!,
                  style: TextStyle(
                    color: isSelected ? AppTheme.orange : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
