import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/widgets/app_chip.dart';

import '../features/home/model/anime_list_model.dart';

class AnimeCard extends StatelessWidget {

  final Anime anime;
  final int index;
   AnimeCard({required this.anime,required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 1;
    final double width = MediaQuery.of(context).size.width * 1;

    return Card(
      child: Container(
        height: height / 2.2,
        // alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Colors.primaries[index % 10].withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                    Colors.primaries[index % 10].withOpacity(0.1),
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
                            (context, url, downloadProgress) =>
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width / 3,
                                height: double.maxFinite,
                                child: CupertinoActivityIndicator(),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.08),
                                ),
                              ),
                            ),
                        fit: BoxFit.cover,
                        height: height / 2.7,
                        width: width,
                      )),
                ),
                Container(
                  width: width,
                  height: height / 2.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 1.00),
                      end: Alignment(0, -1),
                      colors: [Colors.black.withOpacity(0.2), Colors.black.withOpacity(0)],
                    ),
                  ),
                ),
                Positioned(
                  left: 5,
                  bottom: 5,
                  child: AppChip(
                    place: 'Ranking : ',
                    value: anime.ranking.toString(),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: AppChip(
                    place: 'E : ',
                    value: anime.episodes.toString(),
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: AppChip(
                    place: '',
                    value: anime.type.toString(),
                  ),
                ),
              ],
            ),
            Container(
              height: height / 12,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.primaries[index % 10].withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              alignment: Alignment.center,
              child: Text(
                anime.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
