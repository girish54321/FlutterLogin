class NewAccount {
  int id;
  String token;

  NewAccount({
    this.id,
    this.token,
  });

  factory NewAccount.fromJson(Map<String, dynamic> json) => NewAccount(
    id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
  };
}
