class ChatState {
  final LoadState loadState;
  final String errorMessage;
  final List<String>? history;
  ChatState({required this.loadState, this.errorMessage = '', this.history});

  factory ChatState.initialState() {
    return ChatState(loadState: LoadState.idle, errorMessage: '', history: []);
  }

  ChatState copyWith({
    LoadState? loadState,
    String? errorMessage,
    List<String>? history,
  }) {
    return ChatState(
      loadState: loadState ?? this.loadState,
      errorMessage: errorMessage ?? this.errorMessage,
      history: history ?? this.history,
    );
  }
}

enum LoadState { loading, idle, success, error, loadmore, done, noNetwork }
