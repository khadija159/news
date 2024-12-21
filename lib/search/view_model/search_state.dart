import 'package:news/models/news_response/NewsResponse.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState{}

class SearchLoadingState extends SearchState{}

class SearchFailureState extends SearchState{
  String? error;
  SearchFailureState(this.error);
}

class SearchSuccessState extends SearchState{
  List<News>? news;
  SearchSuccessState(this.news);
}