class Login {
  final String? userId;

  Login({required this.userId});

  factory Login.fromJson(Map<String, dynamic> responseData) {
    return Login(
      userId: responseData['user_id'],
    );
  }
}

class Profile {
  final String id;
  final String mobile_no;
  final String first_name;
  final String last_name;
  final String gender;
  final String age;
  final String address;
  final String contact_no;
  final String status;

  Profile(
      {required this.id,
      required this.mobile_no,
      required this.first_name,
      required this.last_name,
      required this.gender,
      required this.age,
      required this.address,
      required this.contact_no,
      required this.status});

  factory Profile.fromJson(Map<String, dynamic> responseData) {
    return Profile(
      id: responseData['id'],
      mobile_no: responseData['mobile_no'],
      first_name: responseData['first_name'],
      last_name: responseData['last_name'],
      gender: responseData['gender'],
      age: responseData['age'],
      address: responseData['address'],
      contact_no: responseData['contact_no'],
      status: responseData['status'],
    );
  }
}
