import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("notification"));
  }
}
