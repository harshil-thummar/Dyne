// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class CenteredView extends StatefulWidget {
//   final Widget child;
//   const CenteredView({Key? key, required this.child}) : super(key: key);

//   @override
//   _CenteredViewState createState() => _CenteredViewState();
// }

// class _CenteredViewState extends State<CenteredView> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // if (!Responsive.isMobile(context))
//         Expanded(
//           child: Container(
//             // padding: EdgeInsets.symmetric(horizontal: 60),
//             alignment: Alignment.center,
//             child: ConstrainedBox(
//               constraints: BoxConstraints(maxWidth: 500),
//               child: widget.child,
//             ),
//           ),
//         ),
//         // if (Responsive.isMobile(context))
//         //   Expanded(flex: 5, child: widget.child),
//       ],
//     );
//   }
// }
