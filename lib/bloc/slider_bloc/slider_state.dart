class SliderState {
  int index;

  SliderState({this.index = 0});

  SliderState copyWith({int? index}) {
    return SliderState(index: index ?? this.index);
  }
}
