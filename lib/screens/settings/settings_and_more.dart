// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:napples/screens/settings/components/items.dart';

import 'components/settings_bar.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            constraints: BoxConstraints(
              maxWidth: 632,
            ),
            child: CustomScrollView(
              key: PageStorageKey<String>("settings and more"),
              slivers: [
                SliverAppBar(
                  titleSpacing: 10,
                  elevation: 0,
                  pinned: true,
                  backgroundColor: Colors.white,
                  title: SettingsAppBar(),
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      Items(
                        text: "My Account",
                        key: PageStorageKey<String>("settings and more"),
                      ),
                      Items(
                        text: "My Credit Information",
                        key: PageStorageKey<String>("settings and more"),
                      ),
                      Divider(
                        height: 20,
                      ),
                      Items(
                        text: "Card Type",
                        key: PageStorageKey<String>("settings and more"),
                      ),
                      Items(
                        text: "Annual Fee",
                        key: PageStorageKey<String>("settings and more"),
                      ),
                      Items(
                        text: "Banking Fees",
                        key: PageStorageKey<String>("settings and more"),
                      ),
                      Items(
                        text: "Bill Payment",
                        key: PageStorageKey<String>("settings and more"),
                      ),
                      Items(
                        text: "Log Out",
                        key: PageStorageKey<String>("settings and more"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
