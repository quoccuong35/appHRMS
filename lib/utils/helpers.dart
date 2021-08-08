
import 'package:TTF/model/user.dart';
class Helpers{
   static final isDebug = true;
  // static final BASE_URL = "http://faceid.ttf.com.vn/";
   //static final BASE_DOMAIN = "faceid.ttf.com.vn";
   static final BASE_URL = "http://192.168.1.198:8034/";
   static final BASE_DOMAIN = "192.168.1.198:8034";
   static final LOGIN_URL = "token";
   static String API_TOKEN = "";
   static int successTime = 2, errorTime = 2,warningTime=2;
   static String title = "TTF HRMS";
   static User USER;
   static int selectedIndex = 2;
   static int endSelectedIndex = 4;
   static bool isLoading = true;
   static int timeOut = 30; // dơn vị tính là giây
   static int id = 0; //
}