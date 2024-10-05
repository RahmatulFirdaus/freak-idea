import 'package:flutter/material.dart';



class SearchablePageView extends StatefulWidget {
  @override
  _SearchablePageViewState createState() => _SearchablePageViewState();
}

class _SearchablePageViewState extends State<SearchablePageView> {
  final List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes'
  ]; // Data asli
  List<String> filteredItems = []; // Data yang difilter berdasarkan pencarian
  String searchQuery = ''; // Query pencarian

  @override
  void initState() {
    super.initState();
    // Saat inisialisasi, semua item ditampilkan
    filteredItems = items;
  }

  void filterSearchResults(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      if (query.isEmpty) {
        filteredItems = items; // Tampilkan semua item jika query kosong
      } else {
        filteredItems = items.where((item) {
          return item.toLowerCase().contains(searchQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Searchable PageView'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterSearchResults,
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Enter keyword",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blue[100 * (index % 9)],
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      filteredItems[index],
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
