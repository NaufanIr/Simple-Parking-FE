import 'package:flutter/material.dart';
import '../colors_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: ColorsTheme.myOrange),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Sedang Memuat..."),
          ),
        ],
      ),
    );
  }
}