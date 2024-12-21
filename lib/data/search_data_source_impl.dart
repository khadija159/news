import 'package:dartz/dartz.dart';
import 'package:news/models/news_response/NewsResponse.dart';
import 'package:news/repository/search_data_source.dart';

import '../api/api_services.dart';

class SearchDataSourceImpl implements SearchDataSource{
  APIServices apiServices;
  SearchDataSourceImpl(this.apiServices);
  @override
  Future<Either<List<News>, String>> getSearchResults(String query) async {
    var response = await APIServices.getSearchedNews(query);

    if(response.status == 'error'){
      return Right(response.status ?? 'Error');
    }
    else{
      return Left(response.news ?? []);
    }
  }

}