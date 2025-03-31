import 'package:kwik_kenya/athlets_view/athlets_page.dart';
import 'package:kwik_kenya/core/btm.dart';
import 'package:kwik_kenya/core/onb/onb_pages/onb_page_widget.dart';
import 'package:kwik_kenya/home_view/home_page.dart';
import 'package:kwik_kenya/settings_view/settings_page.dart';
import 'package:kwik_kenya/training_view/training_page.dart';

final List<TamplateOnbPageWidget> tamplateOnbList = [
  const TamplateOnbPageWidget(
    image: 'assets/images/onb1.png',
    title:
        'Your personal health companion for tracking wellness and staying active',
    description:
        'Monitor your wellbeing and keep an active lifestyle with our application',
  ),
  const TamplateOnbPageWidget(
    image: 'assets/images/onb2.png',
    title:
        'Schedule your fitness activities, contests and team sessions in your Fitzy planner',
    description: 'Keep all your fitness activities organized in a single place',
  ),
  const TamplateOnbPageWidget(
    image: 'assets/images/onb3.png',
    title: 'Take on Challenges and become part of our fitness community!',
    description: 'Engage in challenges and build connections with fellow users',
  ),
];

final List<PageModel> tamplatePages = [
  PageModel(
    page: HomePage(),
    iconPath: 'assets/images/house.png',
    title: 'Home',
  ),
  PageModel(
    page: TrainingPage(),
    iconPath: 'assets/images/message-text.png',
    title: 'Trainings',
  ),
  PageModel(
    page: const AthletsPage(),
    iconPath: 'assets/images/music.png',
    title: 'Athlets',
  ),
  PageModel(
    page: const SettingsPage(),
    iconPath: 'assets/images/chart.png',
    title: 'Settings',
  ),
];
