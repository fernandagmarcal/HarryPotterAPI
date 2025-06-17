import 'package:flutter/material.dart';
import 'package:hp_api/widgets/telas_app_bar.dart';
import '../ui/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  final String message;

  const LoadingScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: TelasAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.marromClaro),
                strokeWidth: 5,),
              const SizedBox(height: 24),
              Text(message, style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'InterRegular',
                  color: AppColors.brancoPadrao,
                  fontWeight: FontWeight.w800,),
                textAlign: TextAlign.center,),],),),),);
  }
}
