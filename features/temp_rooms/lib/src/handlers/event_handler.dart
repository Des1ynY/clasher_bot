abstract class EventsHandler<T> {
  EventsHandler(Stream<T> events) {
    events.listen(onEvent);
  }

  void onEvent(T event);
}
