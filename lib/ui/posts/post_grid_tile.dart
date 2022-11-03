import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../models/post.dart';
import 'post_detail_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'post_detail_screen.dart';
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PostDatailScreen(post),
              ),
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
                'https://i.pinimg.com/736x/21/2d/12/212d12e421963f8a66f95aece1182069.jpg'),
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
          IconButton(
            icon:
                Icon(post.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              print('trinh');
            },
            color: Color(0xFFCF0A0A),
          ),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
          Icon(Icons.share),
        ],
      ),
    );
  }
}
