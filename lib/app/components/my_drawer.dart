import 'package:flutter/material.dart';
import 'package:todo_list/app/core/extensions/context_extension.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message_rounded,
                    size: 40,
                    color: context.primary,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.home_rounded,
                  ),
                  title: Text(
                    'H O M E',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.settings,
                  ),
                  title: const Text(
                    'S E T T I N G S',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text(
                'S I G N O U T',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
