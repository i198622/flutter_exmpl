class LoginRequestAction {
  LoginRequestAction({
    required this.email,
  });

  final String email;
}

class LoginSuccessAction {
  final bool hasAccess;

  LoginSuccessAction({
    required this.hasAccess,
  });
}

class LoginFailureAction {
  final String msg;

  LoginFailureAction({
    required this.msg,
  });
}

class LogoutRequestAction {
  const LogoutRequestAction();
}