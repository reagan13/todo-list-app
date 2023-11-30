import 'package:flutter/material.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                'https://clickup.com/blog/wp-content/uploads/2020/01/note-taking.png',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'List It Down',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ClipRRect(
//           child: Align(
//             alignment: Alignment.center,
//             child: Image.asset(
//               '..//lib/images/note-taking.png',
//               height: 400,
//               width: 400,
//             ),
//           ),
//         ),
//         const Text(
//           "Ready to conquer your day? What's on your agenda",
//           style: TextStyle(fontSize: 16),
//         ),
//       ],
//     );