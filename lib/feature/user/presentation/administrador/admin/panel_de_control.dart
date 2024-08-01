import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import 'package:fl_chart/fl_chart.dart';

class PaneldeControl extends StatefulWidget {
  const PaneldeControl({super.key});

  @override
  State<PaneldeControl> createState() => _PaneldeControlState();
}

class _PaneldeControlState extends State<PaneldeControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      drawer: const BarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            const Text(
              "SEZZON",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Panel de control',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Row(
                    children: [Icon(Icons.grid_view, color: Colors.white)],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(Icons.bar_chart, 'Reportes'),
                _buildIconButton(Icons.people, 'Clientes'),
                _buildIconButton(Icons.shopping_bag, 'Pedidos'),
                _buildIconButton(Icons.restaurant_menu, 'Platillos'),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Descarga app'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            _buildBarChart(),
            const SizedBox(height: 16),
            _buildLineChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildBarChart() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Text(
            'Ventas de Platillos por Categoría',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BarChart(
              BarChartData(
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString());
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const titles = [
                          'Pescados',
                          'Omelets',
                          'Burgers',
                          'Pizza',
                          'Salad',
                          'Tacos',
                          'Steak',
                          'Sushi',
                          'Soup'
                        ];
                        if (value.toInt() < titles.length) {
                          return RotatedBox(
                            quarterTurns: 3,
                            child: Text(titles[value.toInt()],
                                style: const TextStyle(fontSize: 10)),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  topTitles:
                      const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [
                    BarChartRodData(toY: 98, color: Colors.orange)
                  ]),
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(toY: 60, color: Colors.orange)
                  ]),
                  BarChartGroupData(x: 2, barRods: [
                    BarChartRodData(toY: 52, color: Colors.orange)
                  ]),
                  BarChartGroupData(x: 3, barRods: [
                    BarChartRodData(toY: 85, color: Colors.orange)
                  ]),
                  BarChartGroupData(x: 4, barRods: [
                    BarChartRodData(toY: 72, color: Colors.orange)
                  ]),
                  BarChartGroupData(
                      x: 5,
                      barRods: [BarChartRodData(toY: 62, color: Colors.red)]),
                  BarChartGroupData(
                      x: 6,
                      barRods: [BarChartRodData(toY: 85, color: Colors.red)]),
                  BarChartGroupData(
                      x: 7,
                      barRods: [BarChartRodData(toY: 54, color: Colors.red)]),
                  BarChartGroupData(
                      x: 8,
                      barRods: [BarChartRodData(toY: 82, color: Colors.red)]),
                ],
                maxY: 100,
                gridData: const FlGridData(show: true, drawVerticalLine: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Text(
            'Tendencias de Ventas a lo Largo del Tiempo',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString());
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Enero',
                          'Febrero',
                          'Marzo',
                          'Abril',
                          'Mayo',
                          'Junio',
                          'Julio',
                          'Agosto',
                          'Septiembre',
                          'Octubre',
                          'Noviembre',
                          'Diciembre'
                        ];
                        if (value.toInt() < months.length) {
                          return RotatedBox(
                            quarterTurns: 3,
                            child: Text(months[value.toInt()],
                                style: const TextStyle(fontSize: 10)),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  topTitles:
                      const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: true),
                gridData: const FlGridData(show: true, drawVerticalLine: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(12,
                        (index) => FlSpot(index.toDouble(), 10.0 + index * 8)),
                    isCurved: false,
                    color: Colors.blue,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
