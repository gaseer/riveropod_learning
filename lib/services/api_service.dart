// import 'dart:convert';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart';
// import 'package:riveropod_learning/model/user_model.dart';
//
// class ApiServices {
//   String point = "https://reqres.in/api/users?page=2";
//
//   // return result.map(((e) => UserModel.fromJson(e))).toList(): This line maps each element in the result list using the
//   // provided function (e) => UserModel.fromJson(e)
// //userProvider is shared data and also we can acess methods with it
// final userProvider = Provider<ApiServices>(
//     (context) => ApiServices()); //You are injecting the class
//
// // PROVIDER function takes a reference and return a String
// final user = Provider<String>((ref) {
//   return "GASEER";
// });
