import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:review/ui/posts/post_manager.dart';
import '../../models/post.dart';
import 'post_detail_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'post_detail_screen.dart';
import 'package:provider/provider.dart';
import 'post_manager.dart';

class PostGridTile extends StatelessWidget {
  final Post post;
  const PostGridTile(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        header: buildGridHeaderBar(context),
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              PostDatailScreen.routeName,
              arguments: post.id,
            );
          },
          child: Image.network(
            post.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.white,
      title: Text(
        post.title,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget buildGridHeaderBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black38,
      leading: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/c6/e5/65/c6e56503cfdd87da299f72dc416023d4.jpg'),
          ),
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 0, 0)),
          Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
              Text(
                post.author,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              RatingBarIndicator(
                rating: 4.5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 17.0,
                // direction: Axis.vertical,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
          ValueListenableBuilder<bool>(
              valueListenable: post.isFavoriteListenable,
              builder: (ctx, isFavorite, child) {
                return IconButton(
                  icon:
                      Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {
                    ctx.read<PostManager>().tonggleFavoriteStatus(post);
                  },
                  color: Color(0xFFCF0A0A),
                );
              }),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
          Icon(Icons.share),
        ],
      ),
    );
  }
}
