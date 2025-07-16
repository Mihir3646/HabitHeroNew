# Habit Hero 🦸‍♂️

**Habit Hero** is a privacy-first, minimalist habit tracker built with Flutter. All user data is stored locally on the device — no account or login required. The app offers optional cloud backups (via Google Drive or iCloud), making it simple, motivational, and fully in your control.

---

## ✨ Features

### ✅ Core Features
- **Onboarding**: 3-step introduction with privacy-first messaging.
- **Dashboard**: View habits as colorful tiles with icons, names, and streaks.
- **Habit Management**: Add, edit, delete, and archive habits.
- **Reminders**: One daily push reminder per habit.
- **Calendar View**: GitHub-style heat-map to track completions.
- **Analytics**: Stats on completions, streaks, and success rates.
- **Themes**: Light, dark, and high-contrast accessibility modes.
- **Data Portability**: Export/import data via CSV/JSON.
- **Cloud Backup (optional)**: Backup/restore to Google Drive or iCloud.
- **Accessibility**: Large fonts, high-contrast modes, and voice label support.

### 🚀 Advanced Features (Planned)
- Multiple completions per day
- Cross-device sync
- Home-screen widgets
- Habit templates (e.g., Miracle Morning)
- Voice Assistant / Siri Shortcuts
- Weekly reflections & mood tags
- Habit stacks & sub-tasks
- Custom dashboard layouts
- Streak-insurance logic
- Full accessibility pack (haptics, VoiceOver, dynamic type)

---

## 🧠 Design Principles

- **Minimalist UI**: Simple, uncluttered, focused on what matters.
- **Motivational UX**: Streaks, colors, and progress visuals.
- **Privacy First**: Offline-first by design. No login screens.
- **Accessibility Focused**: Designed with inclusivity in mind.

---

## 📱 Screens (Design & Wireframes)

Design mockups should include:
1. **Onboarding Slides**: Brand intro, privacy, key features.
2. **Main Dashboard**: Habit tiles with streaks & quick add button.
3. **Add/Edit Habit**: Form with name, color, icon, frequency, reminder.
4. **Habit Details**: Calendar view, streak summary, mark complete.
5. **Analytics**: Cards and charts showing usage stats.
6. **Archive View**: List of archived habits and restore option.
7. **Settings**: Theme toggles, data backup/import/export, help.
8. **Cloud Backup Modal**: Google Drive or iCloud interface.
9. **Accessibility Mode Preview**: High contrast & large font UI.

---

## 🛠 Tech Stack

- **Framework**: Flutter
- **State Management**: GetX
- **Local Storage**: SharedPreferences / Hive / SQLite
- **Reminders**: Flutter Local Notifications
- **Backup Integration**: Google Drive API / iCloud (Platform channels)
- **Charting**: fl_chart or similar

---

## 🔩 Project Structure

```plaintext
/lib
├── models/             # Habit, analytics, reminders
├── screens/            # UI pages (dashboard, settings, details)
├── widgets/            # Reusable components
├── services/           # Backup, notifications, storage
├── utils/              # Helpers, constants
├── main.dart           # App entry point
```

