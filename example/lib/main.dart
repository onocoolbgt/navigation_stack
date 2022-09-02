import 'package:example/screens.dart';
import 'package:flutter/material.dart';
import 'package:navigation_stack/navigation_stack.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  late ScaffoldMessengerState scaffoldM;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: NavigationStack.key,
      builder: (context, child) {
        scaffoldM = ScaffoldMessenger.of(context);
        return child!;
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Screen(
              title: 'Test',
              customBody: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.pushNamed(context, '/1');

                        scaffoldM.showSnackBar(
                          SnackBar(
                            content: Text('$result'),
                            duration: const Duration(milliseconds: 700),
                          ),
                        );
                      },
                      child: const Text('Test 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/2');
                      },
                      child: const Text('Test 2'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/3');
                      },
                      child: const Text('Test 3'),
                    ),
                  ],
                ),
              ),
            ),
        '/1': (context) => Screen(
              title: 'Test 1',
              onGoBack: () {
                print(NavigationStack().hashCode);
                NavigationStack().pop();
              },
            ),
        '/2': (context) => Screen(
              title: 'Test 2',
              onGoBack: () {
                print(NavigationStack().hashCode);
                NavigationStack().pop();
              },
            ),
        '/3': (context) => Screen(
              title: 'Test 3',
              onGoBack: () => Navigator.of(context).pop(),
            ),
      },
      initialRoute: '/',
    );
  }
}
