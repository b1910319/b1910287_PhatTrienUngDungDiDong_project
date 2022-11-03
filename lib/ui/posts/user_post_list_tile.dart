import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../models/post.dart';

class UserPostListTile extends StatelessWidget {
  final Post post;
  const UserPostListTile(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(post.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        print('go to edit post screen');
      },
      icon: const Icon(Icons.edit_note),
      color: Theme.of(context).primaryColor,
    );
  }
  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        print('go to delete post screen');
      },
      icon: const Icon(Icons.delete_sweep),
      color: Color(0xFFE0144C),
    );
  }
}
