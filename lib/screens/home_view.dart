import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hookwidget/model/home_model.dart';

T useChangeNotifierListenable<T extends ChangeNotifier>(T data) {
  final state = useState<T>(data);
  return useListenable(state.value);
}

class HomeView extends HookWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeChangeNotifier =
        useChangeNotifierListenable(HomeChangeNotifier());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter hook'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${homeChangeNotifier.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _incrementCounter(homeChangeNotifier);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _incrementCounter(HomeChangeNotifier homeChangeNotifier) async {
    homeChangeNotifier.increment();
  }
}
