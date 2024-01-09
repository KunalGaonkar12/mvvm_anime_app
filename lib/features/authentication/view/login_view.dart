import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resourses/color.dart';
import 'package:flutter_mvvm/resourses/font.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';
import 'package:flutter_mvvm/features/authentication/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../../widgets/app_text_field.dart';
import '../../../widgets/round_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    var prov = Provider.of<AuthViewModel>(context, listen: false);
    prov.disposeData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Consumer<AuthViewModel>(builder: (context, prov, _) {
      return Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .04),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: height / 15),
                        Image.asset("assets/images/app_logo.png",
                            height: height / 9),
                        SizedBox(height: height / 15),
                        AppTextFiled(
                          hintText: "Email",
                          labelText: "Email",
                          controller: prov.emailController,
                          focusNode: prov.emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            Utils.filedFocusChange(
                                prov.emailFocusNode, prov.passwordFocusNode);
                          },
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        ValueListenableBuilder(
                            valueListenable: prov.obsecurePassword,
                            builder: (context, value, child) {
                              return AppTextFiled(
                                  controller: prov.passWordController,
                                  focusNode: prov.passwordFocusNode,
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        prov.obsecurePassword.value =
                                            !prov.obsecurePassword.value;
                                      },
                                      child: Icon(prov.obsecurePassword.value
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  obsecureText: prov.obsecurePassword.value,
                                  hintText: "Password",
                                  labelText: "Password");
                            }),
                        SizedBox(
                          height: height * .1,
                        ),
                        AppButton(
                            title: "Login",
                            loading: prov.loading,
                            onPress: () {
                              prov.validateForm().then((value) {
                                if (value) {
                                  Map<dynamic, String> data = {
                                    "email": prov.emailController.text,
                                    "password": prov.passWordController.text
                                  };

                                  // Map<dynamic, String> data = {
                                  //   "email": "eve.holt@reqres.in",
                                  //   "password": "adadadadadadadadadad"
                                  // };
                                  prov.loginApi(data);
                                }
                              });
                            }),
                        SizedBox(
                          height: height * .01,
                        ),
                        TextButton(
                            onPressed: () {
                              var prov = Provider.of<AuthViewModel>(context,
                                  listen: false);
                              prov.clearData();
                              Navigator.pushNamed(context, RoutesName.signUp);
                            },
                            child: Text(
                              "Dont have an account? Sign Up.",
                              style: RobotoFonts.medium(fontSize: 15),
                            ))
                      ],
                    ),
                  ))));
    });
  }

  _buildAppBar() {
    return AppBar(
      title: Text("Login",
          style: RobotoFonts.bold(fontSize: 25, color: AppColor.primaryLight)),
      centerTitle: true,
      backgroundColor: AppColor.primary,
      automaticallyImplyLeading: false,
    );
  }
}
