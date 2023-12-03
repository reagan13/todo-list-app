import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: () => {}, child: Text('Skipa'))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            child: Image.network(
              'https://clickup.com/blog/wp-content/uploads/2020/10/workload-management-blog-feature.png',
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'asdad',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Text(
            "List It Down is your go-to todo list app, empowering you to effortlessly manage your daily tasks. It's your free companion for staying organized, boosting productivity, and making every day count.",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          // TextButton(
          //     onPressed: () {
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(builder: (context) => const Page3()),
          //       // );
          //     },
          //     child: Text('Next'))
        ],
      ),
    );
  }
}
