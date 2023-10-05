class FlickmemoUser {
  final String internalID;
  final Map<String, String> token;
  final String firstName;
  final String lastName;
  final String email;
  final String photoURL;

  const FlickmemoUser(
      {required this.internalID,
      required this.token,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.photoURL});

  factory FlickmemoUser.fromJson(Map<String, dynamic> json) {
    return FlickmemoUser(
      internalID: json['internal_id'].toString(),
      token: {
        "uuid": json['token']['uuid'],
        "token": json['token']['token'],
      },
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      photoURL: json['photo_url'],
    );
  }
}
