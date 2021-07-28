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

  void _redirectToProfilesPage(BuildContext context, String id) {
    BlocProvider.of<HomePageBloc>(context).add(
      LoadHomePageEvent(
        index: 0,
        params: PlayersParams(ids: {id}),
      ),
    );
    Navigator.pop(context);
  }

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
          TableRow(
            children: [
              Container(
                margin: _TABLE_ROW_MARGIN,
                child: Text(
                  'Creator',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                margin: _TABLE_ROW_MARGIN,
                child: LinkComponent(
                  level.creator.alias ?? '<no-alias>',
                  onTap: () =>
                      _redirectToProfilesPage(context, level.creator.id),
                ),
              ),
            ],
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
                  TableRow(
                    children: [
                      Container(
                        margin: _TABLE_ROW_MARGIN,
                        child: Text(
                          '',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        margin: _TABLE_ROW_MARGIN,
                        child: Row(
                          children: [
                            Text('by '),
                            LinkComponent(
                              level.fastestTimeRecords[0].profile.alias ??
                                  '<no-alias>',
                              onTap: () => _redirectToProfilesPage(
                                context,
                                level.fastestTimeRecords[0].profile.id,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
                  TableRow(
                    children: [
                      Container(
                        margin: _TABLE_ROW_MARGIN,
                        child: Text(
                          '',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        margin: _TABLE_ROW_MARGIN,
                        child: Row(
                          children: [
                            Text('by '),
                            LinkComponent(
                              level.highScoreRecords[0].profile.alias ??
                                  '<no-alias>',
                              onTap: () => _redirectToProfilesPage(
                                context,
                                level.highScoreRecords[0].profile.id,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
