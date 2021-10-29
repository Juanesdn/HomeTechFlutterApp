// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class RangeCalendar extends StatefulWidget {
  @override
  _RangeCalendarState createState() => _RangeCalendarState();
}

class _RangeCalendarState extends State<RangeCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  // enforced = Cant be toggled on/off by longpressing a date
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.enforced;
  DateTime _focusedDay = DateTime.now(), today = DateTime.now();
  DateTime? _selectedDay, _rangeStart, _rangeEnd;

  rangedBoxDecoration() => BoxDecoration(
        color: Color(0xFFFB724C),
        shape: BoxShape.rectangle,
      );

  tableCalendar() => TableCalendar(
        calendarStyle: CalendarStyle(
          rangeHighlightColor: Color(0xFFFCE0D9),
          todayDecoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(color: Colors.white),
          rangeEndDecoration: rangedBoxDecoration(),
          rangeStartDecoration: rangedBoxDecoration(),
        ),
        firstDay: DateTime.now(),
        lastDay: DateTime(today.year, today.month + 3, today.day),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        calendarFormat: _calendarFormat,
        rangeSelectionMode: _rangeSelectionMode,
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _rangeStart = null; // Important to clean those
              _rangeEnd = null;
              //      _rangeSelectionMode = RangeSelectionMode.toggledOff;
            });
          }
        },
        onRangeSelected: (start, end, focusedDay) {
          setState(() {
            _selectedDay = null;
            _focusedDay = focusedDay;
            _rangeStart = start;
            _rangeEnd = end;
            //  _rangeSelectionMode = RangeSelectionMode.toggledOn;
          });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      );

  calendarBuilders() => CalendarBuilders(
        dowBuilder: (context, day) {
          if (day.weekday == DateTime.sunday) {
            final text = DateFormat.E().format(day);

            return Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.red),
              ),
            );
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Material(child: tableCalendar());
  }
}
