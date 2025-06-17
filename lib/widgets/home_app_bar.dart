import 'package:flutter/material.dart';
import '../ui/app_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/universohp.png',
        height: 60,
        fit: BoxFit.contain,),
      centerTitle: true,
      backgroundColor: AppColors.azulEscuro,
      foregroundColor: AppColors.marromClaro,);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}