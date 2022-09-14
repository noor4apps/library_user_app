import 'package:flutter/material.dart';
import 'package:library_user_app/utils/dimensions.dart';

class PopupMenuAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.person_outline),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        // MY ACCOUNT
        PopupMenuItem(child: Text('MY ACCOUNT')),
        // Divider
        PopupMenuDivider(),
        // Login
        PopupMenuItem(
          child: GestureDetector(
            child: Text('Login'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Title Login'),
                    ),
                    body: Center(
                      child: Text('This is the next page Login', style: TextStyle(fontSize: Dimensions.font24)),
                    ),
                  );
                },
              ));
            },
          ),
        ),
        // Register
        PopupMenuItem(
          child: GestureDetector(
            child: Text('Register'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Title Register'),
                    ),
                    body: Center(
                      child: Text('This is the next page Register', style: TextStyle(fontSize: Dimensions.font24)),
                    ),
                  );
                },
              ));
            },
          ),
        ),
      ],
    );
  }

}