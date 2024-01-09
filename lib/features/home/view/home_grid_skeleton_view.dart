import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../widgets/app_chip.dart';

class HomeViewSkeletonGrid extends StatelessWidget {
  const HomeViewSkeletonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var  height= MediaQuery.of(context).size.height*1;
    var width=MediaQuery.of(context).size.width*1;
    return Skeletonizer(
      enabled: true,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children:
            List.generate(20, (index) {

              return InkWell(
                onTap: () {},
                child: Card(
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
                              height: height / 2.7,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.primaries[index % 10]
                                    .withOpacity(0.1),
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
                                child: Image(
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  image: const NetworkImage("item.image"),
                                  errorBuilder: (c,d,e){
                                    return const Center(child: Icon(Icons.error));
                                  },
                                ),
                              ),
                            ),

                             Positioned(
                              left: 5,
                              bottom: 5,
                              child: AppChip(
                                place: 'Ranking : ',
                                value: "some rank",
                              ),
                            ),
                             Positioned(
                              right: 5,
                              bottom: 5,
                              child: AppChip(
                                place: 'E : ',
                                value: "some E",
                              ),
                            ),
                             Positioned(
                              right: 5,
                              top: 5,
                              child: AppChip(
                                place: '',
                                value: "tv",
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: height / 12,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                            Colors.primaries[index % 10].withOpacity(0.1),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Some title",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}