import 'package:flutter/material.dart';
import 'package:mfw/components/new_app_bar.dart';

class PageScaffold extends StatefulWidget {
  const PageScaffold({
    /// TODO what is effect ???
    Key key,
    this.barSettings,
    this.body,
    this.backgroundColor,
  });

  /// An app bar to display at the top of the scaffold.
//  final List<Map<String, Object>> barSettings;
  final Object barSettings;

  /// page content
  final Widget body;

  /// the page content backgroundColor
  final Color backgroundColor;

  _PageScaffold createState() => new _PageScaffold();
}

class _PageScaffold extends State<PageScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.backgroundColor ?? new Color.fromARGB(255, 242, 242, 245),
      appBar: MyAppBar(
        barSettings: widget.barSettings,
      ),
      body: widget.body,
    );
  }
}
