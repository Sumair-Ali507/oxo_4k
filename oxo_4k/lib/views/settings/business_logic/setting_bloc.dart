import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxo_4k/views/settings/business_logic/setting_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<ThemeChanged>(_onThemeChanged);
    on<SettingChanged>(_onSettingChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<SettingsState> emit) {
    // In a real app, you would persist this preference
    emit(state.copyWith(themeMode: event.themeMode));
  }

  void _onSettingChanged(SettingChanged event, Emitter<SettingsState> emit) {
    final newSettings = Map<String, dynamic>.from(state.settings);
    newSettings[event.key] = event.value;
    emit(state.copyWith(settings: newSettings));
  }
}