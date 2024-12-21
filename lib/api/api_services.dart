import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_response/NewsResponse.dart';
import 'package:news/models/sources_response/SourcesResponse.dart';

class APIServices{
  static Future<SourcesResponse> getSources(String categoryId)async{
    final uri = Uri.https(APIConstants.baseURL,APIConstants.sourcesEndpoint,{
      'apiKey': APIConstants.apiKey,
      'category': categoryId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId)async{
    final uri = Uri.https(APIConstants.baseURL,APIConstants.newsEndpoint,{
      'apiKey': APIConstants.apiKey,
      'sources': sourceId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> getSearchedNews(String query)async{
    final uri = Uri.https(APIConstants.baseURL,APIConstants.newsEndpoint,{
      'apiKey': APIConstants.apiKey,
      'q': query,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}