import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../router/router.gr.dart';
import '../user-data/data_collector.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserData? userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile page',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // from ProfileTab to BookDetailsPage in BooksTab

                /*  context.navigateTo(
                  BooksTab(children: [
                    // BookListRoute(),
                    // BookDetailsRoute(), // error, missing param
                    BookDetailsRoute(id: 1),
                    // MyBooksRoute(), // error because not adding their parent to stack first
                  ]),
                );*/

                // MyBooksRoute().show(context);
                // context.router.push(MyBooksRoute());
                context.router.navigate(MyBooksRoute());

                // context.router.pushNamed(MyBooksRoute.name);  error
              },
              child: Text('My Books'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.navigateBack();
              },
              child: Text('Navigate Back'),
            ),
            const SizedBox(height: 32),
            userData == null
                ? ElevatedButton(
                    onPressed: () {
                      context.pushRoute(
                        UserDataCollectorRoute(onResult: (data) {
                          setState(() {
                            userData = data;
                          });
                        }),
                      );
                    },
                    child: Text('Collect user data'),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Your Data is complete'),
                      const SizedBox(height: 24),
                      Text('Name: ${userData!.name}'),
                      const SizedBox(height: 24),
                      Text('Favorite book: ${userData!.favoriteBook}'),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
