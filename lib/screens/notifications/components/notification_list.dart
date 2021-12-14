// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:napples/screens/notifications/components/notification_item.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This Week',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          NotificationItem(
            title: 'Credit Information Change Notice',
            content:
                "Lorem ipsum dolor sit amet, legere periculis disputando vel in.",
            icon: Icons.mail_outline,
            date: '10th October 2021',
            key: PageStorageKey<String>("notification"),
          ),
          SizedBox(
            height: 20,
          ),
          NotificationItem(
            title: 'Credit Information Change Notice',
            content:
                "Lorem ipsum dolor sit amet, legere periculis disputando vel in.",
            icon: Icons.add_alert,
            date: '9th October 2021',
            key: PageStorageKey<String>("notification"),
          ),
          SizedBox(
            height: 20,
          ),
          NotificationItem(
            title: 'Credit Information Change Notice',
            content:
                "Lorem ipsum dolor sit amet, legere periculis disputando vel in.",
            icon: Icons.notifications_active_outlined,
            date: '8th October 2021',
            key: PageStorageKey<String>("notification"),
          ),
        ],
      ),
    );
  }
}
