import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../routes/routes.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize an AnimationController to manage the Lottie animation.
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // Dispose the AnimationController to free resources when it's no longer needed.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Use the Lottie.network widget to show an animation from a URL.
          Lottie.network(
            'https://assets1.lottiefiles.com/private_files/lf30_ipvphpwo.json',
            // Pass the controller to the Lottie animation to manage it.
            controller: _controller,
            // After the animation is loaded, start it and then navigate to the units reflection screen.
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().then((value) {
                  Navigator.of(context).pushNamed(RouteManager.unitsReflection);
                });
            },
          ),
          Center(
            child: Text(
              'UNITS APP',
              style: GoogleFonts.pacifico(
                fontSize: 25,
                fontWeight: FontWeight.w200,
                color: Colors.cyan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
