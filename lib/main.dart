import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/widgets.dart';
import 'package:hello_auto_route/mobile/router/router.gr.dart';
import 'package:provider/provider.dart';

import 'data/db.dart';
import 'mobile/router/auth_guard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _rootRouter = RootRouter(
      // authGuard: AuthGuard(),

      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      routerDelegate: _rootRouter.delegate(),
      routeInformationProvider: _rootRouter.routeInfoProvider(),
      routeInformationParser: _rootRouter.defaultRouteParser(),
      builder: (_, router) {
        return ChangeNotifierProvider<AuthService>(
          create: (_) => AuthService(),
          child: BooksDBProvider(
            child: router!,
          ),
        );
      },
    );
  }
}
