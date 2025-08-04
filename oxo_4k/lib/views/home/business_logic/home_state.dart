part of 'home_bloc.dart';

class HomeState {
  final int carouselIndex;
  final bool showCarousel;

  const HomeState({
    this.carouselIndex = 1,
    this.showCarousel = true,
  });

  HomeState copyWith({
    int? carouselIndex,
    bool? showCarousel,
  }) {
    return HomeState(
      carouselIndex: carouselIndex ?? this.carouselIndex,
      showCarousel: showCarousel ?? this.showCarousel,
    );
  }
}