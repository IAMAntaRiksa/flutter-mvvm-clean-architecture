import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/model/news/news_model.dart';
import 'package:flutter_app/core/viewmodels/news/news_provider.dart';
import 'package:flutter_app/ui/constant/constant.dart';
import 'package:provider/provider.dart';

class HomeHeadLineItem extends StatelessWidget {
  const HomeHeadLineItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, newsPro, _) {
      if (newsPro.headlines == null && !newsPro.onSearch) {
        newsPro.getHeadLines();
        return const Center(child: CircularProgressIndicator());
      }

      if (newsPro.headlines == null && newsPro.onSearch) {
        return const Center(child: CircularProgressIndicator());
      }

      if (newsPro.headlines!.isEmpty) {
        return const SizedBox();
      }

      final news = newsPro.headlines;
      return Column(
        children: [
          SizedBox(
            width: deviceWidth(context),
            height: deviceHeight(context) * 0.42,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: news!.first.imageUrl!,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        news.first.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _headLineChildren(news),
        ],
      );
    });
  }
}

Widget _headLineChildren(List<NewsModel> news) {
  return Row(
      children: news
          .asMap()
          .map((index, value) => MapEntry(
                index,
                index > 0 && index < 4
                    ? _headLineChildrenItem(value)
                    : const SizedBox(),
              ))
          .values
          .toList());
}

Widget _headLineChildrenItem(NewsModel news) {
  return Expanded(
    child: Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(news.imageUrl!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          news.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        )
      ],
    ),
  );
}
