import 'package:flutter/material.dart';
import 'package:json_parshing/screens/Lec-8.2/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.account_circle_outlined),
        title: const Text('User Data'),
      ),
      body: ListView.builder(
        itemCount: userProvider.userList.length,
        itemBuilder: (context, index) => ListTile(
          leading: Text(userProvider.userList[index].id.toString()),
          title: Text(userProvider.userList[index].name),
          subtitle: Text(userProvider.userList[index].address.street),
          trailing: Text(userProvider.userList[index].address.geo.lat),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.javascript_sharp,
          size: 40,
        ),
      ),
    );
  }
}
