import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? image;
  final VoidCallback? onPressed;
  CustomButton({this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GestureDetector(
      onTap: onPressed,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          height: isLandScape ? height : 200,
          width: isLandScape ? width * 0.47 : width * 0.44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: AssetImage(image!),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}