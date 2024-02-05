import 'package:flutter/material.dart';

class TakeHomeTestAppBar extends StatelessWidget {
  const TakeHomeTestAppBar({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset('assets/icon.png'),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(title),
        ],
      ),
      centerTitle: true,
    );
  }
}
