import 'package:untitled4/models/category_list_model.dart';
import 'package:untitled4/models/category_model.dart';


bool isApiProd = false;
String baseUrl = isApiProd ?'http://ec2-107-22-112-49.compute-1.amazonaws.com:5000/'  : 'http://192.168.1.95:5000/api';
