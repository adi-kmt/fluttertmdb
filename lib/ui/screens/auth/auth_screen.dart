import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/ui/routing/router.dart';
import 'package:fluttertmdb/ui/screens/auth/bloc/login_cubit.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginUsecase: get_it.getItInstance()),
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
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0))),
                    child: Image(image: AssetImage("assets/images/auth.svg")),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Authentication",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 35),
                    child: Material(
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.close_outlined),
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid password';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.close_outlined),
                                border: OutlineInputBorder(),
                                hintText: 'Enter your Password',
                                label: Text("Password"),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always))),
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.deepPurple)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.close_fullscreen_sharp),
                          Text("Authenticate")
                        ],
                      )),
                ],
              ),
            );
          } else if (state is Sucess) {
            context.pushNamed(moviesListRoute);
            return const SnackBar(content: Text("Login succesful"));
          } else if (state is Loading) {
            return const CircularProgressIndicator();
          } else {
            final error = state is UiFailure
                ? state.exception.toString()
                : "No Items found";
            return Center(child: Text("$error has occurred"));
          }
        },
      ),
    );
  }
}
