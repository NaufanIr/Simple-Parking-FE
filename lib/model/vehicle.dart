class GetVehicleResponse {
  GetVehicleResponse({
    required this.error,
    required this.message,
    required this.result,
  });

  bool error;
  String message;
  List<Vehicle> result;

  factory GetVehicleResponse.fromJson(Map<String, dynamic> json) =>
      GetVehicleResponse(
        error: json["error"],
        message: json["message"],
        result: List<Vehicle>.from(
          json["result"].map(
            (x) => Vehicle.fromJson(x),
          ),
        ),
      );
}

class Vehicle {
  Vehicle({
    required this.id,
    required this.idUser,
    required this.merek,
    required this.model,
    required this.warna,
    required this.noPolisi,
    required this.jenis,
  });

  String id;
  String idUser;
  String merek;
  String model;
  String warna;
  String noPolisi;
  String jenis;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["id"],
        idUser: json["id_user"],
        merek: json["merek"],
        model: json["model"],
        warna: json["warna"],
        noPolisi: json["no_polisi"],
        jenis: json["jenis"],
      );
}
