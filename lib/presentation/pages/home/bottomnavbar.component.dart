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

class _BottomNavbarComponent extends StatelessWidget {
  const _BottomNavbarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (index) {
            BlocProvider.of<HomePageBloc>(context)
                .add(LoadHomePageEvent(index: index));
          },
          currentIndex: state.index,
          type: BottomNavigationBarType.fixed,
          items: HomePageBottomNavbarTab.values
              .map((e) => e.toBottomNavbarItem())
              .toList(),
        );
      },
    );
  }
}
