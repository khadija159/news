import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/NewsResponse.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../widgets/loading_indicator.dart';

class NewsDetails extends StatelessWidget{
   static const String routeName = "/news_details";
  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Container(
        decoration: BoxDecoration(
            color: AppTheme.white,
            image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
            )
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(news.title ?? ''),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? 'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  fit: BoxFit.fill,
                  placeholder: (_,__) => LoadingIndicator(),
                  errorWidget: (_,__,___) =>
                      Icon(Icons.image_not_supported_outlined),
                ),
              ),
              SizedBox(height: 4),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.source?.name ?? '',
                    style: titleSmallStyle?.copyWith(
                        fontSize: 10,
                        color: AppTheme.grey
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    news.title ?? '',
                    style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      timeago.format(DateTime.parse(news.publishedAt!)),
                      style: titleSmallStyle?.copyWith(
                        fontSize: 13,
                        color: AppTheme.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(news.description ?? ''),
                  SizedBox(height: 36,),
                  InkWell(
                    onTap: (){
                      _launchUrl(news.url ?? '');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('View Full Article'),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ],
              )
                ,),
            ],
          ),
        ));
  }

  Future<void> _launchUrl(String url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

}