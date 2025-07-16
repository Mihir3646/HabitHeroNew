import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../theme_notifier.dart';

/// Page allowing the user to pick a theme when first opening the app.
class ThemeChoicePage extends StatelessWidget {
  final VoidCallback onComplete;

  const ThemeChoicePage({super.key, required this.onComplete});

  void _choose(BuildContext context, ThemeMode mode) {
    final notifier = context.read<ThemeNotifier>();
    notifier.setThemeMode(mode);
    notifier.completeOnboarding();
    onComplete();
  }

  @override
  Widget build(BuildContext context) {
    const bgYellow = Color(0xFFF7E240);
    const dotActive = Color(0xFF181711);
    const dotInactive = Color(0xFFE6E5DB);
    const textColor = Color(0xFF181711);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top bar with title centered
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  _circleIconButton(icon: Icons.help_outline, onTap: () {}),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Choose Your Theme',
                        style: GoogleFonts.lexend(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                  ),
                  // Invisible button to keep title centered
                  Opacity(
                    opacity: 0,
                    child:
                        _circleIconButton(icon: Icons.help_outline, onTap: () {}),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Image.network(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuCQUzDb4T16n0NxV3tCwFXBkdPua56BZ0a0ZrRrn4dIMTOGjXYvCKUrX2s6QZD5yeIZEurk9mqD201F9NytZYyVV2jFxiiDIobTTsyQfFtwJEi5QDvbRf6zzuZpKzbotF2hXLD_A9vPKwIyHQjO5kbW_zm2ZQN-_RBDCmIFxeW9Lo7KuwAve9PfXknpiKAKa5cT_Wo8YRt9nqdKJaWV8DqjfhYmMcKNtg7JR14S7p_VXxEB1IpBZMoYBS7aYxJKbK0-Z-Kajt9_KeUW',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Choose Your Theme',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lexend(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 12,
                        bottom: 8,
                      ),
                      child: Text(
                        'Pick light or dark mode to get started.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lexend(
                          color: textColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () => _choose(context, ThemeMode.light),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: bgYellow,
                                foregroundColor: textColor,
                              ),
                              child: const Text('Light Mode'),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () => _choose(context, ThemeMode.dark),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: bgYellow,
                                foregroundColor: textColor,
                              ),
                              child: const Text('Dark Mode'),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () => _choose(context, ThemeMode.system),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: bgYellow,
                                foregroundColor: textColor,
                              ),
                              child: const Text('System Default'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dot(false),
                        const SizedBox(width: 12),
                        _dot(false),
                        const SizedBox(width: 12),
                        _dot(true),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot(bool active) => Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: active ? const Color(0xFF181711) : const Color(0xFFE6E5DB),
          shape: BoxShape.circle,
        ),
      );

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
