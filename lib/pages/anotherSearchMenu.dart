// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class PageViewWithSearch extends StatefulWidget {
//   final List<DataRespon> dataRespon;

//   const PageViewWithSearch({Key? key, required this.dataRespon}) : super(key: key);

//   @override
//   _PageViewWithSearchState createState() => _PageViewWithSearchState();
// }

// class _PageViewWithSearchState extends State<PageViewWithSearch> {
//   late List<DataRespon> filteredData;
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     filteredData = widget.dataRespon;
//   }

//   void _filterData(String query) {
//     setState(() {
//       filteredData = widget.dataRespon
//           .where((item) =>
//               item.title.toLowerCase().contains(query.toLowerCase()) ||
//               item.content.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             controller: _searchController,
//             decoration: InputDecoration(
//               hintText: 'Search...',
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//             onChanged: _filterData,
//           ),
//         ),
//         Expanded(
//           child: filteredData.isNotEmpty
//               ? PageView.builder(
//                   controller: PageController(viewportFraction: 0.95),
//                   itemCount: filteredData.length,
//                   itemBuilder: (context, index) {
//                     return buildCard(filteredData[index]);
//                   },
//                 )
//               : Center(child: Text('No results found')),
//         ),
//       ],
//     );
//   }

//   Widget buildCard(DataRespon data) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             offset: const Offset(0, 10),
//             blurRadius: 40,
//           ),
//         ],
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(150),
//                 child: SizedBox(
//                   width: 200,
//                   height: 200,
//                   child: Image.network(
//                     "https://i.pinimg.com/736x/7e/dc/cc/7edccc1f8114706892272d16829c65a5.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 data.title ?? "Data tidak ada",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(
//                   textStyle: const TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Text(
//                 data.content,
//                 textAlign: TextAlign.justify,
//                 style: GoogleFonts.poppins(
//                   textStyle: const TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PageProposal(id: data.id),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "Open for Details",
//                     style: GoogleFonts.poppins(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               "Tanggal : ${data.date}",
//               style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16)),
//             ),
//             Text(
//               "Kategori : ${data.category}",
//               style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16)),
//             ),
//             Text(
//               "Jumlah : ${data.jumlah}",
//               style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16)),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }