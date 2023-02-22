import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'view_product_view.dart';

class AccessoryView extends StatefulWidget {
  const AccessoryView({super.key});

  @override
  State<AccessoryView> createState() => _AccessoryViewState();
}

class _AccessoryViewState extends State<AccessoryView> {
  @override
  Widget build(BuildContext context) {
    return const ViewProductView('accessory', 'no');
  }
}
