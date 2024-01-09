import 'package:flutter/material.dart';
import 'package:flutter_mvvm/features/user/view_model/user_view_model.dart';
import 'package:flutter_mvvm/resourses/color.dart';
import 'package:flutter_mvvm/resourses/font.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    var prov = Provider.of<UserViewModel>(context, listen: false);
    prov.checkAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        
        // child: Text("Splash Screen",style: Theme.of(context).textTheme.headlineLarge),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Welcome",style: RobotoFonts.bold(color: Colors.white,fontSize: 25),),
            Lottie.network("https://lottie.host/10fd3178-8894-43d1-a754-c206bcc9bcb7/7cSrDag5ml.json",height:height/6 ),
            Lottie.network("https://lottie.host/aae64dbb-e3a4-4aee-93d7-54647cb5bfd3/mf8532vY6w.json",),
          ],
        )
        
        
      ),
    );
  }
}
