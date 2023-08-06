import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/movie_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: Text("Johny\'s List ${_myList.length}"),
        backgroundColor: Colors.purple,
        centerTitle: true,
        actions: [
          Container(
            width: 30,
            height: 30,
            child: Image.asset(
              'assets/ProfilePic.png',
            ),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: ListView.builder(
        itemCount: _myList.length,
        itemBuilder: (context, index) {
          final currrentMovie = _myList[index];
          return Card(
            color: Colors.orange,
            key: ValueKey(currrentMovie.title),
            elevation: 4,
            child: ListTile(
              title: Text(currrentMovie.title),
              subtitle: Text(currrentMovie.duration ?? ''),
              trailing: TextButton(
                child: Text(
                  'Remove',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
                ),
                onPressed: () {
                  context.read<MovieProvider>().removeFromList(currrentMovie);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
