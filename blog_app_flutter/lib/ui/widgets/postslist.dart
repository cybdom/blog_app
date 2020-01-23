import 'package:blog_app_flutter/models/post.dart';
import 'package:blog_app_flutter/ui/screens/profile.dart';
import 'package:blog_app_flutter/ui/widgets/postcontainer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostsList extends StatelessWidget {
  final Function onTap;
  final List<PostModel> posts;
  final ScrollController scrollController;
  const PostsList({
    Key key,
    this.scrollController,
    @required this.posts,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: <Widget>[
          RotatedBox(
            quarterTurns: -1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Trending Articles",
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Icon(Icons.trending_up, color: Colors.red)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 11.0, right: 15),
            height: double.infinity,
            width: 1.0,
            color: Theme.of(context).dividerColor,
          ),
          Flexible(
            flex: 4,
            child: ListView.builder(
              controller: scrollController,
              itemCount: posts.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    // Go to single Post
                  },
                  child: PostContainer(
                    postId: posts[i].id,
                    authorId: posts[i].authorId,
                    authorName: posts[i].authorName,
                    categoryType: posts[i].categoryName,
                    imageUrl: posts[i].media,
                    isTrending: posts[i].isTrending,
                    title: posts[i].title,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
