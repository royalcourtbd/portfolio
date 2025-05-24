import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/external_libs/presentable_widget_builder.dart';
import 'package:portfolio/presentation/home/presenter/home_presenter.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomePresenter _homePresenter = locate<HomePresenter>();

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder(
      presenter: _homePresenter,
      builder: () {
        return SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3',
                    ), // Replace with your image
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'MD ABU SAYED',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Flutter Developer | Firebase | UI Specialist',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'About Me',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'I am a Flutter developer with over 2 years of experience. '
                    'Specialized in converting Figma to Flutter, building scalable apps using Firebase, '
                    'and implementing GetX for state management.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Skills',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 10,
                    children: const [
                      Chip(label: Text('Flutter')),
                      Chip(label: Text('Firebase')),
                      Chip(label: Text('GetX')),
                      Chip(label: Text('Figma to Flutter')),
                      Chip(label: Text('Clean Architecture')),
                      Chip(label: Text('REST API')),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Projects',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const ListTile(
                    title: Text('Job Notification App'),
                    subtitle: Text(
                      'A Flutter app that sends push notifications when new jobs are posted. Integrated with Firebase Cloud Functions.',
                    ),
                  ),
                  const ListTile(
                    title: Text('NFC Balance Checker'),
                    subtitle: Text(
                      'Reads NFC cards to display balance and transaction history.',
                    ),
                  ),
                  const ListTile(
                    title: Text('SMS Alarm App'),
                    subtitle: Text(
                      'A clean architecture Flutter app that reads and alerts on specific SMS.',
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Contact',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text('📞 01749247855'),
                  const Text('📧 roya.court.bd@gmail.com'),
                  const Text('🔗 Facebook: facebook.com/royalcourtbd'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
