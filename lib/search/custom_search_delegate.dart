import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_services.dart';
import 'package:news/app_theme.dart';
import 'package:news/data/search_data_source_impl.dart';
import 'package:news/data/search_repo_impl.dart';
import 'package:news/newsss/news_item.dart';
import 'package:news/search/view_model/search_state.dart';
import 'package:news/search/view_model/search_view_model.dart';

class CustomSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
    IconButton(
        onPressed: (){},
        icon: Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            SearchViewModel(SearchRepoImpl(SearchDataSourceImpl(APIServices())))
            ..getSearched(query),
      child: BlocBuilder<SearchViewModel, SearchState>(
          builder: (context, state) {
            if(state is SearchSuccessState){
              return ListView.separated(
                  itemBuilder: (context, index) =>
                  NewsItem(state.news![index]),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.news!.length,
              );
            }
            if(state is SearchFailureState){
              return Column(
                children: [
                  Text(state.error ?? ''),
                  ElevatedButton(
                      onPressed: (){
                        BlocProvider.of<SearchViewModel>(context)
                            .getSearched(query);
                      },
                      child: Text('Try Again'))
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context){
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppTheme.primary,
        foregroundColor: AppTheme.white,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppTheme.white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: UnderlineInputBorder(borderSide: BorderSide.none)
      ),
    );
  }
}