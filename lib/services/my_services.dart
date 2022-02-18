 import 'dart:convert';
 import 'package:http/http.dart' as http;

 //import 'package:http/http.dart' as http;
 
 class MyService {
  static String apiURL = "http://192.168.0.34/";

  static String token = " ";

 //login servis
  static dynamic login(String username, String password) async {
    var client = http.Client();
    try {
      var response = await client.post(
        Uri.parse(apiURL + 'login/login.php'),
        body: {
          "username": username,
          "password": password,
        },
      ).timeout(const Duration(seconds: 10));

      var jresponse = json.decode(response.body);

      if (jresponse[0]['level'] == 'admin') {
        print(jresponse);
      }

      return jresponse;
    } catch (e) {
      return null;
    } finally {
      client.close();
    }
  }
//Register Verilerinin Servisi post etme
 static dynamic registerServis(
    String username,
    String usersurname,
    String email,
    String password,
    String section,
    String address,
    String phone,
    String birthday,
  ) async {
    var client = http.Client();
    try {
      var response = await client.post(
        Uri.parse(apiURL + 'login/register.php'),
        body: {
          'username': username,
          'usersurname': usersurname,
          'email': email,
          'password': password,
          'section': section,
          'address': address,
          'phone': phone,
          'birtday': birthday,
        },
      
      ).timeout(const Duration(seconds: 10));
      
      var jresponse = json.decode(response.body);

        if (jresponse[0]['username'] == 'Busra') {
        print(jresponse);
      }
        return jresponse;
    } catch (e) {
      return null;
    } finally {
      client.close();
    }
  }





 
 
 
 }

