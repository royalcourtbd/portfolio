import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sayed\'s Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sayed's Portfolio"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            AboutScreen(),
            ProjectsScreen(),
            ContactScreen(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 20),
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/app_logo.png'),
        ),
        SizedBox(height: 12),
        Text(
          'MD ABU SAYED',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text('Flutter Developer', style: TextStyle(fontSize: 16)),
        SizedBox(height: 20),
      ],
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'About Me',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'I am a passionate Flutter developer from Dhaka, Bangladesh. I have experience in building beautiful UIs and integrating with Firebase & REST APIs. I also specialize in converting Figma designs to Flutter apps.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

// models/project.dart
class Project {
  final String title;
  final String description;

  Project({required this.title, required this.description});
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(project.title),
        subtitle: Text(project.description),
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({super.key});

  final List<Project> projects = [
    Project(
      title: 'Job Finder App',
      description: 'A Flutter app using Firebase to post and apply to jobs.',
    ),
    Project(
      title: 'NFC Wallet Reader',
      description:
          'Displays balance and transaction history by scanning cards.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projects',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...projects.map((project) => ProjectCard(project: project)),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Contact Me',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Phone: 01749247855'),
          Text('Telegram: Roya court bd'),
          Text('Facebook: Royalcourtbd'),
          Text('Email: sayed@example.com'),
        ],
      ),
    );
  }
}
