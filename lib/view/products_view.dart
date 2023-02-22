import 'package:clinic/controller/search_ctr.dart';
import 'package:clinic/view/search_view.dart';
import 'package:clinic/view/television_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import 'accessory_view.dart';
import 'laptop_view.dart';
import 'mobile_view.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff595CFF),
          title: const Text('Electronics'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                final searchCtr = Get.put(SearchCtr());
                showSearch(context: context, delegate: SearchView());
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ],
          bottom: const TabBar(
              indicatorWeight: 5,
              indicatorColor: Color(0xff595CFF),
              tabs: [
                Tab(text: 'Television'),
                Tab(text: 'Mobile'),
                Tab(text: 'Laptop'),
                Tab(text: 'Accessory'),
              ]),
        ),
        body: const TabBarView(children: [
          TelevisionView(),
          MobileView(),
          LapTopView(),
          AccessoryView(),
        ]),
      ),
    );
  }
}
