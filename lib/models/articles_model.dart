import './article_model.dart';

class ArticlesList {
  final List<dynamic> artcs;
  ArticlesList({this.artcs});
  factory ArticlesList.fromJson(Map<String, dynamic> jsonData) {
    return ArticlesList(
      artcs: jsonData['articles'],
    );
  }
}
