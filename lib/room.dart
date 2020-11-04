import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RoomWidget extends StatefulWidget {

  final String roomName;
  final double temperature;
  final double humidity;

  const RoomWidget({Key key, this.roomName, this.temperature, this.humidity}) : super(key: key);

  @override
  _RoomWidgetState createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State < RoomWidget > {

  @override
  Widget build(BuildContext context) {

    double startAngle = 270.0;
    double _temp = widget.temperature;
    double _hum = widget.humidity * 100;

    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Text(
              widget.roomName,
              style: GoogleFonts.raleway(fontSize: 36),
            ),
            SizedBox(height: 40.0),
            Container(
              child: CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 10.0,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: !_temp.isNegative ? Colors.green : Colors.red,
                percent: !_temp.isNegative ? _temp / 30 : _temp.abs() / 30,
                startAngle: _temp.isNegative ? 360 - (_temp.abs() * 12) + startAngle : startAngle,
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _temp.toStringAsFixed(
                        _temp.truncateToDouble() ==
                        _temp ? 0 : 1
                      ),
                      style: TextStyle(
                        fontSize: 64
                      ),
                    ),
                    Text(
                      "°C",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 10.0,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.blue,
                percent: widget.humidity,
                startAngle: startAngle,
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _hum.toStringAsFixed(
                        _hum.truncateToDouble() ==
                        _hum ? 0 : 1
                      ),
                      style: TextStyle(
                        fontSize: 64
                      ),
                    ),
                    Text(
                      "%",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}