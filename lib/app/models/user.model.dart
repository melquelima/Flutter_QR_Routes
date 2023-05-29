class User{
  int? id;
  String userName = "";

  User(this.id, this.userName);

  User.factory(){
    userName = "";
  }

   factory User.fromJson(dynamic json) {
    return User(json['id'] as int,json['username'] as String);
   }

}


class Auth{
  int? id;
  String? token = "";
  User user  = User.factory();

  Auth(this.token, this.user);
  Auth.empty(){}

  factory Auth.fromJson(dynamic json) {
    return Auth(json['token'] as String, User.fromJson(json['user']));
  }

}