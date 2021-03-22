import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final Future future;

  ResultPage(this.future);

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
      appBar: AppBar(),
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
