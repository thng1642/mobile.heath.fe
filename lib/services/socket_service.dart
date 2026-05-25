import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late io.Socket socket;

  factory SocketService() {
    return _instance;
  }

  SocketService._internal() {
    _initSocket();
  }

  void _initSocket() {
    socket = io.io('http://localhost:5050', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'reconnection': true,
      'reconnectionAttempts': 5,
      'reconnectionDelay': 1000,
    });

    socket.onConnect((_) {
      debugPrint('Socket connected');
    });

    socket.onDisconnect((_) {
      debugPrint('Socket disconnected');
    });

    socket.onError((error) {
      debugPrint('Socket error: $error');
    });

    socket.onConnectError((error) {
      debugPrint('Socket connection error: $error');
    });
  }

  void connect() {
    if (!socket.connected) {
      socket.connect();
    }
  }

  void disconnect() {
    if (socket.connected) {
      socket.disconnect();
    }
  }

  void emit(String event, dynamic data) {
    if (socket.connected) {
      debugPrint(data);
      socket.emit(event, data);
    }
  }

  void on(String event, Function(dynamic) handler) {
    socket.on(event, handler);
  }

  void off(String event) {
    socket.off(event);
  }
}
