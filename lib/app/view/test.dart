import 'package:flutter/material.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation, 
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation example',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/': return new MyCustomRoute(
            builder: (_) => new MyHomePage(),
            settings: settings,
          );
          case '/somewhere': return new MyCustomRoute(
            builder: (_) => new Somewhere(),
            settings: settings,
          );
        }
        assert(false);
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Navigation example'),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget> [
            new DrawerHeader(
              child: new Container(
                  child: const Text('This is a header'),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.navigate_next),
              title: const Text('Navigate somewhere'),
              onTap: () {
                Navigator.pushNamed(context, '/somewhere');
              },
            ),
          ],
        ),
      ),
      body: new Center(
        child: new Text(
          'This is a home page.',
        ),
      ),
    );
  }
}

class Somewhere extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(
          'Congrats, you did it.',
        ),
      ),
      appBar: new AppBar(
        title: new Text('Somewhere'),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Container(
                child: const Text('This is a header'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}