import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_flutter_app/classes/navigation/app_navigation.dart';
import 'package:widget_flutter_app/model/banners/banners.dart';
import 'package:widget_flutter_app/view/add_name_library_view/new_library_name.dart';
import 'package:widget_flutter_app/view_model/get_name_library/states.dart';
import 'package:widget_flutter_app/view_model/home/cubit.dart';
import 'package:shadow/shadow.dart';
import 'package:widget_flutter_app/widget/home_widget.dart';

import '../../view_model/get_name_library/cubit.dart';
import '../../view_model/home/states.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

TextEditingController newWidgetController = TextEditingController();

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit()..getBannersData(),
          ),
          BlocProvider(
            create: (context) => GetNameLibraryCubit()..getName(),
          ),
        ],
        child: SafeArea(
            child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Lottie.asset('assets/home.json'),
              ),
            ),
            Scaffold(
                backgroundColor: Colors.black.withOpacity(0.4),
                drawer: BlocConsumer<GetNameLibraryCubit, GetNameLibraryState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Drawer(
                      width: 180.w,
                      backgroundColor: Colors.black.withOpacity(0.4),
                      shadowColor: Colors.black.withOpacity(0.4),
                      surfaceTintColor: Colors.amber,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Lottie.asset(
                              'assets/header_logo.json',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            ListTile(
                                trailing: InkWell(
                              onTap: () {
                                AppNavigation().animatedNavigatoin(
                                    context, const AddNameLibraryView());
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )),
                            SizedBox(
                              height: 500,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {},
                                    trailing: Icon(Icons.arrow_forward_ios,
                                        color: Colors.white.withOpacity(0.8)),
                                    title: Text(
                                      context
                                          .read<GetNameLibraryCubit>()
                                          .nameLibrarys[index]
                                          .type
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  );
                                },
                                itemCount: context
                                    .read<GetNameLibraryCubit>()
                                    .nameLibrarys
                                    .length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                appBar: AppBar(
                  actions: const [
                    Icon(Icons.search),
                  ],
                ),
                body: builderWidget(context)),
          ],
        )));
  }
}

Widget builderWidget(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 2,
          children: [
            CustemHomeWidget(
              lable: 'Profile',
              icon: Icons.person,
              onTap: () {},
            ),
            CustemHomeWidget(
              lable: 'Favorite',
              icon: Icons.favorite,
              onTap: () {},
            ),
            CustemHomeWidget(
              lable: 'Setting',
              icon: Icons.settings,
              onTap: () {},
            ),
            CustemHomeWidget(
              lable: 'About us',
              icon: Icons.info,
              onTap: () {},
            ),
            CustemHomeWidget(
              lable: 'Support',
              icon: Icons.support_agent,
              onTap: () {},
            ),
            CustemHomeWidget(
              lable: 'Log out',
              icon: Icons.logout,
              onTap: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
