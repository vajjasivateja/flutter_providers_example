import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class LoginAuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse("https://reqres.in/api/login"), body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        setLoading(false);
        print("successful");
      } else {
        setLoading(false);
        print("unsuccessful");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
