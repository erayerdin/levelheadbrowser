part of 'leveldialog.component.dart';

class _FooterComponent extends StatelessWidget {
  final Level level;

  const _FooterComponent({
    Key? key,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        BadgeComponent(
          badge: Badge(
            title: 'world',
            message: level.content.worldContentCount.toString(),
            color: Colors.pink,
          ),
        ),
        BadgeComponent(
          badge: Badge(
            title: 'movement',
            message: level.content.movementContentCount.toString(),
            color: Colors.pink,
          ),
        ),
        BadgeComponent(
          badge: Badge(
            title: 'puzzle',
            message: level.content.puzzleContentCount.toString(),
            color: Colors.pink,
          ),
        ),
        BadgeComponent(
          badge: Badge(
            title: 'enemy',
            message: level.content.enemyContentCount.toString(),
            color: Colors.pink,
          ),
        ),
        BadgeComponent(
          badge: Badge(
            title: 'hazard',
            message: level.content.hazardContentCount.toString(),
            color: Colors.pink,
          ),
        ),
      ],
    );
  }
}
