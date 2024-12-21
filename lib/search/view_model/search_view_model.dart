import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/repository/search_repo.dart';
import 'package:news/search/view_model/search_state.dart';

class SearchViewModel extends Cubit<SearchState>{
  SearchRepo repo;
  SearchViewModel(this.repo) : super(SearchInitialState());

  Future<void> getSearched(String query) async {
    try{
      emit(SearchLoadingState());

      final response = await repo.getSearchResults(query);

      response.fold((news){
        emit(SearchSuccessState(news));
      }, (error){
        emit(SearchFailureState(error));
      });
    } catch(error){
      emit(SearchFailureState(error.toString()));
    }
  }
}