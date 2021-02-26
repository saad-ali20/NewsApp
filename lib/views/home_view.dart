import 'package:flutter/material.dart';
import '../view_models/list_of_artcs_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  String category;
  HomeView({this.category});

  @override
  Widget build(BuildContext context) {
    _showDialogError() {
      return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Response Error '),
                content:
                    Text('we can not fetch data check the internet connection'),
                actions: [
                  RaisedButton(
                      child: Text('okey'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ));
    }

    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<ArticlesListViewModel>(context, listen: false)
            .fetchArticlesByCategory(category),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () =>
                    Provider.of<ArticlesListViewModel>(context, listen: false)
                        .fetchArticlesByCategory(category),
                child: Consumer<ArticlesListViewModel>(
                  builder: (ctx, articlesData, _) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount:
                          articlesData.articlesListByCategory.length == null
                              ? 0
                              : articlesData.articlesListByCategory.length,
                      itemBuilder: (ctx, i) => Column(
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            child: articlesData
                                        .articlesListByCategory[i].imageUrl ==
                                    null
                                ? Center(child: Text('check the connection'))
                                : Image.network(
                                    articlesData
                                        .articlesListByCategory[i].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                              articlesData.articlesListByCategory[i].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(articlesData
                                .articlesListByCategory[i].description),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
