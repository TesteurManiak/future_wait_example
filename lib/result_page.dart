import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final Future future;
  final String title;

  ResultPage(this.future, this.title);

  @override
  State<StatefulWidget> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final _stopwatch = Stopwatch()..start();

  @override
  void dispose() {
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: widget.future,
            builder: (_, snapshot) => !snapshot.hasData
                ? CircularProgressIndicator()
                : Text('Operation executed in ${_stopwatch.elapsed}'),
          ),
        ),
      ),
    );
  }
}
