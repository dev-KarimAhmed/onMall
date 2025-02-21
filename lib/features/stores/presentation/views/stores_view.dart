import 'package:flutter/material.dart';
import 'package:on_mall/core/common/widgets/store_card.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/is_portrait.dart';
import 'package:on_mall/core/styles/helpers/font_weight_helper.dart';

class StoresView extends StatelessWidget {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stores",
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
              showSearch(context: context, delegate: StoreSearchDelegate());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isPortrait(context) ? 2 : 3,
            childAspectRatio: 1.2 / 1,
          ),
          itemBuilder: (context, index) {
            return const StoreCard();
          },
        ),
      ),
    );
  }
}

class StoreSearchDelegate extends SearchDelegate {
  final List<String> stores = [
    "Tech Store",
    "Fashion Hub",
    "Grocery Mart",
    "Book Paradise",
    "Mobile World",
    "Electro Zone",
    "Toy Kingdom",
    "Home Essentials",
    "Car Accessories",
    "Beauty Spot",
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
    List<String> searchResults = stores
        .where((store) => store.toLowerCase().contains(query.toLowerCase()))
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
    List<String> suggestions = stores
        .where((store) => store.toLowerCase().contains(query.toLowerCase()))
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
