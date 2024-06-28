import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@immutable
sealed class PhotoEvent {}

final class LoadPhoto extends PhotoEvent {}

final class SavePhoto extends PhotoEvent {
  final File image;
  SavePhoto(this.image);
}

final class PickPhoto extends PhotoEvent {
  final ImageSource source;
  PickPhoto(this.source);
}
