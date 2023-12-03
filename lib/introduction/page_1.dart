import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

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
            'Manage Your Tasks with Ease eme',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          const Text(
            "List It Down is your go-to todo list app, empowering you to effortlessly manage your daily tasks. It's your free companion for staying organized, boosting productivity, and making every day count.",
            style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
          // TextButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const Page2()),
          //       );
          //     },
          //     child: Text('Next'))
        ],
      ),
    );
  }
}
