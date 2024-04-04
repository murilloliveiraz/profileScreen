import 'dart:math';

import 'package:flutter/material.dart';
import 'package:profile_screen/controller/user_controller.dart';
import 'package:profile_screen/model/user_model.dart';
import 'package:profile_screen/ui/widgets/appBar.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({super.key, required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserController userController = UserController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final fotoController = TextEditingController();

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: MyAppBar(texto: 'Meu perfil'),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipOval(child: Image.network(widget.user.profilePicture, fit: BoxFit.cover,)),
                ),
                const SizedBox(height: 30),
                Row(children: [
                  const Text("Nome: "),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        hintText: widget.user.username, border: const OutlineInputBorder()),
                                    ),
                  ),
                ElevatedButton(
                onPressed: () {
                  String newUsername = usernameController.text;
                  userController.updateUsername(widget.user, newUsername);
                  setState(() {
                      widget.user.username = newUsername;
                    });
                },
                child: const Text('Atualizar Nome')),
                ]),
                const SizedBox(height: 30),
                Row(children: [
                  const Text("Senha: "),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: widget.user.password, border: const OutlineInputBorder()),
                                    ),
                  ),
                ElevatedButton(
                onPressed: () {
                  String newPassword = passwordController.text;
                  userController.updatePassword(widget.user, newPassword);
                  setState(() {
                      widget.user.password = newPassword;
                    });
                },
                child: const Text('Atualizar Senha')),
                ]),
                const SizedBox(height: 30),
                Row(children: [
                  const Text("Email: "),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: widget.user.email, border: const OutlineInputBorder()),
                                    ),
                  ),
                ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  userController.updateEmail(widget.user, email);
                  setState(() {
                      widget.user.email = email;
                    });
                },
                child: const Text('Atualizar Email')),
                ]),
                const SizedBox(height: 30),
                Row(children: [
                  const Text("Foto de Perfil: "),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                    controller: fotoController,
                    decoration: InputDecoration(
                        hintText: widget.user.profilePicture, border: const OutlineInputBorder()),
                                    ),
                  ),
                ElevatedButton(
                onPressed: () {
                  String fotoURL = fotoController.text;
                  userController.updatePassword(widget.user, fotoURL);
                  setState(() {
                      widget.user.profilePicture = fotoURL;
                    });
                },
                child: const Text('Atualizar foto')),
                ]),
                Text("Nome: ${widget.user.username}"),
                Text("Senha: ${widget.user.password}"),
                Text("Email: ${widget.user.email}"),
                Text("foto: ${widget.user.profilePicture}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}