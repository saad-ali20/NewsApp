import 'package:flutter/material.dart';
import '../views/home_view.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('أخبار اليوم ')),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                child: Text('رياضة'),
              ),
              Tab(
                child: Text('الصحة'),
              ),
              Tab(
                child: Text('تكنو'),
              ),
              Tab(
                child: Text('عمل'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomeView(category: 'general'),
            HomeView(category: 'sports'),
            HomeView(category: 'health'),
            HomeView(category: 'technology'),
            HomeView(category: 'business'),
          ],
        ),
      ),
    );
  }
}
