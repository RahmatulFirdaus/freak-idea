import 'package:flutter/material.dart';

class Dropdownbuttonpage extends StatefulWidget {
  const Dropdownbuttonpage({super.key});

  @override
  State<Dropdownbuttonpage> createState() => _DropdownbuttonpageState();
}

class _DropdownbuttonpageState extends State<Dropdownbuttonpage> {
  String? namaKota;
  var namaOrang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
                value: namaKota,
                hint: const Text("Tentukan Lokasi"),
                onChanged: (value) {
                  print(namaKota);
                  setState(() {
                    namaKota = value;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: "Banjarbaru",
                    child: Text("Banjarbaru"),
                  ),
                  DropdownMenuItem(
                    value: "Banjarmasin",
                    child: Text("Banjarmasin"),
                  )
                ],
              ),
              OutlinedButton(onPressed: (){
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: Text("$namaKota"),
                  );
                },);
              }, child: const Text("CLICK PLEASE")),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                height: 20,
                color: Colors.black,
              ),
              DropdownButton(
                value: namaOrang,
                hint: const Text("Tentukan Lokasi"),
                onChanged: (value) {
                  print(namaOrang);
                  setState(() {
                    namaOrang = value;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: "Delta",
                    child: Text("Palangkaraya"),
                  ),
                  DropdownMenuItem(
                    value: "Ellen",
                    child: Text("Banjarmasin"),
                  )
                ],
              ),
              OutlinedButton(onPressed: (){
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: Text("$namaOrang"),
                  );
                },);
              }, child: const Text("CLICK PLEASE"))
          ],
        ),
      )),
    );
  }
}
