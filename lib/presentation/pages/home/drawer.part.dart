// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

part of 'home.page.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              textTheme: Theme.of(context).textTheme.copyWith(
                    subtitle1: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.white,
                        ),
                    subtitle2: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Colors.white,
                        ),
                  ),
            ),
            child: Builder(
              builder: (context) => DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/icons/icon.png',
                      width: 50,
                      height: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'Levelhead Browser',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        FutureBuilder(
                          builder: (
                            context,
                            AsyncSnapshot<PackageInfo> snapshot,
                          ) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.done:
                                return Text(
                                  snapshot.data!.version,
                                  style: Theme.of(context).textTheme.subtitle2,
                                );
                              default:
                                return Text('...');
                            }
                          },
                          future: PackageInfo.fromPlatform(),
                        )
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.blue,
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              children: [
                NavDrawerSectionComponent(
                  title: 'Explore',
                  children: [
                    NavDrawerTileComponent(
                      label: 'Profiles',
                      onTap: () {
                        BlocProvider.of<HomePageBloc>(context)
                            .add(LoadHomePageEvent(index: 0));
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.person),
                    ),
                    NavDrawerTileComponent(
                      label: 'Levels',
                      onTap: () {
                        BlocProvider.of<HomePageBloc>(context)
                            .add(LoadHomePageEvent(index: 1));
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.sports_esports),
                    ),
                    NavDrawerTileComponent(
                      label: 'Tower Trial',
                      onTap: () {
                        BlocProvider.of<HomePageBloc>(context)
                            .add(LoadHomePageEvent(index: 2));
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.emoji_events),
                    ),
                    Divider(),
                    NavDrawerTileComponent(
                      label: 'Buy the game',
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => BuyTheGameDialog(),
                      ),
                    ),
                    NavDrawerTileComponent(
                      label: 'Settings',
                      onTap: () => Navigator.of(context).pushNamed('/settings'),
                      icon: Icon(Icons.settings),
                    ),
                    NavDrawerTileComponent(
                      label: 'About',
                      onTap: () async => _showAboutDialog(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: SOCIAL_LINKS.keys
                .map(
                  (k) => IconButton(
                    onPressed: () async => launch(SOCIAL_LINKS[k]!.item1),
                    icon: Icon(SOCIAL_LINKS[k]!.item3),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Future _showAboutDialog(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      context: context,
      applicationVersion: info.version,
      applicationIcon: ClipRRect(
        child: Image.asset(
          'assets/images/icons/icon.png',
          width: 50,
          height: 50,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      applicationLegalese: 'An application to browse Levelhead universe.',
    );
  }
}
