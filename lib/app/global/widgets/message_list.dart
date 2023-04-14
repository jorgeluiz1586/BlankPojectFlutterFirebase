// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: require_trailing_commas

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'message.dart';

/// Listens for incoming foreground messages and displays them in a list.
class MessageList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageList();
}

class _MessageList extends State<MessageList> {
  List<RemoteMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _messages = [..._messages, message];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_messages.isEmpty) {
      return Scaffold(
        body: const SafeArea(
          child: Center(
            child: Text(
              'No messages received',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Get.toNamed("/");
          },
          child: const Text('Go back',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                RemoteMessage message = _messages[index];

                return ListTile(
                  title: Text(message.messageId ??
                      'no RemoteMessage.messageId available'),
                  subtitle: Text(message.sentTime?.toString() ??
                      DateTime.now().toString()),
                  onTap: () => Navigator.pushNamed(context, '/message',
                      arguments: MessageArguments(message, false)),
                );
              }),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.toNamed("/");
        },
        child: const Text('Go back',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
