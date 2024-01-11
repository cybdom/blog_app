import 'package:blog_app_flutter/global.dart';
import 'package:blog_app_flutter/models/category.dart';
import 'package:blog_app_flutter/models/editor.dart';
import 'package:blog_app_flutter/models/post.dart';
import 'package:blog_app_flutter/notifiers/notifiers.dart';
import 'package:blog_app_flutter/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({super.key, required this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  EditorNotifier _editorNotifier = EditorNotifier();
  @override
  void initState() {
    _editorNotifier.getEditor(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _editorNotifier,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
        ),
        body: Consumer<EditorNotifier>(
          builder: (context, snapshot, _) {
            switch (snapshot.status) {
              case Status.loading:
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              case Status.done:
                {
                  return ProfileContent(
                    snapshot: snapshot.editorInfo,
                    posts: snapshot.posts,
                    categories: snapshot.categories,
                  );
                }
              default:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  final EditorModel snapshot;
  final List<PostModel> posts;
  final List<CategoryModel> categories;

  const ProfileContent(
      {super.key,
      required this.snapshot,
      required this.posts,
      required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            height: 71,
            width: 71,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage(
                "${snapshot.image}",
              ),
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Text("${snapshot.fullname}",
            style: Theme.of(context).textTheme.titleLarge),
        Text(
          "${snapshot.type}",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.grey),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileColumnInfo(
              title: "Trending",
              count: snapshot.trending_count,
              icon: Icons.trending_up,
            ),
            ProfileColumnInfo(
              title: "Bookmarked",
              count: snapshot.bookmarked_count,
              icon: Icons.bookmark_border,
            ),
            ProfileColumnInfo(
              title: "Favorite",
              count: snapshot.favorite_count,
              icon: Icons.favorite_border,
            ),
            ProfileColumnInfo(
              title: "Awards",
              count: snapshot.awards_count,
              icon: Icons.star_border,
            ),
          ],
        ),
        SizedBox(height: 15),
        CategoriesList(
          categories: categories,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          width: double.infinity,
          height: 1,
          color: Theme.of(context).dividerColor,
        ),
        Expanded(
          child: DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return PostsList(
                posts: posts,
                scrollController: scrollController,
              );
            },
          ),
        ),
      ],
    );
  }
}
