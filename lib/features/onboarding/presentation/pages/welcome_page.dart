import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/services/service_locator.dart';
import '../controller/onboarding_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF181711);

    final controller = sl<OnboardingController>();

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleIconButton(
                  icon: Icons.close,
                  onTap: controller.next,
                ),
                _circleIconButton(
                  icon: Icons.help_outline,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuAQjObi6zKTAKhq6-QzUHaoVsNFQL7jhcHhtKCXcSkEShlPLPGNVe03UMy_M_9U1AW5Mi2BV77KfHK8HcW_XiK20XehC1qmw5tpY8Xfyr1X29QQaCt-Znu_Pwe6CmiIO0Qzy4GSsWOiINqzZUI2yNIokLLsaem9A-03E8uXMD5FJsbsOGIp-QtuLeWs_j0TmMqppMqoIxzv8NPgggJtjUJ_UvxZ-w-ZkLWJ5abZbVPzjR6wzdzianVdbAEzIbUl7FNDhbO-ocssafoF',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Welcome to Habit Hero!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexend(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        height: 1.2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 12,
                      bottom: 16,
                    ),
                    child: Text(
                      'Track your habits and build better routines.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexend(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
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

  Widget _circleIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) =>
      InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 28, color: const Color(0xFF181711)),
        ),
      );
}
