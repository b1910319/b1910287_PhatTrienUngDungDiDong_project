import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'ui/posts/post_manager.dart';
import 'ui/posts/post_detail_screen.dart';
import 'ui/posts/post_overview_screen.dart';
import 'ui/posts/user_posts_screen.dart';
import 'package:provider/provider.dart';
import 'ui/posts/edit_post_screen.dart';
import 'ui/auth/auth_manager.dart';
import 'ui/auth/auth_screen.dart';
import 'ui/splash_screen.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PostManager(),
        ),
      ],
      child: Consumer<AuthManager>(builder: (context, authManager, child) {
        return MaterialApp(
          title: 'Review',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: authManager.isAuth
              ? const PostsOverviewScreen()
              : FutureBuilder(
                  future: authManager.tryAutoLogin(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SplashScreen()
                        : const AuthScreen();
                  },
                ),
          routes: {
            UserPostsScreen.routeName: (ctx) => const UserPostsScreen(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == PostDatailScreen.routeName) {
              final postId = settings.arguments as String;
              return MaterialPageRoute(
                builder: (ctx) {
                  return PostDatailScreen(
                    ctx.read<PostManager>().findById(postId),
                  );
                },
              );
            }
            if (settings.name == EditPostScreen.routeName) {
              final postId = settings.arguments as String?;
              return MaterialPageRoute(
                builder: (ctx) {
                  return EditPostScreen(
                    postId != null
                        ? ctx.read<PostManager>().findById(postId)
                        : null,
                  );
                },
              );
            }

            return null;
          },
        );
      }),
    );
  }
}
