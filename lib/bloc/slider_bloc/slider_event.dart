abstract class SliderEvent{
  const SliderEvent();
}

class SlideEvent extends SliderEvent{
  final int index;
  const SlideEvent(this.index);
}