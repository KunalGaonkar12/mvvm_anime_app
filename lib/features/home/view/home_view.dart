import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/features/home/view/detail_view.dart';
import 'package:flutter_mvvm/features/home/view/home_grid_skeleton_view.dart';
import 'package:flutter_mvvm/features/home/view_model/home_view_model.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/features/user/view_model/user_view_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../../data/response/enum/status.dart';
import '../../../resourses/color.dart';
import '../../../resourses/font.dart';
import '../../../widgets/anime_card.dart';
import '../../../widgets/multi_option_alert.dart';
import '../model/anime_list_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    var prov = Provider.of<HomeViewModel>(context, listen: false);
    prov.getAnimeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userSharedPreference =
        Provider.of<UserViewModel>(context, listen: false);

    return Consumer<HomeViewModel>(builder: (context, prov, _) {
      return Scaffold(
        appBar: _buildAppBar(userSharedPreference),
        body: _buildBody(prov),
      );
    });
  }

  _buildAppBar(UserViewModel prov) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primary,
        centerTitle: true,
        title: Text(
          "Anime",
          style: RobotoFonts.bold(fontSize: 25, color: AppColor.primaryLight),
        ),
        actions: [
          InkWell(
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return MultiOptionAlertDialog(
                          title: "Logout!",
                          content: "Do you want to logout?",
                          primaryActionText: "Yes",
                          secondaryActionText: "No",
                          onPressedPrimary: () {
                            prov.remove().then((value) {
                              Navigator.pushNamed(context, RoutesName.login);
                            });
                          },
                          onPressedSecondary: () {
                            Navigator.pop(context);
                          },
                        );
                      });
                },
                icon: const Icon(
                  Icons.power_settings_new,
                  color: AppColor.primaryLight,
                )),
          )
        ]);
  }

  _buildBody(HomeViewModel prov) {
    switch (prov.animeList.status) {
      case Status.LOADING:
        return const HomeViewSkeletonGrid();
      case Status.COMPLETE:
        return _buildAnimeGrid(prov.animeList.data!);
      case Status.ERROR:
        return Center(
          child: Text(prov.animeList.message.toString(),
              style:
                  RobotoFonts.medium(fontSize: 15, color: AppColor.darkGrey)),
        );
      default:
        return const Text('No Data');
    }
  }

  _buildAnimeGrid(AnimeListModel dataList) {
    final double height = MediaQuery.of(context).size.height * 1;
    final double width = MediaQuery.of(context).size.width * 1;

    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: List.generate(dataList.data.length, (index) {
            var item = dataList.data[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnimeDetailView(
                      anime: item,
                    ),
                  ),
                );
              },
              child: AnimeCard(anime: item,index: index),
            );
          }),
        ),
      ),
    );
  }
}
