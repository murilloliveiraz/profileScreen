class User {
  String username;
  String email;
  String profilePicture; 
  String password;

  User({required this.username, required this.password, required this.email, required this.profilePicture});

  @override
  String toString(){
    return "nome: $username";
  }
}