import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riveropod_learning/rivaanRanwat/services/userApi_future.dart';

import '../../model/user_model.dart';
import '../../view/details_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(fetchUser);
    return Scaffold(
      appBar: AppBar(
        title: Text("RIVERPOD"),
        centerTitle: true,
      ),
      body: _data.when(
          data: (_data) {
            List<UserModel> userList = [];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    oneUser: userList[index],
                                  ),
                                ),
                              ),
                              child: Card(
                                color: Colors.blue,
                                elevation: 4,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Text(
                                    userList[index].firstname,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(userList[index].lastname,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  trailing: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(userList[index].avatar),
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => LinearProgressIndicator()),
    );
  }
}
