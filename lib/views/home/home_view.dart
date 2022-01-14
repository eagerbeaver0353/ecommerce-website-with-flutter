import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/footer/footer.dart';
import '../../widgets/centered_view/centered_view.dart';
import '../../widgets/navigation/custom_navigation_bar.dart';
import '../../widgets/navigation/mobile/custom_navigation_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          drawer: [DeviceScreenType.mobile, DeviceScreenType.tablet]
                  .contains(sizingInformation.deviceScreenType)
              ? const CustomNavigationDrawer()
              : null,
          backgroundColor: Colors.white,
          body: CenteredView(
            child: Column(
              children: const [
                CustomNavigationBar(),
                SizedBox(height: 15),
                Flexible(child: Placeholder()),
                SizedBox(height: 15),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
