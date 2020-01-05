class Post {
  final String email;
  final String password;

  Post({this.email, this.password});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      email: json['email'],
      password: json['password'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}