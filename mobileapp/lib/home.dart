import 'package:ScannerApp/Product.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
//import http package manually

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() {
    return _SearchBar();
  }
}

class _SearchBar extends State {
  bool? searching, error;
  @override
  void initState() {
    searching = false;
    error = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      leading: searching!
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  searching = false;
                  //set not searching on back button press
                });
              },
            )
          : IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    var result = res;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Product(search: result);
                      }),
                    );
                  }
                });
              }),
      //if searching is true then show arrow back else play arrow
      title: searching! ? searchField() : const Text("Producten"),
      actions: [
        IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                searching = true;
              });
            }), // search icon button

        //add more icons here
      ],
      backgroundColor: searching!
          ? const Color.fromRGBO(59, 66, 82, 1)
          : const Color.fromRGBO(59, 66, 82, 1),
      //if searching set background to orange, else set to deep orange
    ));
  }

  final SearchController = TextEditingController();

  Widget searchField() {
    //search input field
    return Container(
        child: TextField(
      autofocus: true,
      controller: SearchController,
      style: const TextStyle(color: Colors.white, fontSize: 18),
      decoration: const InputDecoration(
        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
        hintText: "Zoek voor een product",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ), //under line border, set OutlineInputBorder() for all side border
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ), // focused border color
      ), //decoration for search input field
      onSubmitted: (value) {
        //on submit of search text
        setState(() {
          searching = false;
          //set searching false on submit
        });
        var search = SearchController.text;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Product(search: search);
          }),
        );
        setState(() {
          searching = searching;
        });
      },
    ));
  }
}

//serarch suggestion data model to serialize JSON data
class SearchSuggestion {
  String id, name;
  SearchSuggestion({required this.id, required this.name});

  factory SearchSuggestion.fromJSON(Map<String, dynamic> json) {
    return SearchSuggestion(
      id: json["id"],
      name: json["name"],
    );
  }
}
