class CountState{
  int count;

  CountState({required this.count});
}

class Initializer  extends CountState{
  Initializer():super(count: 0);
}
