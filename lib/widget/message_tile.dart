// import 'package:flutter/material.dart';

// class MessageTile extends StatefulWidget {
//   final String message;
//   final String sender;
//   final bool sentByMe;

//   const MessageTile(
//       {Key? key,
//       required this.message,
//       required this.sender,
//       required this.sentByMe})
//       : super(key: key);

//   @override
//   State<MessageTile> createState() => _MessageTileState();
// }

// class _MessageTileState extends State<MessageTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//           top: 4,
//           bottom: 4,
//           left: widget.sentByMe ? 0 : 24,
//           right: widget.sentByMe ? 24 : 0),
//       alignment: widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: widget.sentByMe
//             ? const EdgeInsets.only(left: 30)
//             : const EdgeInsets.only(right: 30),
//         padding:
//             const EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
//         decoration: BoxDecoration(
//             borderRadius: widget.sentByMe
//                 ? const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                     bottomLeft: Radius.circular(20),
//                   )
//                 : const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                     bottomRight: Radius.circular(20),
//                   ),
//             color: widget.sentByMe
//                 ? Theme.of(context).primaryColor
//                 : Colors.grey[700]),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.sender.toUpperCase(),
//               textAlign: TextAlign.start,
//               style: const TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   letterSpacing: -0.5),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Text(widget.message,
//                 textAlign: TextAlign.start,
//                 style: const TextStyle(fontSize: 16, color: Colors.white))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentByMe;
  final String imageUrl; // Add this property for the network image URL

  const MessageTile({
    Key? key,
    required this.message,
    required this.sender,
    required this.sentByMe,
    required this.imageUrl,
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
        left: widget.sentByMe ? 0 : 24,
        right: widget.sentByMe ? 24 : 0,
      ),
      alignment:
          widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: widget.sentByMe
            ? EdgeInsets.only(left: MediaQuery.of(context).size.width*0.5)
            : EdgeInsets.only(right:  MediaQuery.of(context).size.width*0.5),
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: widget.sentByMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
          color: widget.sentByMe
              ? Theme.of(context).primaryColor
              : const Color(0xFF0C2D57),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.imageUrl),
              radius: 20, // Adjust the radius as needed
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.sender.toUpperCase(),
              textAlign: TextAlign.start,
              style : TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: widget.sentByMe ?Colors.black : Colors.white,
                letterSpacing: -0.5,
              ),
            ),
            Divider(
              height: 10,
              
              color: Colors.white,
            ),
            Text(
              widget.message,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
