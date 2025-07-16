import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../controller/habit_controller.dart';
import '../widgets/icon_picker_sheet.dart';

class HabitFormPage extends StatefulWidget {
  final String? habitId;
  const HabitFormPage({super.key, this.habitId});

  @override
  State<HabitFormPage> createState() => _HabitFormPageState();
}

class _HabitFormPageState extends State<HabitFormPage> {
  final _name = TextEditingController();
  int _icon = Icons.star.codePoint;
  int _color = Colors.blue.value;
  late HabitController c;

  @override
  void initState() {
    super.initState();
    c = Get.find<HabitController>();
    final h = c.habits.firstWhereOrNull((e) => e.id == widget.habitId);
    if (h != null) {
      _name.text = h.name;
      _icon = h.iconCode;
      _color = h.colorHex;
    }
    _name.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple, Colors.teal];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.close), onPressed: context.pop),
        title: Text(widget.habitId == null ? 'New Habit' : 'Edit Habit'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom + 70),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          GestureDetector(
            onTap: () async {
              final icon = await showModalBottomSheet<int>(context: context, builder: (_) => const IconPickerSheet());
              if (icon != null) setState(() => _icon = icon);
            },
            child: CircleAvatar(radius: 32, backgroundColor: Color(_color), child: Icon(IconData(_icon, fontFamily: 'MaterialIcons'))),
          ),
          TextField(controller: _name, decoration: const InputDecoration(labelText: 'Name')),
          Wrap(spacing: 4, children: [
            for (final col in colors)
              GestureDetector(
                onTap: () => setState(() => _color = col.value),
                child: Container(width: 32, height: 32, decoration: BoxDecoration(color: col, border: Border.all(color: _color == col.value ? Colors.black : Colors.transparent))),
              )
          ])
        ]),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _name.text.isEmpty
                ? null
                : () {
                    c.addOrUpdate(HabitEntity(id: widget.habitId, name: _name.text, iconCode: _icon, colorHex: _color));
                    context.pop();
                  },
            child: const Text('Save'),
          ),
        ),
      ),
    );
  }
}
