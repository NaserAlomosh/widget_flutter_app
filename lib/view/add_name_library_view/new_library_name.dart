import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_flutter_app/classes/navigation/app_navigation.dart';
import 'package:widget_flutter_app/view/home/home.dart';
import 'package:widget_flutter_app/view_model/add_name_library/cubit.dart';
import 'package:widget_flutter_app/view_model/add_name_library/states.dart';
import 'package:widget_flutter_app/widget/text_fiald_add_new.dart';

class AddNameLibraryView extends StatefulWidget {
  const AddNameLibraryView({super.key});

  @override
  State<AddNameLibraryView> createState() => _AddNameLibraryViewState();
}

class _AddNameLibraryViewState extends State<AddNameLibraryView> {
  TextEditingController nameLibraryController = TextEditingController();
  TextEditingController confirmNameLibraryController = TextEditingController();
  TextEditingController adminPasswordLibraryController =
      TextEditingController();
  @override
  void dispose() {
    nameLibraryController.dispose();
    confirmNameLibraryController.dispose();
    adminPasswordLibraryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child:
                  Lottie.asset('assets/add_new.json', height: double.infinity),
            ),
          ),
          BlocProvider(
            create: (context) => AddNameLibraryCubit(),
            child: Scaffold(
              backgroundColor: Colors.black.withOpacity(0.85),
              body: BlocConsumer<AddNameLibraryCubit, AddNameLibraryState>(
                listener: (context, state) {
                  if (state is AddNameSucssesState) {
                    AppNavigation()
                        .animatedNavigatoin(context, const HomeView());
                  }
                  //else if() {}
                },
                builder: (context, state) {
                  if (state is AddNameLoadingState) {
                    return Center(
                      child: Lottie.asset('assets/loading.json'),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddTextFiald(
                          controller: nameLibraryController,
                          hintText: 'enter type name',
                        ),
                        SizedBox(height: 10.h),
                        AddTextFiald(
                          controller: confirmNameLibraryController,
                          hintText: 'confirm type name',
                        ),
                        SizedBox(height: 10.h),
                        AddTextFiald(
                          controller: adminPasswordLibraryController,
                          hintText: 'enter admin password',
                          obscureText: true,
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10.w)),
                            child: TextButton(
                              onPressed: () async {
                                await context
                                    .read<AddNameLibraryCubit>()
                                    .addName(
                                        type: nameLibraryController.text,
                                        confirmtype:
                                            confirmNameLibraryController.text,
                                        adminPassword:
                                            adminPasswordLibraryController
                                                .text);
                              },
                              child: Text(
                                'Create',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
