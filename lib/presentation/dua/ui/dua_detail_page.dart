import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/external_libs/presentable_widget_builder.dart';
import 'package:portfolio/core/static/font_family.dart';
import 'package:portfolio/presentation/dua/presenter/dua_presenter.dart';
import 'package:flutter/material.dart';

class DuaDetailPage extends StatelessWidget {
  DuaDetailPage({super.key});

  final DuaPresenter _duaPresenter = locate<DuaPresenter>();

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder<DuaPresenter>(
      presenter: _duaPresenter,
      builder: () {
        return Scaffold(
          // appBar: AppBar(title: Text(dua.name), leadingWidth: 30),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: _duaPresenter.currentUiState.duaList.length,
              itemBuilder: (context, index) {
                final duaItem = _duaPresenter.currentUiState.duaList[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Text(
                        duaItem.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            duaItem.indopak ?? '',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              letterSpacing: 0,

                              fontSize:
                                  _duaPresenter.currentUiState.arabicFontSize,
                              fontFamily: FontFamily.alQalam,
                            ),
                          ),
                        ),
                      ),

                      Text(
                        duaItem.translation,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: FontFamily.alQalam,
                        ),
                      ),

                      Text(
                        duaItem.reference ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: FontFamily.alQalam,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Handle the action, e.g., save to favorites
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to favorites')),
              );
            },
            child: const Icon(Icons.favorite),
          ),
        );
      },
    );
  }
}
