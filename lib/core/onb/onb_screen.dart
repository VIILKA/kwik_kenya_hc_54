import 'package:flutter/material.dart';

import 'package:kwik_kenya/core/config/config.dart';
import 'package:kwik_kenya/core/parent_screen/parent_screen.dart';
import 'package:kwik_kenya/styles/app_theme.dart';

class TamplateOnb extends StatefulWidget {
  const TamplateOnb({super.key});

  @override
  State<TamplateOnb> createState() => _OnbState();
}

class _OnbState extends State<TamplateOnb> {
  late PageController _tamplateOnbPageController;
  bool tamplateIsLastPage = false;
  int currentPage = 0;

  @override
  void initState() {
    _tamplateOnbPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tamplateOnbPageController.dispose();
    super.dispose();
  }

  void _navigateToMainScreen() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const ParentScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.brutalBlack,
      body: Stack(
        children: [
          PageView.builder(
            controller: _tamplateOnbPageController,
            onPageChanged: (index) {
              setState(() {
                tamplateIsLastPage = index == 2;
                currentPage = index;
              });
            },
            itemCount: tamplateOnbList.length,
            itemBuilder: (context, index) {
              final page = tamplateOnbList[index];
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(page.image, fit: BoxFit.cover),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppTheme.brutalBlack.withOpacity(0),
                          AppTheme.brutalBlack,
                        ],
                        stops: const [0.045, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          page.title,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: AppTheme.electricBlue,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          page.description,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppTheme.brutalWhite,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: currentPage == index ? 24 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color:
                            currentPage == index
                                ? AppTheme.neonPink
                                : AppTheme.electricBlue.withOpacity(0.3),
                        border: Border.all(
                          color: AppTheme.electricBlue,
                          width: 2,
                        ),
                        boxShadow:
                            currentPage == index
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
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 56,
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
                          child: TextButton(
                            onPressed: _navigateToMainScreen,
                            child: Text(
                              'SKIP',
                              style: TextStyle(
                                color: AppTheme.electricBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppTheme.neonPink,
                            border: Border.all(
                              color: AppTheme.electricBlue,
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.neonPink,
                                offset: const Offset(4, 4),
                                blurRadius: 0,
                              ),
                              BoxShadow(
                                color: AppTheme.neonPink,
                                offset: const Offset(-4, -4),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (tamplateIsLastPage) {
                                _navigateToMainScreen();
                              } else {
                                _tamplateOnbPageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Text(
                              tamplateIsLastPage ? 'CONTINUE' : 'NEXT',
                              style: TextStyle(
                                color: AppTheme.brutalBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
