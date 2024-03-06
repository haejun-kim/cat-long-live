import 'package:flutter/material.dart';

abstract class Typo {
  const Typo({
    required this.name,
    required this.regular,
    required this.bold,
  });

  final String name;
  final FontWeight regular;
  final FontWeight bold;
}

class Catamaran implements Typo {
  const Catamaran();

  @override
  final String name = "catamaran";

  @override
  final FontWeight regular = FontWeight.w400;

  @override
  final FontWeight bold = FontWeight.w700;
}