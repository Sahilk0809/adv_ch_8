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

# Part-2

<img src="https://github.com/user-attachments/assets/a66f9005-1ce0-422b-b5f2-e78b107fe7c8" height=65% width=22%>

<a href="https://github.com/Sahilk0809/json_parsing/tree/master/lib/screens/Lec-8.2"> Click here for the source code </a>
