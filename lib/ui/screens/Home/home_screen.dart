import 'package:flutter/material.dart';
import 'package:flutter_app/core/viewmodels/news/news_provider.dart';
import 'package:flutter_app/core/viewmodels/news/search_provider.dart';
import 'package:flutter_app/ui/router/router_list.dart';
import 'package:flutter_app/ui/screens/Home/items/home_latest_item.dart';
import 'items/home_headline_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void goToSearch() {
    SearchProvider.instance(context).clearSearch();
    Navigator.pushNamed(context, routeSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Open search data',
            onPressed: () => goToSearch(),
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var scrollController = ScrollController();

  Future onRefresh() async {
    final newProv = NewsProvider.instance(context);
    newProv.clearHeadLine();
    newProv.clearNews();
    return true;
  }

  _scrollistener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      NewsProvider.instance(context).getNews();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollistener);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: const [
            HomeHeadLineItem(),
            SizedBox(height: 12),
            HomelatestItem(),
          ],
        ),
      ),
    );
  }
}
