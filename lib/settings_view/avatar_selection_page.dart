import 'package:flutter/material.dart';
import 'package:kwik_kenya/services/sign_up_services.dart';
import 'package:kwik_kenya/styles/app_theme.dart';

class AvatarSelectionPage extends StatelessWidget {
  const AvatarSelectionPage({super.key});

  final List<String> avatars = const [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
    'assets/images/avatar7.png',
    'assets/images/avatar8.png',
    'assets/images/avatar9.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.brutalBlack,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 85,
              color: AppTheme.electricBlue,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: AppTheme.neonPink,
                            child: Icon(
                              Icons.arrow_back,
                              color: AppTheme.brutalWhite,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'SELECT AVATAR',
                          style: TextStyle(
                            color: AppTheme.brutalBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      final currentProfile =
                          await SharedPrefsService.getUserProfile();
                      await SharedPrefsService.updateUserProfile(
                        firstName: currentProfile['firstName'],
                        lastName: currentProfile['lastName'],
                        age: currentProfile['age'],
                        weight: currentProfile['weight'],
                        avatarPath: avatars[index],
                      );
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.brutalBlack,
                        border: Border.all(
                          color: AppTheme.electricBlue,
                          width: 3,
                        ),
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
                      child: ClipOval(
                        child: Image.asset(avatars[index], fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
