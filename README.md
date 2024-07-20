# 8.1 What is JSON & JSON Parsing ?

## What is JSON?
- JSON stands for ```JavaScript Object Notation```
- ```JSON is a lightweight format for storing and transporting data```
- JSON is often used when data is sent from a server to a web page
- JSON is "self-describing" and easy to understand

### Example :
```
{
"employees": [
    {"firstName":"John", "lastName":"Doe"},
    {"firstName":"Anna", "lastName":"Smith"},
    {"firstName":"Peter", "lastName":"Jones"}
  ]
}
```

## How to Access Json Data Using Provider :

```bash
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../modal/photosmodal.dart';

class PhotosProvider extends ChangeNotifier{
  List<PhotosModal> photoList = [];

  Future<List> jsonParsing() async {
    String json = await rootBundle.loadString('assets/json/photos.json');
    List photo = jsonDecode(json);
    return photo;
  }

  Future<void> fromList() async {
    List photo = await jsonParsing();
    photoList = photo.map((e) => PhotosModal.fromMap(e),).toList();
    notifyListeners();
  }

  PhotosProvider(){
    fromList();
  }
}
```

### Modal Class

```bash
class PhotosModal {
  late int albumId, id;
  late String title, url, thumbnailUrl;

  PhotosModal(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory PhotosModal.fromMap(Map m1) {
    return PhotosModal(
      albumId: m1['albumId'],
      id: m1['id'],
      title: m1['title'],
      url: m1['url'],
      thumbnailUrl: m1['thumbnailUrl'],
    );
  }
}

```

### Show data on screen

```bash
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_screen_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var photosProvider = Provider.of<PhotosProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0.1,
        leading: const Icon(Icons.account_circle_outlined),
        title: const Text('JSON Parsing'),
      ),
      body: ListView.builder(
        itemCount: photosProvider.photoList.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              photosProvider.photoList[index].thumbnailUrl,
            ),
          ),
          title: Text(photosProvider.photoList[index].title),
          subtitle: Text(photosProvider.photoList[index].id.toString()),
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
```

<img src="https://github.com/user-attachments/assets/bcf6ffd0-ba11-4bc2-9d6a-18b4298f0ec5" height=65% width=22%>

<a href="https://github.com/Sahilk0809/json_parsing/tree/master/lib/screens/Lec-8.1"> Click here for the source code </a>

[jsonRecord.webm](https://github.com/user-attachments/assets/0542bda1-7dd2-4a80-a87b-0e10104d9e8b)

# 8.1.2 Json Parsing

### Modal class

```bash
import 'package:flutter/material.dart';

class UserModal {
  late int id;
  late String name, username, email, phone, website;
  late Address address;
  late Company company;

  UserModal({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory UserModal.fromJson(Map m1) {
    return UserModal(
      id: m1['id'],
      name: m1['name'],
      username: m1['username'],
      email: m1['email'],
      phone: m1['phone'],
      website: m1['website'],
      address: Address.fromJson(m1['address']),
      company: Company.fromJson(m1['company']),
    );
  }
}

class Address {
  late String street, suite, city, zipcode;
  late Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map m1) {
    return Address(
      street: m1['street'],
      suite: m1['suite'],
      city: m1['city'],
      zipcode: m1['zipcode'],
      geo: Geo.fromJson(m1['geo']),
    );
  }
}

class Geo {
  late String lat, lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map m1) {
    return Geo(lat: m1['lat'], lng: m1['lng']);
  }
}

class Company {
  late String name, catchPhrase, bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map m1) {
    return Company(
        name: m1['name'], catchPhrase: m1['catchPhrase'], bs: m1['bs']);
  }
}

```

### Provider

```bash
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_parshing/screens/Lec-8.2/modal/user_modal.dart';

class UserProvider extends ChangeNotifier {
  List<UserModal> userList = [];

  Future<void> jsonParsing() async {
    String json = await rootBundle.loadString('assets/json/user.json');
    List user = jsonDecode(json);
    userList = user.map((e) => UserModal.fromJson(e),).toList();
  }

  UserProvider() {
    jsonParsing();
  }
}

```

### Show data in screen

```bash
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
    );
  }
}

```

<img src="https://github.com/user-attachments/assets/a66f9005-1ce0-422b-b5f2-e78b107fe7c8" height=65% width=22%>

<a href="https://github.com/Sahilk0809/json_parsing/tree/master/lib/screens/Lec-8.2"> Click here for the source code </a>
