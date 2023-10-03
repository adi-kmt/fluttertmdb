import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/ui/routing/router.dart';
import 'package:fluttertmdb/ui/utils/typography.dart';
import 'package:go_router/go_router.dart';

import '../../utils/colour_util.dart';
import 'bloc/check_auth_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  double _progress = 0.33;
  int _index = 0;

  List<String> titles = [
    "Get ready to BINGE",
    "the MULTIVERSE of",
    "your IMAGINATION"
  ];

  List<String> description = [
    "Find the best movies and TV shows to watch, all in one place.",
    "Entertainment is yours for the taking. Explore the latest movies and TV shows from all over the world.",
    "Find the perfect movie or TV show to watch, no matter what you're in the mood for."
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = CheckAuthCubit(getCurrentUserUsecase: get_it.getItInstance());

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<CheckAuthCubit, bool>(
        builder: (context, state) {
          if (state == true) {
            context.pushReplacementNamed(mainRoute);
            return const SnackBar(content: Text("User already logged in"));
          } else {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(alignment: Alignment.center, children: [
                  Column(
                    children: [
                      Text("The",
                          style: TypographyTmdb.appbarHeading
                              .copyWith(color: Colors.black)),
                      Text("TMDB",
                          style: TypographyTmdb.subHeading
                              .copyWith(color: Colors.white)),
                      Text("App",
                          style: TypographyTmdb.appbarHeading
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 2,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child:
                        Image.asset("images/onboarding.png", fit: BoxFit.cover),
                  ),
                ]),
                LinearProgressIndicator(
                  value: _progress,
                  minHeight: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 35.0, left: 15, right: 15),
                  child: Text(
                    titles[_index],
                    style: TypographyTmdb.subHeading.copyWith(
                        color: Colors.black, decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 55),
                  child: Text(description[_index],
                      textAlign: TextAlign.center,
                      style: TypographyTmdb.desc.copyWith(
                          color: Colors.black,
                          decoration: TextDecoration.none)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Visibility(
                    visible: _index != 2,
                    replacement: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context.goNamed(authRoute);
                        },
                        child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.arrow_forward_outlined),
                              Text("Login")
                            ]),
                      ),
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(ColourUtil.maroon),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15.0)))),
                        onPressed: () => {
                              setState(() {
                                _progress += 0.33;
                                _index++;
                              })
                            },
                        child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Icon(
                              Icons.navigate_next,
                              color: ColourUtil.textNormal,
                            ))),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
