import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uid = Uuid();

enum Categories { food, travel, bills, entertainment, others }

const categoryIcons = {
  Categories.food: Icons.fastfood_rounded,
  Categories.travel: Icons.flight_takeoff,
  Categories.bills: Icons.attach_money,
  Categories.entertainment: Icons.slow_motion_video,
  Categories.others: Icons.more_horiz,
};

class Expense {
  Expense(
      {required this.amount,
      required this.title,
      required this.date,
      required this.category})
      : id = uid.v4();
  final String id;
  final double amount;
  final String title;
  final DateTime date;
  final Categories category;

  String get formattedDate {
    return DateFormat.yMd().format(date);
  }
}
