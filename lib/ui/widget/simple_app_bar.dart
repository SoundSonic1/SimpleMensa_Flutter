import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar(
      {super.key, required this.title, this.height, this.bottom});

  final String title;
  final PreferredSizeWidget? bottom;
  final double? height;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: _buildLeadingWidget(context),
        backgroundColor: const Color(0xff3b3b3b),
        titleSpacing: 12.0,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        bottom: bottom,
      );

  Widget _buildLeadingWidget(BuildContext context) {
    if (ModalRoute.of(context)?.isFirst == true) {
      return const IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: null,
      );
    }

    return BackButton(
      color: Colors.white,
      onPressed: () => Navigator.pop(context),
    );
  }
}
