import 'package:flutter/material.dart';
import 'package:flutter_app/core/model/news/news_model.dart';

class NewsItem extends StatelessWidget {
  final NewsModel news;
  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 3))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(news.imageUrl!),
              )),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              children: [
                Text(
                  news.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  news.description!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 12,
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
