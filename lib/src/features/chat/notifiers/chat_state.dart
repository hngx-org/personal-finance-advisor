class ChatState {
  final LoadState loadState;
  final LoadState? chatState;
  final String errorMessage; //resp
  final List<String>? history;

  ChatState({
    required this.loadState,
    this.errorMessage = '',
    this.history,
    this.chatState,
  });

  factory ChatState.initialState() {
    return ChatState(
      loadState: LoadState.idle,
      errorMessage: '',
      chatState: LoadState.idle,
      history: [],
    );
  }

  ChatState copyWith({
    LoadState? loadState,
    LoadState? chatState,
    String? errorMessage,
    List<String>? history,
  }) {
    return ChatState(
      loadState: loadState ?? this.loadState,
      chatState: chatState ?? this.chatState,
      errorMessage: errorMessage ?? this.errorMessage,
      history: history ?? this.history,
    );
  }
}

enum LoadState { loading, idle, success, error, loadmore, done, noNetwork }
