import 'package:flutter/material.dart';
import 'package:soulence/main.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const AppAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColors.darkBrown,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

