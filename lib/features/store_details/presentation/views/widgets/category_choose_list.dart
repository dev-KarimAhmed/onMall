import 'package:flutter/material.dart';

class CategoryChooseList extends StatelessWidget {
  const CategoryChooseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Category"),
        DropdownButton(
          value: 1,
          items: const [
            DropdownMenuItem(
              value: 0,
              child: Text("Shoes"),
            ),
            DropdownMenuItem(
              value: 1,
              child: Text("T-shirt"),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text("Socks"),
            ),
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}
