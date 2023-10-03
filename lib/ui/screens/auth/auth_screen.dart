import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/ui/routing/router.dart';
import 'package:fluttertmdb/ui/screens/auth/bloc/login_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../utils/typography.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit(loginUsecase: get_it.getItInstance());

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<LoginCubit, UIState>(
        builder: (context, state) {
          if (state is Initial) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height / 2,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0))),
                    child: const Image(
                        image: AssetImage("images/auth.png"),
                        fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Authentication",
                      style: TypographyTmdb.mainHeading.copyWith(
                          color: Colors.black, decoration: TextDecoration.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 35),
                    child: Material(
                        child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: emailController.clear,
                                    icon: Icon(Icons.close_rounded)),
                                border: OutlineInputBorder(),
                                hintText: 'Enter your email',
                                label: Text("Email"),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 35),
                    child: Material(
                        child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid password';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: passwordController.clear,
                                    icon: Icon(Icons.close_rounded)),
                                border: OutlineInputBorder(),
                                hintText: 'Enter your Password',
                                label: Text("Password"),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.login(
                                emailController.text, passwordController.text);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.close_fullscreen_sharp),
                              Text("Authenticate")
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            );
          } else if (state is Sucess) {
            context.pushReplacementNamed(mainRoute);
            return const Placeholder();
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final error = state is UiFailure
                ? state.exception.toString()
                : "No Items found";
            return SnackBar(content: Text("$error has occurred"));
          }
        },
      ),
    );
  }
}
