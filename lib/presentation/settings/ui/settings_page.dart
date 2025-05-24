import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/external_libs/presentable_widget_builder.dart';

import 'package:portfolio/core/static/constants.dart';
import 'package:portfolio/core/utility/utility.dart';
import 'package:portfolio/presentation/settings/presenter/settings_presenter.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final SettingsPresenter settingsPresenter = locate<SettingsPresenter>();

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder(
      presenter: settingsPresenter,
      builder: () {
        return Scaffold(
          appBar: AppBar(title: Text(context.l10n.settings)),
          body: ListView(
            children: [
              // ভাষা সেকশন
              const _SectionHeader(title: 'ভাষা সেটিংস'),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('ভাষা পরিবর্তন করুন'),
                subtitle: Text(
                  settingsPresenter
                          .currentUiState
                          .settingsEntity
                          ?.currentLanguage ??
                      'English',
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('ভাষা নির্বাচন করুন'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text(banglaLocaleName),
                              leading: const CircleAvatar(child: Text('বাং')),
                              onTap: () {
                                settingsPresenter.updateLanguage(
                                  language: banglaLocaleName,
                                );
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text(englishLocaleName),
                              leading: const CircleAvatar(child: Text('En')),
                              onTap: () {
                                settingsPresenter.updateLanguage(
                                  language: englishLocaleName,
                                );
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

              // ডিসপ্লে সেটিংস
              const _SectionHeader(title: 'ডিসপ্লে সেটিংস'),
              SwitchListTile(
                title: const Text('ডার্ক মোড'),
                secondary: const Icon(Icons.dark_mode),
                value: false, // theme state থেকে নিতে হবে
                onChanged: (value) {
                  // theme স্টেট আপডেট করুন
                },
              ),
              ListTile(
                leading: const Icon(Icons.text_fields),
                title: const Text('ফন্ট সাইজ'),
                subtitle: const Text('মাঝারি'),
                onTap: () {
                  // ফন্ট সাইজ সেলেকশন
                },
              ),

              // নোটিফিকেশন সেটিংস
              const _SectionHeader(title: 'নোটিফিকেশন'),
              SwitchListTile(
                title: const Text('দৈনিক দুআ রিমাইন্ডার'),
                secondary: const Icon(Icons.notifications_active),
                value: true,
                onChanged: (value) {
                  // নোটিফিকেশন স্টেট আপডেট করুন
                },
              ),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('নোটিফিকেশন সময়'),
                subtitle: const Text('সকাল ৭:০০'),
                onTap: () {
                  // টাইম পিকার দেখান
                },
              ),

              // ব্যবহারকারী পছন্দ
              const _SectionHeader(title: 'ব্যবহারকারী পছন্দ'),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('ফেভারিট দুআ'),
                onTap: () {
                  // ফেভারিট দুআ ম্যানেজমেন্ট পেজে যান
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text('হিস্টোরি ক্লিয়ার করুন'),
                onTap: () {
                  // কনফার্মেশন ডায়ালগ দেখান
                },
              ),

              // অডিও সেটিংস
              const _SectionHeader(title: 'অডিও সেটিংস'),
              SwitchListTile(
                title: const Text('অটো-প্লে দুআ'),
                secondary: const Icon(Icons.play_circle_outline),
                value: false,
                onChanged: (value) {
                  // অটো-প্লে স্টেট আপডেট করুন
                },
              ),
              ListTile(
                leading: const Icon(Icons.audio_file),
                title: const Text('ডাউনলোড করা অডিও'),
                subtitle: const Text('৫৬ MB'),
                onTap: () {
                  // অডিও ম্যানেজমেন্ট পেজে যান
                },
              ),

              // অ্যাপ সম্পর্কিত
              const _SectionHeader(title: 'অ্যাপ সম্পর্কিত'),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('অ্যাপ সম্পর্কে'),
                subtitle: const Text('ভার্সন ১.০.০'),
                onTap: () {
                  // অ্যাপ সম্পর্কে পেজে যান
                },
              ),
              ListTile(
                leading: const Icon(Icons.star_outline),
                title: const Text('অ্যাপ রেটিং দিন'),
                onTap: () {
                  // প্লে স্টোর/অ্যাপ স্টোর লিংকে যান
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('অ্যাপ শেয়ার করুন'),
                onTap: () {
                  // শেয়ার ডায়ালগ দেখান
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
