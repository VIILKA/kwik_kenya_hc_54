import 'package:flutter/material.dart';
import 'package:kwik_kenya/services/sign_up_services.dart';
import 'package:kwik_kenya/settings_view/edit_profile_page.dart';
import 'package:kwik_kenya/settings_view/privacy_policy_page.dart';
import 'package:kwik_kenya/styles/app_theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:kwik_kenya/settings_view/avatar_selection_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kwik_kenya/services/training_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isLoading = true;
  Map<String, dynamic> _userProfile = {};
  Map<String, double> _trainingProgress = {};

  @override
  void initState() {
    super.initState();
    _loadProfile();
    _loadTrainingProgress();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadTrainingProgress();
  }

  Future<void> _loadTrainingProgress() async {
    Map<String, double> progress = {};
    final categories = [
      'Diagonal',
      'Binder',
      'Libero',
      'Center Blocker',
      'Doping Player',
    ];

    for (var category in categories) {
      final percentage = await TrainingService.getCategoryProgress(category);
      progress[category] = percentage;
    }

    if (mounted) {
      setState(() {
        _trainingProgress = progress;
      });
    }
  }

  Future<void> _loadProfile() async {
    final data = await SharedPrefsService.getUserProfile();
    setState(() {
      _userProfile = data;
      _isLoading = false;
    });
  }

  Future<void> _openEditProfile() async {
    final updated = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => EditProfilePage(
              initialName: _userProfile['firstName'] ?? 'User',
              initialSurname: _userProfile['lastName'] ?? 'Surname',
              initialAge: _userProfile['age'] ?? '0',
              initialAvatarPath:
                  _userProfile['avatarPath'] ?? 'assets/images/avatar1.png',
              initialEmail: _userProfile['email'] ?? 'user@example.com',
            ),
      ),
    );
    if (updated == true) {
      _loadProfile();
    }
  }

  void _openPrivacyPolicy(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PrivacyPolicyPage()),
    );
  }

  void _handleShare() {
    Share.share('Join KWIK KENYA - Your Volleyball Training Companion!');
  }

  Future<void> _handleAvatarTap() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AvatarSelectionPage()),
    );
    if (result == true) {
      _loadProfile();
    }
  }

  Widget _buildProgressBar(String title, double progress) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppTheme.electricBlue,
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: TextStyle(
                color: AppTheme.neonPink,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppTheme.brutalBlack,
            border: Border.all(color: AppTheme.electricBlue, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppTheme.electricBlue,
                offset: const Offset(2, 2),
                blurRadius: 0,
              ),
              BoxShadow(
                color: AppTheme.electricBlue,
                offset: const Offset(-2, -2),
                blurRadius: 0,
              ),
            ],
          ),
          child: FractionallySizedBox(
            widthFactor: progress,
            child: Container(color: AppTheme.neonPink),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: AppTheme.brutalBlack,
        body: Center(
          child: CircularProgressIndicator(color: AppTheme.electricBlue),
        ),
      );
    }

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
                        Text(
                          'PROFILE',
                          style: TextStyle(
                            color: AppTheme.brutalBlack,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: _handleAvatarTap,
                      child: Stack(
                        children: [
                          Container(
                            width: 138,
                            height: 138,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
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
                              child: Image.asset(
                                _userProfile['avatarPath'] ??
                                    'assets/images/avatar(9).png',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.person,
                                    size: 80,
                                    color: AppTheme.electricBlue,
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppTheme.neonPink,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppTheme.electricBlue,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: AppTheme.brutalBlack,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _userProfile['firstName'] ?? 'User',
                      style: TextStyle(
                        color: AppTheme.electricBlue,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${_userProfile['firstName']} ${_userProfile['lastName']}',
                                      style: TextStyle(
                                        color: AppTheme.electricBlue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: _openEditProfile,
                                      child: Icon(
                                        Icons.edit,
                                        color: AppTheme.neonPink,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${_userProfile['age'] == '0' ? 'N/A' : _userProfile['age']} YEARS OLD',
                                  style: TextStyle(
                                    color: AppTheme.electricBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: AppTheme.neonPink,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      _userProfile['email'] ?? 'No email',
                                      style: TextStyle(
                                        color: AppTheme.electricBlue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(16),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TRAINING PROGRESS',
                                  style: TextStyle(
                                    color: AppTheme.neonPink,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ..._trainingProgress.entries.map((entry) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: _buildProgressBar(
                                      entry.key,
                                      entry.value,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
