import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Import AnimatedTextKit
import '../controllers/nic_controller.dart';
import '../widgets/nic_input_field.dart';

/// The main input screen of the NIC Details Extractor application.
/// This screen provides an input field for entering a NIC number,
/// buttons for extracting/resetting details.
class InputScreen extends StatefulWidget {
  /// Creates an instance of [InputScreen].
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen>
    with TickerProviderStateMixin {
  /// Controller for managing NIC input and extraction logic.
  final NICController controller = Get.find();

  late AnimationController _titleAnimationController;
  late Animation<double> _titleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for title
    _titleAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Create a tween to animate the vertical movement
    _titleAnimation = Tween<double>(begin: 0.0, end: -50.0).animate(
      CurvedAnimation(
        parent: _titleAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _titleAnimationController.forward();
  }

  @override
  void dispose() {
    _titleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("bgimage.jpg"), // Set your image path
            fit: BoxFit.cover, // ✅ Covers the entire screen
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),

                    /// Floating title animation
                    AnimatedBuilder(
                      animation: _titleAnimationController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0.0, _titleAnimation.value),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                FadeAnimatedText(
                                  'National ID card decoder',
                                  textStyle: const TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 159, 169, 181),
                                  ),
                                  duration: const Duration(
                                      seconds: 3), // Fade duration
                                ),
                              ],
                              isRepeatingAnimation:
                                  false, // Disable repeating the animation
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 50),

                    /// NIC input field
                    NICInputField(controller: controller),
                    const SizedBox(height: 30),

                    /// ✅ Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: controller.decodeNIC,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 11, 93, 125),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "GENERATE",
                            style: TextStyle(
                              color: Color.fromARGB(255, 248, 248, 253),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: controller.resetNIC,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 130, 15, 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "CLEAR",
                            style: TextStyle(
                              color: Color.fromARGB(255, 249, 249, 252),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
