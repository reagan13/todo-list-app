import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  final List<Widget> _pages = [const Page1(), const Page2(), const Page3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          )
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          'Manage Your Tasks with Ease',
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
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
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
          'qwerty',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Text(
          "List It Down is your go-to todo list app, empowering you to effortlessly manage your daily tasks. It's your free companion for staying organized, boosting productivity, and making every day count.",
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
        // TextButton(onPressed: () {}, child: Text('Next'))
      ],
    );
  }
}
