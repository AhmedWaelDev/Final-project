import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit() : super(PhotoInitial());

  Future<void> loadImagePath() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final imagePath = prefs.getString('profile_image_path');
      if (imagePath != null) {
        emit(PhotoLoaded(File(imagePath)));
      }
    } catch (e) {
      emit(PhotoError('Failed to load image'));
    }
  }

  Future<void> saveImagePath(File image) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image_path', image.path);
      emit(PhotoLoaded(image));
    } catch (e) {
      emit(PhotoError('Failed to save image'));
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        await saveImagePath(image);
      }
    } catch (e) {
      emit(PhotoError('Failed to pick image'));
    }
  }
}
