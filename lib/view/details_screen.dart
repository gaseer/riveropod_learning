import 'package:flutter/material.dart';
import 'package:riveropod_learning/model/user_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.oneUser}) : super(key: key);
  final UserModel oneUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details of USER"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            minRadius: 50,
            backgroundImage: NetworkImage(
              oneUser.avatar,
            ),
          ),
          Center(
            child: Text(
              oneUser.firstname,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Text(oneUser.lastname, style: const TextStyle(color: Colors.white)),
          Text(oneUser.id.toString()),
        ],
      ),
    );
  }
}
