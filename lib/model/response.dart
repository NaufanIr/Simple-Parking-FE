class Response<T> {
  bool error;
  String message;
  T? result;

  Response({required this.error, required this.message, this.result});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      error: json["error"],
      message: json["message"],
      result: json["result"],
    );
  }
}


// class Response {
//   bool error;
//   String message;

//   Response({required this.error, required this.message});

//   factory Response.fromJson(Map<String, dynamic> json) {
//     return Response(
//       error: json["error"],
//       message: json["message"]
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "error": error,
//       "message": message,
//     };
//   }
// }