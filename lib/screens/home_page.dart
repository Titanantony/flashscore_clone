import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToggleDate extends StatefulWidget {
  const ToggleDate({Key? key}) : super(key: key);

  @override
  _ToggleDateState createState() => _ToggleDateState();
}

class _ToggleDateState extends State<ToggleDate> {
  late DateTime _selectedDate;
  late bool _showDatePicker;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _showDatePicker = false;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  Future<void> _handleShowDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Widget _buildDateColumn(DateTime date) {
    final isSelected = date.year == _selectedDate.year &&
        date.month == _selectedDate.month &&
        date.day == _selectedDate.day;

    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              _selectedDate = date;
            });
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              isSelected ? Colors.red : Colors.black,
            ),
          ),
          child: Column(
            children: [
              Text(
                _isToday(date)
                    ? 'TODAY'
                    : DateFormat('EEE').format(date).toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                DateFormat('dd.MM.').format(date),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = -6; i <= 6; i++) // Display only six dates
                _buildDateColumn(DateTime.now().add(Duration(days: i))),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('Below the line'),
      ],
    );
  }
}
