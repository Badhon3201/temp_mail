import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_mail/feature/auth/view_model/access_token_view_model.dart';
import 'package:temp_mail/feature/auth/view_model/sign_in_view_model.dart';
import 'package:temp_mail/feature/dashboard/view_model/message_list_view_model.dart';

import 'feature/app_navigator.dart';
import 'feature/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AccessTokenProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthViewWrapper(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SignInViewModel()),
          ChangeNotifierProvider(create: (context) => MessageListViewModel()),
        ],
        child: MaterialApp(
          navigatorKey: appNavigator.navigatorKey,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // debugShowCheckedModeBanner: false,
          home: const SplashScreens(),
        ),
      ),
    );
  }
}
