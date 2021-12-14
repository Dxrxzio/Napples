// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:napples/screens/notifications/components/notification_item.dart';

class OldNotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Previous Notice',
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
            icon: Icons.notifications_active_outlined,
            date: '8th October 2021',
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
            date: '2th October 2021',
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
            date: '1th October 2021',
            key: PageStorageKey<String>("notification"),
          ),
        ],
      ),
    );
  }
}
