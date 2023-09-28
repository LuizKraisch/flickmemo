import 'package:flickmemo/components/search_header.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131417),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Color(0xff1D1F24),
          floating: true,
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(background: SearchHeader()),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(height: 400, color: Color(0xff1D1F24)),
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(height: 400, color: Color(0xff1D1F24)),
              )),
        ),
      ]),
    );
  }
}
