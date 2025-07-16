import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPage extends StatelessWidget {
  final VoidCallback onNext;

  const PrivacyPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    const bgYellow = Color(0xFFF7E240);
    const textColor = Color(0xFF181711);

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuAlbutnRLwgPlOurMBQRii6sTE45HQlb5XQhbamIDF4PmKF-HEet9I7NHLduE4CGiJ7r6FT0Xx8xRv-jjEzahO_d02hWnbz8jY9nduRs1R_hjAY2WCytLMhDSsr-S3beSC1SW_okmJ2WriMax8AfuGylN2ote5C2BCeppPwFk-J2-KHissOpsFOZnA4cisex8I85q0tcTr91eC3gb61RTtehOHkD1npwGhX5BiVibiAMCwryHo4GTXgBqqcZANKOO1D-nyGIv1oTuDM',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Privacy First',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexend(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
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
                      'Your data remains on your device. No accounts or tracking.',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgYellow,
                  foregroundColor: textColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                  textStyle: GoogleFonts.lexend(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                child: const Text(
                  'Next',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
