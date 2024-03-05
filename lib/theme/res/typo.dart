import 'package:flutter/material.dart';

abstract class Typo {
  const Typo({
    required this.name,
    required this.regular,
    required this.semiBold,
  });

  final String name;
  final FontWeight regular;
  final FontWeight semiBold;
}

class Catamaran implements Typo {
  const Catamaran();

  @override
  final String name = "catamaran";

  @override
  final FontWeight regular = FontWeight.w400;

  @override
  final FontWeight semiBold = FontWeight.w600;
}