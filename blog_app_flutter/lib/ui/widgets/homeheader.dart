import 'package:blog_app_flutter/models/post.dart';
import 'package:blog_app_flutter/ui/widgets/breakingnews.dart';
import 'package:flutter/material.dart';

class HomeScreenHeader extends StatefulWidget {
  final List<PostModel> posts;
  const HomeScreenHeader({
    Key key,
    @required this.posts,
  }) : super(key: key);

  @override
  _HomeScreenHeaderState createState() => _HomeScreenHeaderState();
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.7,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: PageView.builder(
              onPageChanged: (i) {
                setState(() {
                  _active = i;
                });
              },
              controller: PageController(initialPage: _active),
              itemCount: widget.posts.length,
              itemBuilder: (ctx, i) {
                return BreakingNews(
                  author: widget.posts[i].authorName,
                  imageUrl: widget.posts[i].media,
                  title: widget.posts[i].title,
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              value: _active / (widget.posts.length - 1),
              backgroundColor: Colors.black.withOpacity(.3),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
