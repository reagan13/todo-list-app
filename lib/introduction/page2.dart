import 'package:flutter/material.dart';

class YourPageViewScreen extends StatefulWidget {
  @override
  _YourPageViewScreenState createState() => _YourPageViewScreenState();
}

class _YourPageViewScreenState extends State<YourPageViewScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (_, i) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.network(
                    getImageUrl(i),
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  getTitle(i),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  getDescription(i),
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    // Update the page index when the button is pressed
                    setState(() {
                      currentPageIndex = (currentPageIndex + 1) % 3;
                    });
                  },
                  child: Text('Next'),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  String getImageUrl(int index) {
    // Provide different image URLs based on the index
    switch (index) {
      case 0:
        return '';
      case 1:
        return 'https://clickup.com/blog/wp-content/uploads/2020/10/workload-management-blog-feature.png';
      case 2:
        return 'YOUR_THIRD_IMAGE_URL';
      default:
        return '';
    }
  }

  String getTitle(int index) {
    // Provide different titles based on the index
    switch (index) {
      case 0:
        return 'Manage Your Tasks with Ease';
      case 1:
        return 'YOUR_SECOND_TITLE';
      case 2:
        return 'YOUR_THIRD_TITLE';
      default:
        return '';
    }
  }

  String getDescription(int index) {
    // Provide different descriptions based on the index
    switch (index) {
      case 0:
        return "List It Down is your go-to todo list app, empowering you to effortlessly manage your daily tasks. It's your free companion for staying organized, boosting productivity, and making every day count.";
      case 1:
        return 'YOUR_SECOND_DESCRIPTION';
      case 2:
        return 'YOUR_THIRD_DESCRIPTION';
      default:
        return '';
    }
  }
}
