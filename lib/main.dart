import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Genre? ddbValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Cinema"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Select the genre of the film: ",
                        style: TextStyle(fontSize: 17)),
                    GenreDropDown(
                        onChanged: (Genre newValue) =>
                            setState(() => ddbValue = newValue))
                  ],
                ),
                //Text where i would show the selected value of GenreDropDown
                Text("${ddbValue != null ? ddbValue.name : ""}")
              ],
            ),
          ),
        ));
  }
}

class Genre {
  final int id;
  final String name;

  Genre(this.id, this.name);
}

class GenreDropDown extends StatefulWidget {
  final VoidCallback? onChanged;
  GenreDropDown({required this.onChanged});

  @override
  GenreDropDownWidget createState() => GenreDropDownWidget();
}

class GenreDropDownWidget extends State<GenreDropDown> {
  final List<Genre> genreList = <Genre>[
    Genre(1, "Animation"),
    Genre(2, "Action"),
    Genre(3, "Adventure"),
    Genre(4, "Biography"),
    Genre(5, "Comedy"),
    Genre(6, "Crime"),
    Genre(7, "Documentary"),
    Genre(8, "Drama"),
    Genre(9, "Erotic"),
    Genre(10, "Family"),
    Genre(11, "Fantasy"),
    Genre(12, "Horror"),
    Genre(13, "History"),
    Genre(14, "Musical"),
    Genre(15, "Mystery"),
    Genre(16, "Philosophical"),
    Genre(17, "Political"),
    Genre(18, "Romance"),
    Genre(19, "Science Fiction"),
    Genre(20, "Sci-Fi"),
    Genre(21, "Social"),
    Genre(22, "Thriller"),
    Genre(23, "Urban"),
    Genre(24, "War"),
    Genre(25, "Western")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        DropdownButton<Genre>(
            disabledHint: Text("Disabilitated"),
            hint: Text("ex: Fantasy"),
            isExpanded: false,
            items: genreList.map<DropdownMenuItem<Genre>>((Genre item) {
              return DropdownMenuItem<Genre>(
                value: item,
                child: Text(item.name),
              );
            }).toList(),
            onChanged: widget.onChanged),
      ],
    );
  }
}
