import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riveropod_learning/model/user_model.dart';

final fetchUser = FutureProvider((ref) async {
  const uri = 'https://jsonplaceholder.typicode.com/users';
  // final getUrl = await get(Uri.parse(uri));

  return http
      .get(Uri.parse(uri))
      .then((value) => UserModel.fromJson(json.decode(value.body)));
});
