class LoginAction {
  final String token;
  final String email;
  final String fullname;

  LoginAction({
    required this.token,
    required this.email,
    required this.fullname,
  });
}

class LogoutAction {}
