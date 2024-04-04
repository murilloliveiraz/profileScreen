import 'package:flutter/material.dart';
import 'package:profile_screen/controller/user_controller.dart';
import 'package:profile_screen/ui/pages/cadastro.dart';
import 'package:profile_screen/ui/widgets/appBar.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
  UserController userController = UserController();
  final nomeController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(texto: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                  hintText: 'Usuário', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Senha', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  userController.login(context, nomeController.text, passwordController.text);
                },
                child: const Text('Entrar')),
            const Text('Não tem uma conta?'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (_)=> Cadastro()),
                  (route) => false);
                  },
                child: const Text('Cadastre-se')),
          ],
        ),
      ),
    );
  }
}