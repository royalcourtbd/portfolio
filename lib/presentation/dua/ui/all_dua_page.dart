import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/external_libs/animate_do/animated_list_item.dart';
import 'package:portfolio/core/external_libs/presentable_widget_builder.dart';
import 'package:portfolio/presentation/dua/presenter/dua_presenter.dart';
import 'package:portfolio/presentation/dua/ui/dua_detail_page.dart';
import 'package:flutter/material.dart';

class AllDuaPage extends StatelessWidget {
  AllDuaPage({super.key});
  final DuaPresenter _duaPresenter = locate<DuaPresenter>();

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder(
      presenter: _duaPresenter,
      onInit: () => _duaPresenter.getAllDua(),
      builder: () {
        return Scaffold(
          appBar: AppBar(title: const Text('All Dua')),
          body: ListView.builder(
            itemCount: _duaPresenter.currentUiState.duaList.length,
            itemBuilder: (context, index) {
              final dua = _duaPresenter.currentUiState.duaList[index];
              return AnimatedListItem(
                index: index,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      dua.id.toString(), // Display the ID of the dua
                    ), // Display the first letter of the dua name
                  ),
                  title: Text(dua.name),
                  onTap: () {
                    // Handle the tap event, e.g., navigate to a detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DuaDetailPage()),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
