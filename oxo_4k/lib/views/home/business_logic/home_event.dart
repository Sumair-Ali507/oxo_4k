part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class UpdateCarouselIndex extends HomeEvent {
  final int index;

  const UpdateCarouselIndex(this.index);
}

class ToggleCarouselVisibility extends HomeEvent {
  final bool show;

  const ToggleCarouselVisibility(this.show);
}

class NavigateToFocus extends HomeEvent {
  const NavigateToFocus();
}

class OpenSettingsDialog extends HomeEvent {
  const OpenSettingsDialog();
}

class OpenWhiteBalanceDialog extends HomeEvent {
  const OpenWhiteBalanceDialog();
}