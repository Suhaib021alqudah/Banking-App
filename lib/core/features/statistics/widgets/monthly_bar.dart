import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthlyBarChart extends StatelessWidget {
  const MonthlyBarChart({super.key});

  final Color lightBlue = const Color(0xFF6B84FF);
  final Color darkBlue = const Color(0xFF2C3559);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236.h,
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 8000,
          minY: 0,
          borderData: FlBorderData(show: false),
          gridData: _buildGridData(),
          titlesData: _buildTitlesData(),
          barGroups: _buildAllBarGroups(),
        ),
      ),
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: false,
      horizontalInterval: 2000,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey.withValues(alpha: 0.3),
          strokeWidth: 1,
          dashArray: [5, 5],
        );
      },
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      show: true,
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),

      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 2000,
          getTitlesWidget: (value, meta) {
            if (value == 0) {
              return const Text(
                '0',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              );
            }
            return Text(
              '${(value / 1000).toInt()}k',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            );
          },
        ),
      ),

      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May'];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                months[value.toInt()],
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            );
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildAllBarGroups() {
    return [
      _makeGroupData(0, 7400, 4800),
      _makeGroupData(1, 7400, 4800),
      _makeGroupData(2, 7400, 4800),
      _makeGroupData(3, 7400, 4800),
      _makeGroupData(4, 7400, 4800),
    ];
  }

  BarChartGroupData _makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      x: x,
      barsSpace: 6,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: lightBlue,
          width: 12,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
        BarChartRodData(
          toY: y2,
          color: darkBlue,
          width: 12,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }
}
