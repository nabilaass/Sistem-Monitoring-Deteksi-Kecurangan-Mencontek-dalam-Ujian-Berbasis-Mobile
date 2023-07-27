import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mysql1/mysql1.dart';

class DataPoint {
  final String category;
  final int count;

  DataPoint(this.category, this.count);
}

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  late List<charts.Series<DataPoint, String>> _seriesList;
  late MySqlConnection _connection;

  @override
  void initState() {
    super.initState();
    _seriesList = [];
    _connectToDatabase();
  }

  Future<void> _connectToDatabase() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      db: 'flask',
    );

    _connection = await MySqlConnection.connect(settings);

    final results = await _connection.query(
        'SELECT category, COUNT(*) AS count FROM kondisi GROUP BY category');
    final data =
        results.map((r) => DataPoint(r['category'], r['count'])).toList();

    setState(() {
      _seriesList = [
        charts.Series<DataPoint, String>(
          id: 'Data',
          domainFn: (DataPoint point, _) => point.category,
          measureFn: (DataPoint point, _) => point.count,
          data: data,
        ),
      ];
    });
  }

  @override
  void dispose() {
    _connection.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: charts.BarChart(
        _seriesList,
        animate: true,
        vertical: false,
        barRendererDecorator: charts.BarLabelDecorator<String>(),
      ),
    );
  }
}
