import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UpdateUser {
  String id;
  String email;
  String firstName;
  String lastName;
  
  UpdateUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  // Method untuk update data user
  static Future<UpdateUser> updateData(
    String id,
    String email,
    String firstName,
    String lastName,
  ) async {
    Uri url = Uri.parse("https://reqres.in/api/users/$id");
    var response = await http.put(
      url,
      body: {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      },
    );
    
    var jsonData = jsonDecode(response.body);
    return UpdateUser(
      id: jsonData['id'].toString(),
      email: jsonData['email'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
    );
  }

  // Method untuk get data user by id
  static Future<UpdateUser> getUserById(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/$id");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    var data = jsonData["data"];
    
    return UpdateUser(
      id: data['id'].toString(),
      email: data['email'],
      firstName: data['first_name'],
      lastName: data['last_name'],
    );
  }
}



class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({Key? key}) : super(key: key);

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  void updateData() async {
    try {
      await UpdateUser.updateData(
        "2", // id user yang akan diupdate
        emailController.text,
        firstNameController.text,
        lastNameController.text,
      );
      
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update berhasil')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update gagal')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Load data user saat pertama kali
    loadUser();
  }

  void loadUser() async {
    try {
      final user = await UpdateUser.getUserById("2");
      setState(() {
        emailController.text = user.email;
        firstNameController.text = user.firstName;
        lastNameController.text = user.lastName;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal memuat data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateData,
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }
}