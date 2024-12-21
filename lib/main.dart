import 'package:flutter/material.dart';
import 'package:news/newsss/news_details.dart';
import 'app_theme.dart';
import 'home.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget{
  const NewsApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsDetails.routeName: (_) => NewsDetails()
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }


}