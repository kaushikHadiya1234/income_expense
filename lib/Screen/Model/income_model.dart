
import 'package:flutter/material.dart';

class IncomeModel
{
  String? year,month,name;
  int? amount;
  Icon? icon;
  Color? color;

  IncomeModel({this.year, this.month,this.icon,this.name,this.color,this.amount});
}

class IncomeExpenseModel
{
  String? status,name,category,amount,tamount,date;

  IncomeExpenseModel({this.status, this.name, this.amount, this.category, this.date,this.tamount});
}