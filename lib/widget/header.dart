import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.list,
                size: 30.0,
              ),
              Text(
                'List It Down',
                style: TextStyle(fontFamily: 'Lato', fontSize: 20.0),
              ),
              Icon(
                Icons.image,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
