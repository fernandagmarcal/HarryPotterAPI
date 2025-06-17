import 'package:flutter/material.dart';
import '../ui/app_colors.dart';

class TelasAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TelasAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.azulEscuro,
      elevation: 0,
      centerTitle: true,
      title: Image.asset(
        'assets/images/universohp.png',
        height: 60,
        fit: BoxFit.contain,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}