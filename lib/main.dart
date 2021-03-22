import 'package:flutter/material.dart';
import 'package:future_wait_example/result_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _navigateTo(Future future) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => ResultPage(future)));

  /// Elapsed time should be around 2 seconds.
  Future<void> _futureWait() async {
    await Future.wait([
      Future.delayed(Duration(seconds: 2)),
      Future.delayed(Duration(seconds: 2)),
    ]);

    /// This return is here for the `FutureBuilder`
    return true;
  }

  /// Elapsed time should be around 4 seconds.
  Future<void> _multiAwait() async {
    await Future.delayed(Duration(seconds: 2));
    await Future.delayed(Duration(seconds: 2));

    /// This return is here for the `FutureBuilder`
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _navigateTo(_multiAwait()),
              child: Text('Multiple await'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _navigateTo(_futureWait()),
              child: Text('Future.wait()'),
            ),
          ],
        ),
      ),
    );
  }
}
