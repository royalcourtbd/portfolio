import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/external_libs/presentable_widget_builder.dart';
import 'package:portfolio/data/services/cache_data.dart';
import 'package:portfolio/presentation/dua/presenter/dua_presenter.dart';
import 'package:portfolio/presentation/dua/presenter/dua_ui_state.dart';
import 'package:portfolio/presentation/dua/ui/dua_detail_page.dart';
import 'package:flutter/material.dart';

class DuaListPage extends StatelessWidget {
  final int categoryId;

  DuaListPage({super.key, required this.categoryId});
  final DuaPresenter duaPresenter = locate<DuaPresenter>();

  @override
  Widget build(BuildContext context) {
    final String categoryName = CacheData.allCategoriesNamesCache[categoryId];
    return PresentableWidgetBuilder(
      presenter: duaPresenter,
      onInit:
          () => duaPresenter.getDuaByCategory(
            categoryId: categoryId,

            context: context,
          ),
      builder: () {
        final DuaUiState uiState = duaPresenter.currentUiState;
        return Scaffold(
          appBar: AppBar(title: Text(categoryName)),
          body: ListView.builder(
            itemCount: uiState.duaList.length,
            itemBuilder: (context, index) {
              final dua = uiState.duaList[index];
              return ListTile(
                title: Text(dua.name),

                onTap: () {
                  // Handle the tap event, e.g., navigate to a detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DuaDetailPage()),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
