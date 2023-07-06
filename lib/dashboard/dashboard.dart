import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posapp/directory/data_provider.dart';
import 'package:posapp/model/user_model.dart';
import 'package:posapp/notifier/auth_notifier.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(UserDataProvider);
    final emailData = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: _data.when(
          data: (_data) {
            List<UserModel> userList = _data.map((e) => e).toList();
            return Column(
              children: [],
              // children: [
              //   Expanded(child: ListView.builder(itemBuilder: (_, index) {
              //     return Card(
              //       color: Colors.blue,
              //       elevation: 4,
              //       margin: const EdgeInsets.symmetric(vertical: 10),
              //       child: ListTile(
              //         title: Text(
              //           userList[index].firstName,
              //           style: const TextStyle(color: Colors.white),
              //         ),
              //         subtitle: Text(
              //           userList[index].lastName,
              //           style: const TextStyle(color: Colors.white),
              //         ),
              //       ),
              //     );
              //   }))
              // ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
