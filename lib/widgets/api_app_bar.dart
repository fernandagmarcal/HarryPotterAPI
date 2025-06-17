import 'package:flutter/material.dart';
import '../scenes/timeline_screen/timeline_screen.dart';
import '../ui/app_colors.dart';

class ApiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ApiAppBar({super.key});

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
      actions: [
        IconButton(
          icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TimelineScreen()),);},
        ),
      ],
    );
}
  //
  // @override
  // // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
