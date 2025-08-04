import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends SettingsEvent {
  final ThemeMode themeMode;

  const ThemeChanged(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

class SettingChanged extends SettingsEvent {
  final String key;
  final dynamic value;

  const SettingChanged({required this.key, required this.value});

  @override
  List<Object> get props => [key, value];
}