import 'package:flutter_riverpod/flutter_riverpod.dart';

final headingName = Provider<String>((ref) => "CRUD OPERATION");

final getUserFromApi = FutureProvider<String>((ref) => getDataName());

Future<String> getDataName() async {
  await Future.delayed(Duration(seconds: 5));
  return 'API NAME';
}
