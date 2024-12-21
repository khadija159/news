import 'package:flutter/cupertino.dart';
import 'package:news/api/api_services.dart';
import 'package:news/newsss/news_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.sourceId);

  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIServices.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError) {
          return const ErrorIndicator();
        } else if (snapshot.hasData) {
          final data = snapshot.data;
          if (data?.status != 'ok') {
            return const ErrorIndicator();
          }

          final newsList = data?.news ?? [];
          if (newsList.isEmpty) {
            return const ErrorIndicator();
          }

          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (_, index) => NewsItem(newsList[index]),
          );
        } else {
          return const ErrorIndicator();
        }
      },
    );
  }
}
