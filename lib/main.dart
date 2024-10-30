import 'package:flutter/material.dart';
import 'package:testing_project/pages/ExpansionTittle.dart';
import 'package:testing_project/pages/animatedText.dart';
import 'package:testing_project/pages/appBarGradiasi.dart';
import 'package:testing_project/pages/bodyGradiasi.dart';
import 'package:testing_project/pages/formShowDialog.dart';
import 'package:testing_project/pages/gradiantNavBody.dart';
import 'package:testing_project/pages/pageViewBuilder.dart';
import 'package:testing_project/pages/reqresListExecute.dart';
import 'package:testing_project/pages/searchMenu.dart';
import 'package:testing_project/pages/sigita/dashboardSigitaExecute.dart';
import 'package:testing_project/pages/sigita/komentarDecoration.dart';
import 'package:testing_project/pages/sigita/urlLauncher.dart';
import 'package:testing_project/pages/sigitaExecute.dart';
import 'package:testing_project/pages/splashScreen.dart';
import 'package:testing_project/pages/sigitaExecuteDrawer.dart';
import 'package:testing_project/pages/drawExecute.dart';
import 'package:testing_project/pages/update_sigita/update.dart';
import 'package:testing_project/pages/upload_file/upload_file.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadFilePage(),
    );
  }
}