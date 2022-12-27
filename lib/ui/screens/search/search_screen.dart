import 'package:flutter/material.dart';
import 'package:flutter_app/core/viewmodels/news/news_provider.dart';
import 'package:flutter_app/core/viewmodels/news/search_provider.dart';
import 'package:flutter_app/ui/widgets/news/news_item.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  void onSearch(String value) {
    final newsProvider = SearchProvider.instance(context);
    newsProvider.clearSearch();
    newsProvider.searchNews(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchField(),
      ),
      body: const SearchBody(),
    );
  }

  Widget _searchField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: searchController,
          keyboardType: TextInputType.text,
          onSubmitted: (value) => onSearch(value),
          decoration: const InputDecoration(
            hintText: "mau cari apa?",
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, newsPro, _) {
      if (newsPro.onSearch) {
        return const Center(child: CircularProgressIndicator());
      }
      if (newsPro.search == null) {
        return const SizedBox();
      }
      if (newsPro.search!.isEmpty) {
        return const Center(
          child: Text(
            "Berita Tidak Ditemukan",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        );
      }

      final news = newsPro.search;
      return ListView.builder(
        shrinkWrap: true,
        itemCount: news?.length,
        itemBuilder: (context, index) {
          final item = news![index];
          return NewsItem(news: item);
        },
      );
    });
  }
}
