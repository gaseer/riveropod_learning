import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riveropod_learning/view/home_screen.dart';
import 'package:riveropod_learning/view/todo_riverpod.dart';

import 'CRUDoperation/crudScreen.dart';

// import 'firstApp_riverpod.dart';

//the Provider ref will help to talk with other providers
final nameProvider = Provider<String>((ref) => "Name");
final changeProvider = StateProvider<String?>((ref) => null);

void main() => runApp(ProviderScope(
      child: MaterialApp(
          home: CrudScreen(),
          theme: ThemeData(
              backgroundColor: Colors.red, primaryColor: Colors.blue)),
    ));
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: RivaanRanawat(),
//     );
//   }
// }

class RivaanRanawat extends ConsumerWidget {
  const RivaanRanawat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(changeProvider) ?? 'aa';
    return Scaffold(
      appBar: AppBar(title: Text("TEXT CHANGE")),
      body: Column(
        children: <Widget>[
          TextFormField(
            onFieldSubmitted: (v) =>
                ref.read(changeProvider.notifier).update((state) => v),
          ),
          Text(name!),
        ],
      ),
    );
  }
}
