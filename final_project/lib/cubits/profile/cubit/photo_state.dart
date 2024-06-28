import 'dart:io';

import 'package:flutter/material.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

final class PhotoLoaded extends PhotoState {
  final File image;
  PhotoLoaded(this.image);
}

final class PhotoError extends PhotoState {
  final String message;
  PhotoError(this.message);
}
