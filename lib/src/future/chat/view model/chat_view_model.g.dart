// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatViewModel on _ChatViewModelBase, Store {
  late final _$_ChatViewModelBaseActionController = ActionController(
    name: '_ChatViewModelBase',
    context: context,
  );

  @override
  void sendMessage(MessageModel message) {
    final _$actionInfo = _$_ChatViewModelBaseActionController.startAction(
      name: '_ChatViewModelBase.sendMessage',
    );
    try {
      return super.sendMessage(message);
    } finally {
      _$_ChatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
