import 'package:flutter/material.dart';
import 'package:flutter_app/core/viewmodels/news/news_provider.dart';
import 'package:flutter_app/ui/widgets/news/news_item.dart';
import 'package:provider/provider.dart';

class HomelatestItem extends StatelessWidget {
  const HomelatestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, newsPro, _) {
      if (newsPro.news == null && !newsPro.onSearch) {
        newsPro.getNews();
        return const Center(child: CircularProgressIndicator());
      }

      if (newsPro.news == null && newsPro.onSearch) {
        return const Center(child: CircularProgressIndicator());
      }

      if (newsPro.news!.isEmpty) {
        return const SizedBox();
      }

      final news = newsPro.news;
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: news!.length,
            itemBuilder: (context, index) {
              final item = news[index];
              return NewsItem(news: item);
            },
          ),
          newsPro.news != null && newsPro.onSearch == true
              ? const CircularProgressIndicator()
              : const SizedBox(),
        ],
      );
    });
  }
}
