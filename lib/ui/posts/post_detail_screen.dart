import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../models/post.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PostDatailScreen extends StatelessWidget {
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
                        'https://i.pinimg.com/736x/21/2d/12/212d12e421963f8a66f95aece1182069.jpg'),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 10, 0, 0)),
                  Column(
                    children: [
                      Text(
                        post.author,
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                    icon: Icon(post.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      print('trinh');
                    },
                    color: Color(0xFFCF0A0A),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                  Icon(Icons.share),
                ],
              ),
            ),
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
              // direction: Axis.vertical,
            ),
          ],
        ),
      ),
    );
  }
}
