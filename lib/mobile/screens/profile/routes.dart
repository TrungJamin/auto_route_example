import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hello_auto_route/mobile/router/router.gr.dart';

import 'my_books_page.dart';
import 'profile_page.dart';

const profileTab = AutoRoute(
  path: 'profile',
  name: 'ProfileTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(path: '', page: ProfilePage),
    AutoRoute(path: 'my-books', page: MyBooksPage),
  ],
);
