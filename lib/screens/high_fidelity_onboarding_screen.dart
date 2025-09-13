import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityOnboardingScreen extends StatefulWidget {
  const HighFidelityOnboardingScreen({super.key});

  @override
  State<HighFidelityOnboardingScreen> createState() => _HighFidelityOnboardingScreenState();
}

class _HighFidelityOnboardingScreenState extends State<HighFidelityOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive values based on original Figma screen dimensions (375x812)
    final double imageHeightRatio = 536 / 812;
    final double bottomContentTopOffsetRatio = 452 / 812;
    final double horizontalPaddingRatio = 24 / 375;
    final double titleFontSizeRatio = 32 / 375;
    final double descriptionFontSizeRatio = 14 / 375;
    final double buttonFontSizeRatio = 16 / 375;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light, // White status bar icons
      child: Scaffold(
        backgroundColor: Colors.white, // Default base color for the screen
        body: Stack(
          children: [
            // 1. Background Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight * imageHeightRatio,
              child: Image.asset(
                'assets/images/I156_95_417_719.png', // Reconstructed path from image ID
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),

            // 2. Bottom Content Area with Gradient Overlay
            Positioned(
              top: screenHeight * bottomContentTopOffsetRatio,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0x00050505), // Transparent dark grey
                      const Color(0xFF050505), // Opaque dark grey
                    ],
                    stops: const [0.0, 0.2367], // Gradient stops from Figma
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * horizontalPaddingRatio),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, // Push content to the bottom
                    children: [
                      // Text: Fall in Love with Coffee in Blissful Delight!
                      Text(
                        'Fall in Love with Coffee in Blissful Delight!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                          fontSize: screenWidth * titleFontSizeRatio, // Responsive font size
                          fontWeight: FontWeight.w600, // SemiBold
                          color: Colors.white,
                          height: 1.5, // lineHeightPx: 48, fontSize: 32 => 48/32 = 1.5
                          letterSpacing: 0.16,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03), // Responsive spacing (approx 24px on 812 height)
                      // Text: Welcome to our cozy coffee corner...
                      Text(
                        'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                          fontSize: screenWidth * descriptionFontSizeRatio, // Responsive font size
                          fontWeight: FontWeight.w400, // Regular
                          color: const Color(0xFFA2A2A2), // Grey
                          height: 1.5, // lineHeightPx: 21, fontSize: 14 => 21/14 = 1.5
                          letterSpacing: 0.14,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05), // Responsive spacing (approx 40px on 812 height)

                      // Button: Get Started
                      SizedBox(
                        width: double.infinity,
                        height: 56, // Button height from Figma
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the home screen
                            context.go('/home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC67C4E), // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16), // cornerRadius from Figma
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16), // padding from Figma
                            elevation: 0,
                          ),
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.sora(
                              fontSize: screenWidth * buttonFontSizeRatio, // Responsive font size
                              fontWeight: FontWeight.w600, // SemiBold
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Provide padding for the system's home indicator safe area
                      SizedBox(height: MediaQuery.of(context).padding.bottom + 8), // 8px below the system safe area
                    ],
                  ),
                ),
              ),
            ),

            // 3. Home Indicator (bottom of screen)
            Positioned(
              bottom: 0, // Aligned to the very bottom
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: true, // Respect system bottom safe area
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8), // Position 8px above the safe area bottom
                    width: 134, // Width from Figma
                    height: 5, // Height from Figma
                    decoration: BoxDecoration(
                      color: const Color(0xFF242424), // Home Indicator color
                      borderRadius: BorderRadius.circular(100), // Highly rounded corners
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}