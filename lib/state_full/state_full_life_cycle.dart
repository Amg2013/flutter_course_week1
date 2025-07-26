import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LifecycleExample extends StatefulWidget {
  @override
  _LifecycleExampleState createState() => _LifecycleExampleState();
}

class _LifecycleExampleState extends State<LifecycleExample> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = 10;
    print('initState: Widget is created and initialized.');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies: Widget dependencies have changed.');
  }

  @override
  void didUpdateWidget(LifecycleExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget: Widget configuration has been updated.');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('setState: Widget state has been updated.');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate: Widget is being removed from the tree.');
  }

  @override
  Widget build(BuildContext context) {
    print('build: Widget is being rebuilt.');
    return Scaffold(
      appBar: AppBar(title: Text('Lifecycle Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $_counter'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => _counter++),

              child: Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    print('dispose: Widget is permanently removed from the tree.');
  }
}
