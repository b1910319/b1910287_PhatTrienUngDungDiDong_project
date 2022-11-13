import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../models/post.dart';
//hiển thị ngôi sao
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'post_manager.dart';
import 'package:provider/provider.dart';

class PostDatailScreen extends StatelessWidget {
  static const routeName = '/post-detail';
  const PostDatailScreen(this.post, {super.key});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                post.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/c6/e5/65/c6e56503cfdd87da299f72dc416023d4.jpg'),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 10, 0, 0)),
                  Column(
                    children: [
                      Text(
                        post.author,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      //hiển thị ngôi sao
                      RatingBarIndicator(
                        //số ngôi sao màu vàng
                        rating: 4.5,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        //tổng số ngôi sao
                        itemCount: 5,
                        itemSize: 17.0,
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                  //chọn / bỏ chọn bài viết yêu thích
                  ValueListenableBuilder<bool>(
                    valueListenable: post.isFavoriteListenable,
                    builder: (ctx, isFavorite, child) {
                      return IconButton(
                        icon: Icon(isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border),
                        onPressed: () {
                          ctx.read<PostManager>().tonggleFavoriteStatus(post);
                        },
                        color: Color(0xFFCF0A0A),
                      );
                    }
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                  Icon(Icons.share),
                ],
              ),
            ),
            //gạch dưới
            const Divider(),
            Text(
              post.title,
              style: TextStyle(
                color: Color(0xFFFD841F),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              width: double.infinity,
              child: Text(
                post.content,
                softWrap: true,
              ),
            ),
            Text(
              'ĐÁNH GIÁ BÀI VIẾT NÀY',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            RatingBarIndicator(
              rating: 0,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
