part of 'leveldialog.component.dart';

class _HeaderComponent extends StatelessWidget {
  final Level level;

  const _HeaderComponent({
    Key? key,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            BadgeComponent(
              badge: Badge(
                title: 'tower',
                message: level.inTower ? 'yes' : 'no',
                color: level.inTower ? Colors.green : Colors.red,
              ),
            ),
            BadgeComponent(
              badge: Badge(
                title: 'trial',
                message: level.inTowerTrial ? 'yes' : 'no',
                color: level.inTowerTrial ? Colors.blue : Colors.red,
              ),
            ),
            BadgeComponent(
              badge: Badge(
                title: 'daily',
                message: level.inDailyBuild ? 'yes' : 'no',
                color: level.inDailyBuild ? Colors.orange : Colors.red,
              ),
            ),
            BadgeComponent(
              badge: Badge(
                title: 'players',
                message: level.requiredPlayerCount.toString(),
                color: Colors.amber,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: level.tags
              .map(
                (e) => BadgeComponent(
                  badge: Badge(
                    message: e.name,
                    color: Colors.purple,
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 5),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            BadgeComponent(
              badge: Badge(
                title: '\$',
                message: level.stats.exposureBucks.toString(),
              ),
            ),
            BadgeComponent(
              badge: Badge(
                title: 'likes',
                message: level.stats.likeCount.toString(),
              ),
            ),
            BadgeComponent(
              badge: Badge(
                title: 'faves',
                message: level.stats.favoriteCount.toString(),
              ),
            ),
            BadgeComponent(
              badge: Badge(
                title: 'replays',
                message: level.stats.replayValue.toString(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
