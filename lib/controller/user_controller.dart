import 'package:flutter/material.dart';
import 'package:profile_screen/database/user_database.dart';
import 'package:profile_screen/model/user_model.dart';
import 'package:profile_screen/model/userlogin_model.dart';
import 'package:profile_screen/ui/pages/profile_screen.dart';

class UserController {
  UserDatabase userDatabase = UserDatabase();

  void login(context, String nome, String password){
    var users = userDatabase.users;
    var result = users.where((user) => user.username == nome);
    User user = User(username: nome, password: password, email: 'email', profilePicture: '');
    if (result.isNotEmpty) {
      Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_)=> ProfileScreen(user: user)),
        (route) => false);
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Senha Inválida'),
        )
      );
    }
  }

  void cadastro(context, String nome, String password){
    var user = UserLogin(username: nome, password: password);
    var users = userDatabase.users;
    users.add(user);
    User userModel = User(username: nome, password: password, email: 'email', profilePicture: 'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=');
    Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (_)=> ProfileScreen(user: userModel,)),
      (route) => false);
  }

  void updatePassword(User user, String password){
    user.password = password;
  }
  
  void updateUsername(User user, String username){
    user.username = username;
  }
  
  void updateEmail(User user, String email){
    user.email = email;
  }
  
  void updateProfilePicture(User user, String url){
    user.profilePicture = url;
  }
}