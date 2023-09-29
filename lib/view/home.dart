import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widget_flutter_app/model/banners/banners.dart';
import 'package:widget_flutter_app/view_model/home/home_cubit.dart';
import 'package:shadow/shadow.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getBannersData(),
      child: SafeArea(
        child: Scaffold(
            drawer: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Drawer(
                  width: 200.w,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  shadowColor: Colors.black.withOpacity(0.4),
                  surfaceTintColor: Colors.amber,
                );
              },
            ),
            appBar: AppBar(
              actions: const [
                Icon(Icons.search),
              ],
            ),
            body: SingleChildScrollView(
              child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        builderWidget(
                            context.read<HomeCubit>().bannersList, context),
                      ],
                    );
                  }
                },
              ),
            )),
      ),
    );
  }
}

Widget builderWidget(List<BannersModel> bannersList, BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Shadow(
          options: const ShadowOptions(offset: Offset(0, 10), scale: 10),
          child: CarouselSlider(
            items: bannersList
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        e.image.toString(),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 250.h,
              initialPage: 0,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              //

              //
              pageSnapping: true,
              pauseAutoPlayInFiniteScroll: true,
              pauseAutoPlayOnTouch: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 2,
          children: List.generate(
            bannersList.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Image.network(
                            bannersList[index].image.toString(),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   homeModel.data!.products[index].description,
                            //   overflow: TextOverflow.ellipsis,
                            //   maxLines: 2,
                            // ),
                            // Row(
                            //   children: [
                            //     Text('\$${homeModel.data!.products[index].price}',
                            //         style: TextStyle(color: Colors.primary)),
                            //     const SizedBox(
                            //       width: 10,
                            //     ),
                            //     Text(
                            //       '\$${homeModel.data!.products[index].price}',
                            //       style: const TextStyle(
                            //           decoration: TextDecoration.lineThrough),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//
