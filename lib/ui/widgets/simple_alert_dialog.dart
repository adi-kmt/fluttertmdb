import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:go_router/go_router.dart';

import '../routing/router.dart';
import '../screens/settings/bloc/logout_cubit.dart';

class SimpleAlertDialog extends StatelessWidget {
  final Icon icon;
  final String title;
  final String content;

  const SimpleAlertDialog(
      {super.key,
      required this.icon,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    final cubit = LogoutCubit(logoutUserUsecase: get_it.getItInstance());

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<LogoutCubit, UIState>(
        builder: (context, state) {
          return AlertDialog(
            icon: icon,
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    cubit.logout();
                    context.pushReplacementNamed(authRoute);
                  },
                  child: const Text("Confirm")),
            ],
          );
        },
      ),
    );
    ;
  }
}
