import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/animation.dart';
import '../controllers/nic_controller.dart';
import '../widgets/result_card.dart';

/// The result screen displaying the extracted NIC details.
/// This screen retrieves the decoded NIC details from the [NICController]
/// and presents them using a list of [ResultCard] widgets.
class ResultScreen extends StatefulWidget {
  /// Creates an instance of [ResultScreen].
  const ResultScreen({super.key});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  /// Controller for managing NIC details.
  final NICController controller = Get.find();

  late AnimationController _titleAnimationController;
  late AnimationController _buttonAnimationController;
  late AnimationController _cardAnimationController;
  late Animation<double> _titleAnimation;
  late Animation<double> _buttonAnimation;
  late Animation<double> _cardAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _titleAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _buttonAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _cardAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Title fade-in animation
    _titleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _titleAnimationController, curve: Curves.easeIn),
    );

    // Button scale animation
    _buttonAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
          parent: _buttonAnimationController, curve: Curves.easeOut),
    );

    // Card fade-in animation
    _cardAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _cardAnimationController, curve: Curves.easeOut),
    );

    // Start animations
    _titleAnimationController.forward();
    _buttonAnimationController.forward();
    _cardAnimationController.forward();
  }

  @override
  void dispose() {
    _titleAnimationController.dispose();
    _buttonAnimationController.dispose();
    _cardAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// ✅ Background Image with parallax effect
          Positioned.fill(
            child: MouseRegion(
              onEnter: (_) => setState(() {
                // Adding simple parallax effect by changing the background position on mouse hover
              }),
              child: Image.asset(
                "assetsbackground2.jpg", // Fixed file name
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          /// ✅ Content Section with animations
          SingleChildScrollView(
            // Enables scrolling for smaller screens
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Title of the result screen with fade-in animation
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: const Text(
                        "ID card Details",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.black38,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50), // Spacing below the title

                  /// List of result cards displaying NIC details with slide transition and fade-in effect
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.nicDetails.entries
                        .map(
                          (e) => FadeTransition(
                            opacity: _cardAnimation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.0, 0.5),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: _titleAnimationController,
                                  curve: Curves.easeOut,
                                ),
                              ),
                              child: ResultCard(
                                title: e.key,
                                value: e.value.toString(),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 50), // Spacing before the button

                  /// Button to navigate back to the input screen with scale animation
                  ScaleTransition(
                    scale: _buttonAnimation,
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadowColor: Colors.black45,
                        elevation: 10,
                      ),
                      child: const Text(
                        'RETURN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
