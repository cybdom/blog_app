import 'package:flutter/material.dart';

class BreakingNews extends StatelessWidget {
  final String imageUrl, title, author;

  const BreakingNews(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FadeInImage.assetNetwork(
            image: "$imageUrl",
            placeholder: "assets/loading.gif",
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 5.0),
                      padding: const EdgeInsets.all(11.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        "Breaking News",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    Text(
                      "$title",
                      maxLines: 3,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "$author",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white.withOpacity(.85),
                          ),
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
