# drift_editors

## Description

This package came about because I found I was spending a lot of my time writing user interfaces to edit the rows I had coded in [drift](https://pub.dev/packages/drift). Not only is this quite boring, but it's not particularly creative, and something I felt should be handed off to something more dynamic, so I could get on with adding features to the various editors I tend to work on.

Also, even though I have [package:backstreets_widgets](https://pub.dev/packages/backstreets_widgets), I found I was writing lots of code to created tabbed interfaces for what amounted to settings or admin pages.

## Enter `drift_editors`

I made `drift_editors` to take all the heavy lifting out of at least updating rows. Now, instead of code like:

```dart
final database = ref.watch(databaseProvider);
final dao = database.missionsDao;
final value = ref.watch(missionProvider(missionId));
return SimpleScaffold(
  title: 'Edit Mission',
  body: value.when(
    data: (final mission) => ListView(
      shrinkWrap: true,
      children: [
        TextListTile(
          value: mission.name,
          onChanged: (final name) async {
            await dao.editMission(
              mission: mission,
              companion: MissionsCompanion(name: Value(name)),
            );
            invalidateProviders(ref);
          },
          header: 'Mission name',
        ),
        PointListTile(
          point: Point(mission.x, mission.y),
          onChanged: (final point) async {
            await dao.editMission(
              mission: mission,
              companion: MissionsCompanion(
                x: Value(point.x),
                y: Value(point.y),
              ),
            );
            invalidateProviders(ref);
          },
          title: 'Initial coordinates',
        ),
      ],
    ),
    error: ErrorListView.withPositional,
    loading: LoadingWidget.new,
  ),
);
```

I can write code like:

```dart
    final database = ref.watch(databaseProvider);
    final missions = database.missions;
    final value = ref.watch(missionProvider(missionId));
    return value.when(
      data: (final mission) {
        final id = mission.id;
        return DriftEditorScreen(
          columnHandlers: [
            StringColumnHandler(
              value: mission.name,
              column: missions.name,
            ),
            PointColumnHandler(
              xColumn: missions.x,
              yColumn: missions.y,
              value: Point(mission.x, mission.y),
              title: 'Initial coordinates',
            ),
          ],
          title: 'Edit Mission',
          database: database,
          tableInfo: missions,
          primaryKeyColumn: missions.id,
          primaryKey: id,
          onChanged: () => invalidateProviders(ref),
        );
      },
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
```

If you would rather write your own screen, the [ColumnsListView] widget can be used directly.
