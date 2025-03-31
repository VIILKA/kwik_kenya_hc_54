import 'package:flutter/material.dart';
import 'package:kwik_kenya/styles/app_theme.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
                          'PRIVACY POLICY',
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
              child: Container(
                width: double.infinity,
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
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KWIK KENYA PRIVACY POLICY',
                        style: TextStyle(
                          color: AppTheme.electricBlue,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Last updated: ${DateTime.now().toString().split(' ')[0]}',
                        style: TextStyle(
                          color: AppTheme.neonPink,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '1. INTRODUCTION',
                        style: TextStyle(
                          color: AppTheme.electricBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'KWIK KENYA is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and safeguard your information when you use our volleyball training application.',
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '2. INFORMATION WE COLLECT',
                        style: TextStyle(
                          color: AppTheme.electricBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '• Personal Information: Name, age, email address\n• Training Progress: Your volleyball training statistics and achievements\n• Device Information: Device type, operating system\n• Usage Data: How you interact with the app',
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '3. HOW WE USE YOUR INFORMATION',
                        style: TextStyle(
                          color: AppTheme.electricBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '• To provide and improve our volleyball training services\n• To track your training progress and achievements\n• To communicate with you about updates and new features\n• To personalize your training experience',
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '4. DATA SECURITY',
                        style: TextStyle(
                          color: AppTheme.electricBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'We implement appropriate security measures to protect your personal information. However, no method of transmission over the internet is 100% secure.',
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '5. CONTACT US',
                        style: TextStyle(
                          color: AppTheme.electricBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'If you have any questions about this Privacy Policy, please contact us at privacy@kwikkenya.com',
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

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
                          'CONTACT US',
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
              child: Container(
                width: double.infinity,
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
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GET IN TOUCH',
                        style: TextStyle(
                          color: AppTheme.electricBlue,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Have questions or suggestions about KWIK KENYA? We\'d love to hear from you!',
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'CONTACT INFORMATION',
                        style: TextStyle(
                          color: AppTheme.electricBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Email: support@kwikkenya.com\nWebsite: www.kwikkenya.com\nPhone: +254 123 456 789',
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'SOCIAL MEDIA',
                        style: TextStyle(
                          color: AppTheme.electricBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Follow us on social media for the latest updates and volleyball training tips:\n\nInstagram: @kwikkenya\nTwitter: @kwikkenya\nFacebook: /kwikkenya',
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
