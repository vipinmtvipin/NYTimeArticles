import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {

  final Color _start;
  final Color _end;

  const GradientBackground(this._start,this._end, {super.key});

  @override
  Widget build(BuildContext context) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          _start,
          _start,
          _start,
          _end,
        ],
      ),
    ),
  );
  }
}