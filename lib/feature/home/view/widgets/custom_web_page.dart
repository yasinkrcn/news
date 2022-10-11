import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWebPage extends StatelessWidget {
  final Widget body;

  const CustomWebPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [body, _buildShortAppBar(context)],
        ),
      ),
    );
  }

  Widget _buildShortAppBar(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // const Padding(
          //   padding: EdgeInsets.only(right: 16.0),
          //   child: Text(
          //     'Back',
          //     style: TextStyle(fontSize: 16),
          //   ),
          // ),
        ],
      ),
    );
  }
}
