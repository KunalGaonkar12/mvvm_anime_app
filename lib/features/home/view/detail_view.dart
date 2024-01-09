import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../widgets/app_chip.dart';
import '../model/anime_list_model.dart';

class AnimeDetailView extends StatelessWidget {
  final Anime anime;

  AnimeDetailView({required this.anime, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        // margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.primaries[5 % 10].withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: anime.image,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: double.maxFinite,
                                child: CupertinoActivityIndicator(),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.08),
                                ),
                              ),
                            ),
                            imageBuilder: (context, imageProvider) {
                              return ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child:  Image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  width: width,
                                  height: height / 1.59,
                                ),
                              );
                            },
                            fit: BoxFit.cover,
                            height: height / 1.59,
                            width: width,
                          )),

                    ),
                    Container(
                      width: width,
                      height: height / 1.59,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, 1.00),
                          end: Alignment(0, -1),
                          colors: [Colors.black.withOpacity(0.4), Colors.black.withOpacity(0)],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 25,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const AppChip(
                          child: Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: AppChip(
                        place: 'Ranking : ',
                        value: anime.ranking.toString(),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: AppChip(
                        place: 'E : ',
                        value: anime.episodes.toString(),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 25,
                      child: AppChip(
                        place: '',
                        value: anime.type.toString(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  anime.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 30,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                _buildGener(anime.genres),
                const SizedBox(height: 20),
                const Text(
                  "Synopsis",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 30,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ReadMoreText(
                    anime.synopsis,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildGener(List<String> geners) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(
        geners.length,
        (index) => Card(
          color: Colors.primaries[index % 10].withOpacity(0.5),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            padding: const EdgeInsets.all(5),
            child: Text(
              geners[index],
              // style: AppStyle.bodyTextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
