import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18, color: Colors.black);

  Widget _buildSuggestionList() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: Text('Aykut Asil'),
      trailing: new Icon(
        // Add the lines from here...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestionList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadData,
        child: Icon(Icons.add),
      ),
    );
  }

  _loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    debugPrint("response");
    /*
    setState(() {
      widgets = json.decode(response.body);
    });
    */
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> x = _saved.map((WordPair wordPair) {
            return ListTile(
              title: Text(wordPair.asPascalCase),
            );
          });

          final Iterable<Widget> listTilesWidget = ListTile.divideTiles(
            context: context,
            tiles: x,
          ).toList();

          return Scaffold(
              appBar: AppBar(
                title: Text("Favori List"),
              ),
              body: ListView(children: listTilesWidget));
        },
      ),
    );
  }
}
