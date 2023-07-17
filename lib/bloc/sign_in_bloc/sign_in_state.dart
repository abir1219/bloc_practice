class SignInState {
  String email;
  String password;
  bool passwordVisible;

  SignInState(
      {this.email = "", this.password = "", this.passwordVisible = false});

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
        email: email ?? this.email, password: password ?? this.password);
  }
}
