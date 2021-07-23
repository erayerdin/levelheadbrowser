part of 'home.page.dart';

enum HomePageBottomNavbarTab {
  Profiles,
  Levels,
  TowerTrial,
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
    }
  }

  Icon toIconData() {
    switch (this) {
      case HomePageBottomNavbarTab.Profiles:
        return Icon(Icons.person);
      case HomePageBottomNavbarTab.Levels:
        return Icon(Icons.sports_esports);
      case HomePageBottomNavbarTab.TowerTrial:
        return Icon(Icons.emoji_events);
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
