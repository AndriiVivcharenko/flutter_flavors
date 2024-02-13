import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_customizable_calendar/flutter_customizable_calendar.dart';
import 'package:flutter_flavors/colors.dart';
import 'package:flutter_flavors/common/event_with_label/event_label.dart';
import 'package:flutter_flavors/common/event_with_label/event_with_label.dart';
import 'package:flutter_flavors/common/event_with_label/events_with_label_cubit.dart';
import 'package:flutter_flavors/database/app_database.dart';
import 'package:flutter_flavors/database/repositories/events_with_label_repository.dart';
import 'package:flutter_flavors/pages/add_event_page.dart';
import 'package:flutter_flavors/pages/days_view_page.dart';
import 'package:flutter_flavors/repositories/remote_config_repository.dart';
import 'package:intl/intl.dart';

class ScheduleListViewWithDaysView extends StatefulWidget {
  const ScheduleListViewWithDaysView({super.key});

  @override
  State<ScheduleListViewWithDaysView> createState() =>
      _ScheduleListViewWithDaysViewState();
}

class _ScheduleListViewWithDaysViewState
    extends State<ScheduleListViewWithDaysView> {
  final ScheduleListViewController _scheduleListViewController =
      ScheduleListViewController();

  @override
  void dispose() {
    _scheduleListViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsWithLabelCubit>(
      create: (context) => EventsWithLabelCubit(
        repository: context.read<EventsWithLabelRepository>(),
      )..init(),
      child: Scaffold(
        backgroundColor: ExampleColors.white,
        body: SafeArea(
          bottom: false,
          child: BlocBuilder<EventsWithLabelCubit, EventsWithLabelState>(
            builder: (context, state) {
              if (state is EventsWithLabelInitial ||
                  state is EventsWithLabelLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is EventsWithLabelInitialized) {
                return ScheduleListView(
                  controller: _scheduleListViewController,
                  events: state.events,
                  ignoreDaysWithoutEvents: true,
                  monthPickerBuilder: (
                    context,
                    nextMonth,
                    prevMonth,
                    toTime,
                    currentTime,
                  ) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: ExampleColors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat.MMMM().format(currentTime),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 36,
                                      color: ExampleColors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    DateFormat.y().format(currentTime),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: ExampleColors.black,
                                      height: 1.75,
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  _onAddClicked(
                                    context,
                                    currentTime,
                                    context.read<EventsWithLabelCubit>(),
                                    false,
                                  );
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ExampleColors.swatch24(),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ExampleColors.black
                                            .withOpacity(0.25),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.add_outlined,
                                      color: ExampleColors.white,
                                      size: 36,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  dayBuilder: (context, data, date) {
                    final events = data.cast<EventWithLabel>();
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          final remoteConfigRepository =
                              context.read<RemoteConfigRepository>();

                          final showDaysView =
                              remoteConfigRepository.showDaysView;

                          if (showDaysView) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DaysViewPage(
                                  focusedDay: data.first.start,
                                  onAddClicked: (
                                    c,
                                    focusedDay,
                                  ) {
                                    _onAddClicked(
                                      c,
                                      focusedDay,
                                      context.read<EventsWithLabelCubit>(),
                                      true,
                                    );
                                  },
                                  eventsCubit:
                                      context.read<EventsWithLabelCubit>(),
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ExampleColors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: ExampleColors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 64,
                                  child: Column(
                                    children: [
                                      Text(
                                        DateFormat.d().format(date),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 44,
                                            height: 0.95),
                                      ),
                                      Text(
                                        DateFormat.EEEE()
                                            .format(date)
                                            .substring(0, 3),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: ExampleColors.swatch3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (final event in events.take(2))
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                color: event.label.color,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(12.0),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              event.title,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: ExampleColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (events.length > 2)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 12,
                                              decoration: const BoxDecoration(
                                                color: ExampleColors.swatch3,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              "+${events.length - 2} more ${events.length == 3 ? "event" : "events"}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: ExampleColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void _onAddClicked(
    BuildContext c,
    DateTime initialDate,
    EventsWithLabelCubit cubit,
    bool timePicker,
  ) {
    Navigator.of(c)
        .push(
      MaterialPageRoute(
        builder: (context) => AddEventPage(
          initialDate: initialDate,
          timePicker: timePicker,
        ),
      ),
    )
        .then((value) {
      if (value is EventWithLabel) {
        cubit.addEvent(value);
      }
    });
  }
}
