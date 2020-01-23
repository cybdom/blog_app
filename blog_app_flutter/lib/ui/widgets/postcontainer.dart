import 'package:blog_app_flutter/ui/screens/profile.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final String imageUrl, title, categoryType, authorName, authorId, postId;
  const PostContainer({
    Key key,
    @required this.isTrending,
    @required this.imageUrl,
    @required this.title,
    @required this.categoryType,
    @required this.authorName,
    @required this.authorId,
    @required this.postId,
  }) : super(key: key);

  final bool isTrending;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: FadeInImage.assetNetwork(
              image: "$imageUrl",
              placeholder: "assets/loading.gif",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 9.0),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$title",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ProfileScreen(
                              userId: authorId,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "$categoryType | $authorName",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                    isTrending
                        ? Icon(
                            Icons.trending_up,
                            color: Colors.grey,
                          )
                        : Container()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
