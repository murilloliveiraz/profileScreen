class UserLogin {
  String username;
  String password;

  UserLogin({required this.username, required this.password});

  @override
  String toString(){
    return "nome: $username";
  }
}