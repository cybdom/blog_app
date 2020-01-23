import 'package:flutter/material.dart';

class ProfileColumnInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;

  const ProfileColumnInfo({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.count,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.red,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle,
        ),
        Text("$count times")
      ],
    );
  }
}
