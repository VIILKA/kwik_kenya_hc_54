import 'package:flutter/material.dart';
import 'package:kwik_kenya/services/sign_up_services.dart'; // SharedPrefsService
import 'package:kwik_kenya/styles/app_theme.dart';

class EditProfilePage extends StatefulWidget {
  final String initialName; // firstName
  final String initialSurname; // lastName
  final String initialAge;
  final String initialAvatarPath;
  final String initialEmail;

  const EditProfilePage({
    super.key,
    required this.initialName,
    required this.initialSurname,
    required this.initialAge,
    required this.initialAvatarPath,
    required this.initialEmail,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late String _avatarPath;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.initialName);
    _lastNameController = TextEditingController(text: widget.initialSurname);
    _ageController = TextEditingController(text: widget.initialAge);
    _emailController = TextEditingController(text: widget.initialEmail);
    _avatarPath = widget.initialAvatarPath;
  }

  Future<void> _saveProfile() async {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final age = _ageController.text.trim();
    final email = _emailController.text.trim();

    await SharedPrefsService.updateUserProfile(
      firstName: firstName.isEmpty ? 'User' : firstName,
      lastName: lastName.isEmpty ? 'Surname' : lastName,
      age: age.isEmpty ? '0' : age,
      avatarPath: _avatarPath,
      email: email.isEmpty ? 'user@example.com' : email,
    );

    Navigator.pop(context, true);
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Container(
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
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: AppTheme.brutalWhite,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          labelText: label.toUpperCase(),
          labelStyle: TextStyle(
            color: AppTheme.electricBlue,
            fontSize: 14,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.brutalBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EDIT PROFILE',
                    style: TextStyle(
                      color: AppTheme.electricBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: AppTheme.neonPink,
                      child: Icon(
                        Icons.close,
                        color: AppTheme.brutalWhite,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
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
                child: ClipOval(
                  child: Image.asset(
                    _avatarPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.person,
                        size: 40,
                        color: AppTheme.brutalWhite,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildTextField(
                label: "First Name",
                controller: _firstNameController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: "Last Name",
                controller: _lastNameController,
              ),
              const SizedBox(height: 16),
              _buildTextField(label: "Age", controller: _ageController),
              const SizedBox(height: 16),
              _buildTextField(label: "Email", controller: _emailController),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.neonPink,
                  border: Border.all(color: AppTheme.brutalWhite, width: 2),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _saveProfile,
                    child: Center(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
