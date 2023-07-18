class Login {
  final String status;
  final String message;
  Login({required this.status, required this.message});
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(status: json["status"] ?? "", message: json["message"] ?? "");
  }
}
