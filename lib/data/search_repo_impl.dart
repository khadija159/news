import 'package:dartz/dartz.dart';
import 'package:news/api/api_services.dart';
import 'package:news/models/news_response/NewsResponse.dart';
import 'package:news/repository/search_data_source.dart';
import 'package:news/repository/search_repo.dart';

class SearchRepoImpl implements SearchRepo{
  SearchDataSource dataSource;
  SearchRepoImpl(this.dataSource);
  @override
  Future<Either<List<News>, String>> getSearchResults(String query) {
    return dataSource.getSearchResults(query);
  }
}