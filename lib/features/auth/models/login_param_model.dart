// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginParam {
  const LoginParam({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }
}
