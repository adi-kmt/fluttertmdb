import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: const Icon(Icons.account_tree),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Authentication",
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 35),
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
                      floatingLabelBehavior: FloatingLabelBehavior.always))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 35),
          child: Material(
              child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.close_outlined),
                      border: OutlineInputBorder(),
                      hintText: 'Enter your Password',
                      label: Text("Password"),
                      floatingLabelBehavior: FloatingLabelBehavior.always))),
        ),
        TextButton.icon(
          icon: const Icon(Icons.close_fullscreen_sharp),
          onPressed: () {},
          label: const Text("Authenticate"),
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(30),
              padding: MaterialStateProperty.all(const EdgeInsets.all(24))),
        ),
      ],
    );
  }
}
