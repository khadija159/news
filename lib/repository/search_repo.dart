import 'package:dartz/dartz.dart';
import 'package:news/models/news_response/NewsResponse.dart';

abstract class SearchRepo {
  Future<Either<List<News>, String>> getSearchResults(String query);
}