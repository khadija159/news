import 'package:flutter/material.dart';
import 'package:news/models/sources_response/SourcesResponse.dart';
import 'package:news/tabs/tab_item.dart';
import '../newsss/news_list.dart';

class SourcesTabs extends StatefulWidget{
  SourcesTabs(this.sources);
  
  List<Sources> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              onTap: (index){
                selectedTabIndex = index;
                setState(() {});
              },
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              tabs: widget.sources
              .map(
                  (source) => TabItem(
                      sourceName: source.name!,
                      isSelected:
                          widget.sources.indexOf(source) == selectedTabIndex,
                  ),
              )
              .toList()
          ),
        ),
        Expanded(child: NewsList(widget.sources[selectedTabIndex].id!)),
      ],
    );
  }
}