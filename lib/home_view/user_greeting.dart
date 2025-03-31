import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kwik_kenya/services/sign_up_services.dart';
import 'package:kwik_kenya/styles/app_theme.dart';

class UserGreeting extends StatelessWidget {
  const UserGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
      future: SharedPrefsService.getUserProfile(),
      builder: (context, snapshot) {
        final firstName = snapshot.data?['firstName'] ?? 'User';

        return SizedBox(
          width: 180,
          height: 40,
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  snapshot.data?['avatarPath'] ?? 'assets/images/avatar(9).png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      size: 24,
                      color: AppTheme.electricBlue,
                    );
                  },
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    'Good morning!\n$firstName',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 192, 192, 192),
                      fontSize: 17,
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
