import 'package:flutter/cupertino.dart';
import '../models/article_model.dart';
import '../services/news_service.dart';

class ArticlesListViewModel extends ChangeNotifier {
  List<Article> _articlesList = [];
  List<Article> _articlesListByCategory = [];

  Future<void> fetchArticles() async {
    _articlesList = await NewsApi().fetchArticles();
    notifyListeners();
  }

  Future<void> fetchArticlesByCategory(String cat) async {
    final artList = await NewsApi().fetchArticlesByCategory(category: cat);
    if (artList == null) {
      return;
    }
    _articlesListByCategory = artList;

    notifyListeners();
  }

  List<Article> get articlesList => [..._articlesList];
  List<Article> get articlesListByCategory => [..._articlesListByCategory];
}
