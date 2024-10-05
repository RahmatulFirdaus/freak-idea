import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetSigita {
  String id, title, content, date, category, jumlah;

  GetSigita({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.category,
    required this.jumlah,
  });

  static Future<List<GetSigita>> connApi() async {
    Uri url = Uri.parse("Kepo");

    var hasilResponse = await http.get(url);

    if (hasilResponse.statusCode == 200) {
      var jsonData = jsonDecode(hasilResponse.body)["data"] as List;

      // Mengembalikan list data user
      return jsonData.map((user) {
        return GetSigita(
          id: user['id']?.toString() ?? "No ID", // Nilai default jika null
          title: user['judul'] ?? "No Title", // Nilai default jika null
          content: user['deskripsi'] ?? "No Description", // Nilai default jika null
          date: user['tanggal'] ?? "No Date",
          category: user['kategori'] ?? "No Category",
          jumlah: user['jmlh'] ?? "Empty",
        );
      }).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  List<GetSigita> dataRespon = [];
  List<GetSigita> filteredDataRespon = []; // List untuk hasil filter
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch data pada inisialisasi
    GetSigita.connApi().then((value) {
      setState(() {
        dataRespon = value;
        filteredDataRespon = value;
        debugPrint("Total dataRespon: ${dataRespon.length}");
        debugPrint("Total filteredDataRespon: ${filteredDataRespon.length}");
      });
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredDataRespon = dataRespon;
      });
    } else {
      setState(() {
        filteredDataRespon = dataRespon
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()) ||
                item.content.toLowerCase().contains(query.toLowerCase()) ||
                item.category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
    debugPrint("After filter, filteredDataRespon: ${filteredDataRespon.length}");
  }

  void resetSearch() {
    setState(() {
      searchController.clear();
      filteredDataRespon = dataRespon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navigasi(resetSearch: resetSearch),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.habarkalimantan.com/wp-content/uploads/2023/01/20230111_151037-scaled.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    // borderRadius: BorderRadius.circular(),
                    child: Image.network(
                      "https://yt3.googleusercontent.com/diS4obINjYTee0d4cP0eqWHaJPF1PCuCXINbrRCqjyKgX2EXsJpCF91dPTtvl8GawQpENOh_6g=s160-c-k-c0x00ffffff-no-rj",
                      width: 90,
                      height: 90,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SearchMenu(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: filteredDataRespon.isNotEmpty
                  ? LayoutBuilder(
                      builder: (context, constraints) {
                        return PageView.builder(
                          controller: PageController(viewportFraction: 0.95),
                          clipBehavior: Clip.none,
                          itemBuilder: (context, index) {
                            var data = filteredDataRespon[index];
                            debugPrint("Displaying data for index: $index, title: ${data.title}");
                            return buildPage(data, constraints);
                          },
                          itemCount: filteredDataRespon.length,
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        searchController.text.isEmpty
                            ? "Memuat data..."
                            : "Tidak ada hasil yang ditemukan",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: searchController.text.isEmpty
                                ? Colors.black
                                : Colors.red,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(GetSigita data, BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: constraints.maxWidth * 1,
      height: constraints.maxHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 10),
            blurRadius: 40,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.network(
                    "https://i.pinimg.com/736x/7e/dc/cc/7edccc1f8114706892272d16829c65a5.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                data.title.isEmpty ? "Data tidak ada" : data.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                data.content,
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                   
                  },
                  child: Text(
                    "Open for Details",
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Text(
                  "Tanggal : ${data.date}",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  "Kategori : ${data.category}",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  "Jumlah : ${data.jumlah}",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget SearchMenu() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 10.0,
        ),
      ]),
      child: TextField(
        controller: searchController, // Perbaiki controller di sini
        onChanged: (value) {
          debugPrint("Search value: $value");
          filterSearchResults(value);
        },
        decoration: InputDecoration(
          hintText: "Cari Disini",
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    resetSearch();
                  },
                )
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.filter_list),
                ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar Navigasi({required VoidCallback resetSearch}) {
    return AppBar(
      backgroundColor: const Color(0xFFCE9C80).withOpacity(0.7),
      title: Text(
        "Sigita",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(fontSize: 23, color: Colors.white),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            resetSearch();
          },
          icon: const Icon(Icons.refresh, color: Colors.white),
        ),
      ],
    );
  }
}
