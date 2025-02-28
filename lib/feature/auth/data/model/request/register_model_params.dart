class RegisterModelParams {
  String? gender;
  String? nationalId;
  String? phone;
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? country;

  RegisterModelParams({
    this.gender,
    this.nationalId,
    this.phone,
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.country,
  });

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'gender': gender,
        'userName': name,
        'email': email,
        'password': password,
        'cPassword': passwordConfirmation,
        'country': country,
        'nationalID': nationalId
      };
}
