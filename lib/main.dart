import 'package:flutter/material.dart';
import '/view_models/list_of_artcs_view_model.dart';
import '/views/tabs_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NewsCloud());
}

class NewsCloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticlesListViewModel>(
      create: (context) => ArticlesListViewModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
        ),
        home: TabsView(),
      ),
    );
  }
}
