import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class VideoBackgroundImage extends StatefulWidget {

  @override
  State<VideoBackgroundImage> createState() => _VideoBackgroundImageState();
}

class _VideoBackgroundImageState extends State<VideoBackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) =>
          const LinearGradient(
            begin: Alignment.bottomCenter, end: Alignment.center, colors: [
            Colors.black,
            Colors.transparent],
          ).createShader(rect),
      blendMode: BlendMode.darken,
      child: Image.network("https://lottiefiles.com/75705-welcome-animation",fit: BoxFit.fill

      )



    );
  }
}


