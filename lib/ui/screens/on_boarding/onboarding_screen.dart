import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/ui/routing/router.dart';
import 'package:go_router/go_router.dart';

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
            context.pushNamed(mainRoute);
            return const SnackBar(content: Text("User already logged in"));
          } else {
            return Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 2,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Image.asset("assets/images/onboarding.svg"),
                ),
                LinearProgressIndicator(
                  value: _progress,
                  minHeight: 10,
                ),
                Text(
                  titles[_index],
                  style: const TextStyle(fontSize: 10),
                ),
                Text(description[_index], style: const TextStyle(fontSize: 10)),
                Visibility(
                  visible: _index != 2,
                  replacement: ElevatedButton(
                      onPressed: () {
                        context.goNamed(authRoute);
                      },
                      child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_forward_outlined),
                            Text("Login")
                          ])),
                  child: ElevatedButton(
                      onPressed: () => {
                            setState(() {
                              _progress += 0.33;
                              _index++;
                            })
                          },
                      child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.navigate_next))),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
