class Response {
  bool error;
  String message;

  Response({required this.error, required this.message});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      error: json["error"],
      message: json["message"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "message": message,
    };
  }
}