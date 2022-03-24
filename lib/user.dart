
import 'package:objectbox/objectbox.dart';

@Entity()
class User{

late int id;
String? email;
String? password;

User({required this.email, required this.password});

}
