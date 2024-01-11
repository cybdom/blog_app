import 'package:blog_app_flutter/global.dart';
import 'package:blog_app_flutter/notifiers/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:blog_app_flutter/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostNotifier _allPosts = PostNotifier();
  CategoryNotifier _allCategories = CategoryNotifier();

  @override
  void initState() {
    _allPosts.getPosts();
    _allCategories.getcategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => _allPosts,
        ),
        ChangeNotifierProvider(
          create: (_) => _allCategories,
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Consumer<PostNotifier>(
                builder: (ctx, snapshot, _) {
                  switch (snapshot.status) {
                    case Status.loading:
                      return Center(
                        child: HomeScreenHeader(
                          posts: [],
                        ),
                      );
                    case Status.done:
                      return HomeScreenHeader(
                          posts: _allPosts.posts
                              .where((doc) => doc.isTrending)
                              .toList());

                    default:
                      return HomeScreenHeader(
                        posts: [],
                      );
                  }
                },
              ),
              Consumer<CategoryNotifier>(
                builder: (ctx, snapshot, _) {
                  switch (snapshot.status) {
                    case Status.loading:
                      return CategoriesList(
                        categories: [],
                      );

                    case Status.done:
                      return CategoriesList(categories: snapshot.categories);

                    default:
                      return CategoriesList(
                        categories: [],
                      );
                  }
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                width: double.infinity,
                height: 1,
                color: Theme.of(context).dividerColor,
              ),
              Expanded(
                child: Consumer<PostNotifier>(
                  builder: (ctx, snapshot, _) {
                    switch (snapshot.status) {
                      case Status.loading:
                        return PostsList(
                          posts: [],
                        );

                      case Status.done:
                        return PostsList(
                          posts: snapshot.posts,
                        );

                      default:
                        return PostsList(
                          posts: [],
                        );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
