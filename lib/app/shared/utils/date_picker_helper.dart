// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_null_comparison

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DatePickerHelper {
  static Future<String> doShowDatePicker(BuildContext context,
      {DateTime? initalDate, String endFormat = 'dd-MM-yyyy', DateTime? lastDate}) async {
    DateTime? _datePicked = await showDatePicker(
        context: context,
        initialDate: initalDate ?? DateTime.now(),
        firstDate: DateTime(1945),
        lastDate: lastDate ?? DateTime.now().add(Duration(days: 3650)),
        // initialDatePickerMode: DatePickerMode.year,
        builder: (ctx, child) {
          return Theme(data: Theme.of(context).copyWith(primaryColor: Colors.grey), child: child!);
        });
    if (_datePicked != null) {
      String _temp = DateFormat(endFormat).format(_datePicked);
      return _temp;
    } else {
      return '';
    }
  }

  static Future<String> doShowYearPicker(BuildContext context) async {
    DateTime? _yearPicked;
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BottomSheetYearSelectionWidget(
            onChange: (year) {
              if (year != null) {
                _yearPicked = year;
              }
            },
          );
        });

    if (_yearPicked != null) {
      return DateFormat('yyyy').format(_yearPicked!);
    } else {
      return '';
    }
  }
}

class BottomSheetYearSelectionWidget extends StatelessWidget {
  final Function(DateTime year) onChange;
  BottomSheetYearSelectionWidget({required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 6),
            child: Row(
              children: <Widget>[
                Expanded(
                    child:
                        Text('Pilih Tahun', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start)),
                IconButton(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(0),
                    icon: Icon(Icons.close, color: Theme.of(context).focusColor),
                    onPressed: () => Navigator.of(context).pop()),
              ],
            ),
          ),
          Expanded(
              child: YearPicker(
            selectedDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now().add(Duration(days: 3650)),
            onChanged: (value) {
              onChange(value);
              Navigator.pop(context);
            },
          )),
        ],
      ),
    );
  }
}
