class Login {
  final String? userId;

  Login({required this.userId});

  factory Login.fromJson(Map<String, dynamic> responseData) {
    return Login(
      userId: responseData['user_id'],
    );
  }
}
