import 'dart:async';

import 'package:canable_user/Providers/baseProvider.dart';
import 'package:canable_user/Providers/chatprovider.dart';
import 'package:canable_user/bloc/bloc/chat_bloc.dart';
import 'package:canable_user/models/messages.dart';
import 'package:canable_user/repository/baseRepository.dart';
import 'package:canable_user/util/conversations.dart';
import 'package:canable_user/util/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository extends BaseRepository {
  ChatProvider chatProvider = ChatProvider();
  Stream<List<Chat>> getChats() => chatProvider.getChats();
  Stream<QuerySnapshot> getMessages(String chatId) =>
      ChatProvider().getMessages(chatId);
  Future<QuerySnapshot> getPreviousMessages(
          String chatId, DocumentSnapshot prevMessage) =>
      ChatProvider().getPreviousMessages(chatId, prevMessage);

  Future<void> sendMessage(String message, String chatId, String senderId,
          String receiverId, String receiversName) =>
      chatProvider.sendMessage(
          chatId, message, senderId, receiverId, receiversName);

  @override
  void dispose() {
    chatProvider.dispose();
  }
}
