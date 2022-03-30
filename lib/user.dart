
import 'package:objectbox/objectbox.dart';

@Entity()
class User{

late int id;
String? email;
String? password;


User({required this.email, required this.password});

//metodo che da una mappa ,i genera un object
static User from_json(dynamic data){
  return User(password: data["name"],email: data["name"]);
}


}
