// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_flavors/test/mock/mock_events_with_label_cubit.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:bloc/bloc.dart' as _i6;
import 'package:flutter_customizable_calendar/flutter_customizable_calendar.dart'
    as _i5;
import 'package:flutter_flavors/common/event_with_label/events_with_label_cubit.dart'
    as _i3;
import 'package:flutter_flavors/database/repositories/events_with_label_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEventsWithLabelRepository_0 extends _i1.SmartFake
    implements _i2.EventsWithLabelRepository {
  _FakeEventsWithLabelRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEventsWithLabelState_1 extends _i1.SmartFake
    implements _i3.EventsWithLabelState {
  _FakeEventsWithLabelState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [EventsWithLabelCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventsWithLabelCubit extends _i1.Mock
    implements _i3.EventsWithLabelCubit {
  @override
  _i2.EventsWithLabelRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeEventsWithLabelRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeEventsWithLabelRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.EventsWithLabelRepository);

  @override
  _i3.EventsWithLabelState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeEventsWithLabelState_1(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeEventsWithLabelState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.EventsWithLabelState);

  @override
  _i4.Stream<_i3.EventsWithLabelState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i3.EventsWithLabelState>.empty(),
        returnValueForMissingStub: _i4.Stream<_i3.EventsWithLabelState>.empty(),
      ) as _i4.Stream<_i3.EventsWithLabelState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i4.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updateEvent(_i5.FloatingCalendarEvent? value) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateEvent,
          [value],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> addEvent(_i5.FloatingCalendarEvent? value) =>
      (super.noSuchMethod(
        Invocation.method(
          #addEvent,
          [value],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteEvent(_i5.FloatingCalendarEvent? value) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteEvent,
          [value],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  void emit(_i3.EventsWithLabelState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i6.Change<_i3.EventsWithLabelState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
