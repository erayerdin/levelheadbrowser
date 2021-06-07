part of 'leveldialog.component.dart';

const _TABLE_ROW_MARGIN = EdgeInsets.fromLTRB(10, 5, 10, 5);

TableRow _mapLevelFieldToTableRow(
    BuildContext context, String label, dynamic object) {
  return TableRow(
    children: [
      Container(
        margin: _TABLE_ROW_MARGIN,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.right,
        ),
      ),
      Container(
        margin: _TABLE_ROW_MARGIN,
        child: Text(
          object.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

class _BodyComponent extends StatelessWidget {
  final Level level;

  const _BodyComponent({
    Key? key,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      child: Table(
        children: [
          _mapLevelFieldToTableRow(context, 'ID:', level.id),
          _mapLevelFieldToTableRow(context, 'Title:', level.title),
          _mapLevelFieldToTableRow(
            // TODO add a button to view creator details
            context,
            'Creator:',
            level.creator.alias,
          ),
          _mapLevelFieldToTableRow(
            context,
            'Created At:',
            level.createdAt,
          ),
          // TODO implement better ui for records
          _mapLevelFieldToTableRow(
            context,
            'Creator Time Record:',
            '${level.creatorRecord.inSeconds} seconds',
          ),
          ...level.fastestTimeRecords.length > 0
              ? [
                  _mapLevelFieldToTableRow(
                    context,
                    'Fastest Time Record:',
                    '${level.fastestTimeRecords[0].value} seconds',
                  ),
                  _mapLevelFieldToTableRow(
                    context,
                    '',
                    'by ${level.fastestTimeRecords[0].profile.alias}', // TODO implement button for record holder profiles
                  )
                ]
              : [],
          ...level.highScoreRecords.length > 0
              ? [
                  _mapLevelFieldToTableRow(
                    context,
                    'Highest Score Record:',
                    '${level.highScoreRecords[0].value} points',
                  ),
                  _mapLevelFieldToTableRow(
                    context,
                    '',
                    'by ${level.highScoreRecords[0].profile.alias}', // TODO implement button for record holder profiles
                  )
                ]
              : [],
          _mapLevelFieldToTableRow(
            context,
            'Diamonds:',
            level.stats.diamondCount,
          ),
          _mapLevelFieldToTableRow(
            context,
            'Players / Attempts:',
            '${level.stats.playerCount} / ${level.stats.attemptCount}',
          ),
          _mapLevelFieldToTableRow(
            context,
            'Clear / Failure Rate:',
            '${level.stats.clearRate.toStringAsFixed(2)} / ${level.stats.failureRate.toStringAsFixed(2)}',
          ),
          _mapLevelFieldToTableRow(
            context,
            'Play Time:',
            '${level.stats.playTimeSeconds} seconds',
          ),
        ],
      ),
    );
  }
}
