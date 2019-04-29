import 'package:flutter/material.dart';
import 'package:mfw/components/new_app_bar.dart';

class PageScaffold extends StatefulWidget {
  const PageScaffold({
    /// TODO what is effect ???
    Key key,
    this.titleOpacity,
    this.backgroundColor,
    this.barSettings,
    this.body,
  });

  /// An app bar to display at the top of the scaffold.
//  final List<Map<String, Object>> barSettings;
  final int titleOpacity;

  /// the page content backgroundColor
  final Color backgroundColor;

  final Object barSettings;

  /// page content
  final Widget body;

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
      appBar: widget.barSettings != null ? MyAppBar(
        titleOpacity: widget.titleOpacity,
        barSettings: widget.barSettings
      ) : null,
      body: widget.body,
    );
  }
}
