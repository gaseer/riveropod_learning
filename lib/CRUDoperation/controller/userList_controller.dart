import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListController extends StateNotifier<List<User>> {
  UserListController(super.state);
}

class User {}
