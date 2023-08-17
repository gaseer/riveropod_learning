import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CrudScreen extends StatelessWidget {
  CrudScreen({Key? key}) : super(key: key);

  List<String> userList = ["lihknn", "mnkjnkj"];
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController city = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(context.read()),
          TextFormField(
            onFieldSubmitted: (v) => userList.add(v),
            controller: name,
            decoration: InputDecoration(
              labelText: 'Enter Name',
              hintText: 'aa',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print(userList);
                print("userList------");
              },
              child: Text("ADD")),
          ElevatedButton(onPressed: () {}, child: Text("List")),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                // Here, you can access individual user data using userList[index]
                var user = userList[index];

                return ListTile(
                  title: Text(
                      user[index]), // Assuming each user has a 'name' property
                  // subtitle: Text(
                  //     user.email), // Assuming each user has an 'email' property
                  // You can add more widgets to display other user information
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
