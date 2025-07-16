import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:get/get.dart';
import '../../data/habit_model.dart';
import '../../controllers/habit_controller.dart';

class HabitFormPage extends StatefulWidget {
  const HabitFormPage({Key? key, required this.controller, this.habit}) : super(key: key);

  final HabitController controller;
  final Habit? habit;

  @override
  State<HabitFormPage> createState() => _HabitFormPageState();
}

class _HabitFormPageState extends State<HabitFormPage> {
  late TextEditingController _nameController;
  Color _selectedColor = Colors.blue;
  IconData _selectedIcon = Icons.star;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.habit?.name ?? '');
    _selectedColor = widget.habit?.color ?? Colors.blue;
    _selectedIcon = widget.habit?.icon ?? Icons.star;
  }

  void _pickIcon() async {
    final icons = const [
      Symbols.star,
      Symbols.favorite,
      Symbols.flag,
      Symbols.run_circle,
    ];
    IconData? result = await showDialog<IconData>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick Icon'),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: icons.length,
              itemBuilder: (context, index) => IconButton(
                icon: Icon(icons[index]),
                onPressed: () => Navigator.pop(context, icons[index]),
              ),
            ),
          ),
        );
      },
    );
    if (result != null) {
      setState(() => _selectedIcon = result);
    }
  }

  void _pickColor() async {
    Color tempColor = _selectedColor;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: tempColor,
              onColorChanged: (color) => tempColor = color,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, tempColor),
              child: const Text('Select'),
            ),
          ],
        );
      },
    );
    setState(() => _selectedColor = tempColor);
  }

  void _save() {
    if (_nameController.text.trim().isEmpty) return;
    final habit = Habit(
      id: widget.habit?.id ?? DateTime.now().millisecondsSinceEpoch,
      name: _nameController.text.trim(),
      icon: _selectedIcon,
      color: _selectedColor,
    );
    if (widget.habit == null) {
      widget.controller.addHabit(habit);
    } else {
      widget.controller.updateHabit(habit);
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.habit == null ? 'Add Habit' : 'Edit Habit')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Habit Name'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                TextButton(
                  onPressed: _pickIcon,
                  child: const Text('Pick Icon'),
                ),
                const SizedBox(width: 16),
                Icon(_selectedIcon, color: _selectedColor),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: _pickColor,
                  child: const Text('Pick Color'),
                ),
                const SizedBox(width: 16),
                Container(width: 24, height: 24, color: _selectedColor),
              ],
            ),
            const Spacer(),
            ElevatedButton(onPressed: _save, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
