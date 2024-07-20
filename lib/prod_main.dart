import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:taski/taski.dart';

void main() {
  FlavorConfig(
    name: 'prod',
    color: Colors.blue,
    location: BannerLocation.topEnd,
  );
  runApp(const Taski());
}