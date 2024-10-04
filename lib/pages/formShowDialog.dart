import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Formshowdialog extends StatefulWidget {
  const Formshowdialog({super.key});

  @override
  State<Formshowdialog> createState() => _FormshowdialogState();
}

class _FormshowdialogState extends State<Formshowdialog> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.5),
        title: const Text('Form Show Dialog'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Form Show Dialog',
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          SizedBox(height: 20),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(
                  width: 2.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                FormDownload(context);
              },
              child: Text("Open Form",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))),
        ],
      )),
    );
  }

  Future<dynamic> FormDownload(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Form Show Dialog"),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            TextFormField(
              // keyboardType: TextInputType.emailAddress,
              controller:  emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "Enter Email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ]),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close")),
            ElevatedButton(onPressed: (){
              if(emailController.text == "" || emailController.text == null){
                Fluttertoast.showToast(
                    msg: "Please Enter Email",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.values[4],
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }else{
                Fluttertoast.showToast(
                    msg: "Email Saved : ${emailController.text}",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.values[4],
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
              print(emailController.text);
            }, child: Text("Download"))
          ],
        );
      },
    );
  }
}
