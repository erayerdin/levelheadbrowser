part of 'home.page.dart';

enum HomePageBottomNavbarTab {
  Profiles,
  Levels,
  TowerTrial,
  DailyBuild,
}

extension HomePageBottomNavbarTabExtension on HomePageBottomNavbarTab {
  String toLabel() {
    switch (this) {
      case HomePageBottomNavbarTab.Profiles:
        return 'Profiles';
      case HomePageBottomNavbarTab.Levels:
        return 'Levels';
      case HomePageBottomNavbarTab.TowerTrial:
        return 'Tower Trial';
      case HomePageBottomNavbarTab.DailyBuild:
        return 'Daily Build';
    }
  }

  Icon toIconData() {
    switch (this) {
      // TODO add icons for other tabs
      case HomePageBottomNavbarTab.Profiles:
        return Icon(Icons.person);
      default:
        return Icon(Icons.help);
    }
  }

  BottomNavigationBarItem toBottomNavbarItem() {
    return BottomNavigationBarItem(
      icon: this.toIconData(),
      label: this.toLabel(),
    );
  }
}

class _BottomNavbarComponent extends StatefulWidget {
  const _BottomNavbarComponent({Key? key}) : super(key: key);

  @override
  _BottomNavbarComponentState createState() => _BottomNavbarComponentState();
}

class _BottomNavbarComponentState extends State<_BottomNavbarComponent> {
  final Logger _logger = getIt.get();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        _logger.d('Pressed $index on bottom navbar.');
        BlocProvider.of<HomePageBloc>(context)
            .add(LoadHomePageEvent(pageId: index));
        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: HomePageBottomNavbarTab.values
          .map((e) => e.toBottomNavbarItem())
          .toList(),
    );
  }
}
