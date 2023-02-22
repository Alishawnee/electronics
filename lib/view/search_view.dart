import 'package:clinic/controller/search_ctr.dart';
import 'package:clinic/view/details_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

final searchCtr = Get.find<SearchCtr>();

class SearchView extends SearchDelegate<int> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      // scaffoldBackgroundColor: const Color(0xff595CFF),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff595CFF),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
      textTheme: const TextTheme(
          headline6: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold)),
      appBarTheme: const AppBarTheme(
          color: Color(0xff595CFF), surfaceTintColor: Colors.white),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        color: Colors.white,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, 1);
        searchCtr.searchList = [];
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GetBuilder<SearchCtr>(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: query.isEmpty
              ? searchCtr.listHistory.length
              : searchCtr.searchList.length,
          itemBuilder: (BuildContext context, int i) {
            return Column(
              children: [
                ListTile(
                  leading: query.isEmpty
                      ? const Icon(
                          FontAwesomeIcons.clockRotateLeft,
                          color: Colors.black,
                        )
                      : SizedBox(
                          height: 150,
                          width: 100,
                          child: Image.network(
                            searchCtr.searchList[i].imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                  title: RichText(
                    text: TextSpan(
                      text: query.isEmpty
                          ? searchCtr.listHistory[i]
                          : searchCtr.searchList[i].title,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    if (query.isEmpty) {
                      query = searchCtr.listHistory[i];
                      searchCtr.searchProduct(query);
                    } else {
                      Get.to(() => ProductDetailView(searchCtr.searchList[i]));
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
    searchCtr.searchProduct(query);
    searchCtr.addToHistory(query);
    showSuggestions(context);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          FontAwesomeIcons.xmark,
          color: Colors.white,
        ),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }
}
