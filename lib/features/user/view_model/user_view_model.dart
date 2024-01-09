import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/features/user/model/user_model.dart';
import 'package:flutter_mvvm/utils/global.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    UserModel user = UserModel();
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");
    user.token = token;

    return user;
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }

  Future<void> checkAuthentication() async {
    await getUser().then((value) async {
      if (kDebugMode) {
        print(value.token.toString());
      }

      if (value.token == null || value.token == "") {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(navigatorKey.currentContext!, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(navigatorKey.currentContext!, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Navigator.pushNamed(navigatorKey.currentContext!, RoutesName.login);
        print(error.toString());
      }
    });
  }
}
