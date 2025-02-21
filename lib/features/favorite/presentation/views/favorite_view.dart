import 'package:flutter/material.dart';
import 'package:on_mall/core/common/widgets/product_listview.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: getLargeTextStyle(context).copyWith(
            color: Colors.white,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                getColors(context).primaryColor!,
                getColors(context).gradientColor!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: FavoriteSearchDelegate());
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: ProductsListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: false,
        ),
      ),
    );
  }
}

class FavoriteSearchDelegate extends SearchDelegate {
  final List<String> favoriteItems = [
    "Nike Shoes",
    "Samsung Galaxy",
    "Apple Watch",
    "Sony Headphones",
    "Gaming Laptop",
    "Smart TV",
    "Fitness Tracker",
    "Camera Lens",
    "Running Shorts",
    "Backpack",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> searchResults = favoriteItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = favoriteItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
