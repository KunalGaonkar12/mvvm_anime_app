import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/utils.dart';
import 'package:flutter_mvvm/features/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/global.dart';
import '../../../utils/routes/routes_name.dart';
import '../repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final _myRepo = AuthRepository();
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(Map<dynamic, String> data) async {
    setLoading(true);
    var response = await _myRepo.login(data);

    response.fold((failure) => Utils.flushBarErrorMessage(failure.message),
        (loginResponse) async {
      final userPreference = Provider.of<UserViewModel>(
          navigatorKey.currentContext!,
          listen: false);
      userPreference.saveUser(loginResponse);

      Utils.snackBar('Login Successfully');
      Navigator.pushNamed(navigatorKey.currentContext!, RoutesName.home);
    });
    setLoading(false);
    notifyListeners();
  }

  Future<void> signUpApi(Map<dynamic, String> data) async {
    setLoading(true);
    var response = await _myRepo.registerApi(data);
    response.fold((failure) => Utils.flushBarErrorMessage(failure.message),
        (registerResponse) async {
      Utils.snackBar("SignUp Successful");
      Navigator.pushNamed(navigatorKey.currentContext!, RoutesName.login);
      clearData();
    });
    setLoading(false);

    notifyListeners();
  }

  Future<bool> validateForm() async {
    if (emailController.text.isEmpty) {
      Utils.flushBarErrorMessage("Please enter email");
      return false;
    } else if (passWordController.text.isEmpty) {
      Utils.flushBarErrorMessage("Please enter password");
      return false;
    } else if (passWordController.text.length < 7) {
      Utils.flushBarErrorMessage(
          "Please enter password more then 8 characters");
      return false;
    } else {
      return true;
    }
  }

  void disposeData() {
    obsecurePassword.dispose();
    passWordController.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  void clearData() {
    obsecurePassword.value = true;
    passWordController.clear();
    emailController.clear();
    notifyListeners();
  }
}
