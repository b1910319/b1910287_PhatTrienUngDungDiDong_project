import 'package:flutter/material.dart';

import 'auth_card.dart';
import 'app_banner.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         const Color(0xFFF5F0BB).withOpacity(0.5),
          //         const Color(0xFF90C8AC).withOpacity(0.9),
          //       ],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //       stops: const [0, 1],
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
            child: SizedBox(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // const Flexible(
                  //   child: AppBanner(),
                  // ),
                  // Flexible(
                  //   flex: deviceSize.width > 600 ? 2 : 1,
                  //   child: const AuthCard(),
                  // ),
                  AuthCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
