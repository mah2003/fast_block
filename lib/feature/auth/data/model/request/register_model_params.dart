class RegisterModelParams {
  String? gender;
  int? number;
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  RegisterModelParams({
    this.gender,
    this.number,
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        'number': number,
        'gender': gender,
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
}
