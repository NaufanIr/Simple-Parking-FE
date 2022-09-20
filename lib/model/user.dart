class LoginResponse {
  bool error;
  String message;
  User? result;

  LoginResponse({
    required this.error,
    required this.message,
    required this.result,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      error: json["error"],
      message: json["message"],
      result: User.fromJson(json['result']),
    );
  }
}

class User {
  String id;
  String? idParkir;
  String nama;
  String noTelp;
  String email;
  String password;
  String saldo;

  User({
    required this.id,
    required this.idParkir,
    required this.nama,
    required this.noTelp,
    required this.email,
    required this.password,
    required this.saldo,
  });
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      idParkir: json["id_parkir"],
      nama: json["nama"],
      noTelp: json["no_telp"],
      email: json["email"],
      password: json["password"],
      saldo: json["saldo"],
    );
  }
}