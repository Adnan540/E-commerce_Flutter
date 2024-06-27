class LoginModel {
  String email;
  String password;

  LoginModel({
    required this.email,
    required this.password
  });

  factory LoginModel.fromjson(Map<String,dynamic>json){
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

}