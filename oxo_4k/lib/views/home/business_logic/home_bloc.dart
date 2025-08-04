import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<UpdateCarouselIndex>(_onUpdateCarouselIndex);
    on<ToggleCarouselVisibility>(_onToggleCarouselVisibility);
    on<NavigateToFocus>(_onNavigateToFocus);
    on<OpenSettingsDialog>(_onOpenSettingsDialog);
    on<OpenWhiteBalanceDialog>(_onOpenWhiteBalanceDialog);
  }

  void _onUpdateCarouselIndex(UpdateCarouselIndex event, Emitter<HomeState> emit) {
    emit(state.copyWith(carouselIndex: event.index));
  }

  void _onToggleCarouselVisibility(ToggleCarouselVisibility event, Emitter<HomeState> emit) {
    emit(state.copyWith(showCarousel: event.show));
  }

  void _onNavigateToFocus(NavigateToFocus event, Emitter<HomeState> emit) {
    // Navigation handled in widget
  }

  void _onOpenSettingsDialog(OpenSettingsDialog event, Emitter<HomeState> emit) {
    // Dialog handled in widget
  }

  void _onOpenWhiteBalanceDialog(OpenWhiteBalanceDialog event, Emitter<HomeState> emit) {
    // Dialog handled in widget
  }
}