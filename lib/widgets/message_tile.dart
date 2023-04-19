import 'package:flutter/material.dart';


class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sendebyme;

  const MessageTile({
    Key? key,
    required this.message,
    required this.sender,
    required this.sendebyme,
  }) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: widget.sendebyme ? 0 :24,
        right: widget.sendebyme ? 24 :0),
        alignment: widget.sendebyme ? Alignment.centerRight :Alignment.centerLeft,
      child: Container(
        margin: widget.sendebyme
            ? const EdgeInsets.only(left: 30)
            : const EdgeInsets.only(right: 30),
        padding: 
            const EdgeInsets.only(top: 13, bottom: 13, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: widget.sendebyme
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
            color: widget.sendebyme
                ? Theme.of(context).primaryColor
                : Colors.grey[700]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sender.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
