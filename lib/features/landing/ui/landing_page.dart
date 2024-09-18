import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../bloc/landing_page_bloc.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Iconsax.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Iconsax.shop),
    label: 'Store',
  ),
  BottomNavigationBarItem(
    icon: Icon(Iconsax.heart),
    label: 'Wishlist',
  ),
  BottomNavigationBarItem(
    icon: Icon(Iconsax.user),
    label: 'Profile',
  ),
];

const List<Widget> bottomNavScreen = <Widget>[
  Text('Index  : Home'),
  Text('Store  : Store '),
  Text('Wishlist  : Wishlist'),
  Text('Profile  : Profile'),
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.primary,
              backgroundColor: darkMode ? TColors.black : Colors.white,
              onTap: (index) {
                BlocProvider.of<LandingPageBloc>(context)
                    .add(TabChange(tabIndex: index));
              },
            ));
      },
    );
  }
}
