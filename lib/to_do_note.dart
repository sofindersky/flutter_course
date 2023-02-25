class ToDoNote {
  String? _text;
  bool _isCrossedOut;

  ToDoNote({String? text, bool isCrossedOut = false})
      : _text = text,
        _isCrossedOut = isCrossedOut;

  String get text => _text ?? '';
  bool get isCrossedOut => _isCrossedOut;

  set text(String text) => _text = text;

  void toggleCrossedOut() {
    _isCrossedOut = !_isCrossedOut;
  }
}
