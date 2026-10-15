class MyDuration {
  final int _milliseconds;

  MyDuration._(this._milliseconds) {
    if (_milliseconds < 0) {
      throw Exception('Duration cannot be negative!');
    }
  }

  MyDuration.fromHours(int hours) : this._(hours * 60 * 60 * 1000);

  MyDuration.fromMinutes(int minutes) : this._(minutes * 60 * 1000);

  MyDuration.fromSeconds(int seconds) : this._(seconds * 1000);

  bool operator >(MyDuration other) => _milliseconds > other._milliseconds;

  MyDuration operator +(MyDuration other) =>
      MyDuration._(_milliseconds + other._milliseconds);

  MyDuration operator -(MyDuration other) =>
      MyDuration._(_milliseconds - other._milliseconds);

  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); 
  MyDuration duration2 = MyDuration.fromMinutes(45); 
  print(duration1 + duration2); 
  print(duration1 > duration2);

  try {
    print(duration2 - duration1); 
  } catch (e) {
    print(e);
  }
}
