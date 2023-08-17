// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riveropod_learning/services/api_service.dart';
//
// // ++ COzzz this is an async req we wrap the provider with FutureProvider
// //userProvider is shared data and also we can acess methods with it
// final userData =
//     FutureProvider((ref) async => ref.watch(userProvider).getUsers());
//
// ///SAME AS ABOVVEE
// ///// mORE Understandabilty
// final Demo = FutureProvider((ref) async {
//   return ref.watch(Provider<ApiServices>((ref) => ApiServices())).getUsers();
// });
