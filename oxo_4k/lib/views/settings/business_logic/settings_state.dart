import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  final ThemeMode themeMode;
  final Map<String, dynamic> settings;

  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.settings = const {},
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    Map<String, dynamic>? settings,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      settings: settings ?? this.settings,
    );
  }

  @override
  List<Object> get props => [themeMode, settings];
}