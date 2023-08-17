import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // ProviderScope => Maintain state of ur app - inherited Widget
  // An InheritedWidget lives at the top of the widget tree and can pass down its data to all its descendant widgets.
  // These descendant widgets can easily access the data without having to pass it around explicitly.
  runApp(const ProviderScope(child: CounterApp()));
}

/// Providers are declared globally and specify how to create a state
/// Now the below variable becomes state full --- we can reset || change the value
final counterProvider = StateProvider<int>((ref) => 0);

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends ConsumerWidget {
  const MyHome({Key? key}) : super(key: key);

  @override //ref allows us to interact with providers
  Widget build(BuildContext context, WidgetRef ref) {
    //ref will rebuild the widget when the value is changed !!!
    var counter = ref.watch(counterProvider);
    // ref.listen(counterProvider, (previous, next) {});
    ref.listen(
      counterProvider,
      (previous, next) {
        print("The new value =$previous is $next");
        if (next == 5) {
          print("I just reached 5");
        }

        if (next >= 10) {
          // Perform actions when counter reaches 10 or more
          print("State has reached 10 or more. No more additions allowed.");

          // Show an alert to let the user know they reached a milestone
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Milestone Reached!'),
                content: Text('Congratulations! You reached 10 or more.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              );
            },
          );
        }
      },
    );
    return Scaffold(
      body: Center(
        child: Text(
          " VALUE : $counter",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            //WE USE REF.READ to change the state of the provider!!!!!
            onPressed: () => ref.read(counterProvider.notifier).state++,
          ),
          FloatingActionButton(
            child: Icon(Icons.exposure_minus_1),
            //WE USE REF.READ to change the state of the provider!!!!!
            onPressed: () => ref.read(counterProvider.notifier).state--,
          ),
        ],
      ),
    );
  }
}
