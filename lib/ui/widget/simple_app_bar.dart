import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: _buildLeadingWidget(context),
        backgroundColor: Colors.black,
        titleSpacing: 12.0,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
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
