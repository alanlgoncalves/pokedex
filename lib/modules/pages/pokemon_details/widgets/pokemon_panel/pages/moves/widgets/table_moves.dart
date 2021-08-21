import 'package:flutter/material.dart';

class TableMovesWidget extends StatelessWidget {
  final List<Widget> columns;
  final List<List<Widget>> rows;

  const TableMovesWidget({
    Key? key,
    required this.columns,
    required this.rows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 12,
        dataRowHeight: 34,
        headingRowHeight: 34,
        columns: columns.map((column) => DataColumn(label: column)).toList(),
        rows: rows
            .map((row) => DataRow(
                  cells: row.map((cell) => DataCell(cell)).toList(),
                ))
            .toList(),
      ),
    );
  }
}
