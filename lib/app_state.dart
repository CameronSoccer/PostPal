import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _scheduledNotificationTimes = prefs
              .getStringList('ff_scheduledNotificationTimes')
              ?.map((x) => DateTime.fromMillisecondsSinceEpoch(int.parse(x)))
              .toList() ??
          _scheduledNotificationTimes;
    });
    _safeInit(() {
      _lastGreetingTime = prefs.containsKey('ff_lastGreetingTime')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastGreetingTime')!)
          : _lastGreetingTime;
    });
    _safeInit(() {
      _greeting = prefs.getString('ff_greeting') ?? _greeting;
    });
    _safeInit(() {
      _weeklyGenerations =
          prefs.getInt('ff_weeklyGenerations') ?? _weeklyGenerations;
    });
    _safeInit(() {
      _weeklyGenerationsDate = prefs.containsKey('ff_weeklyGenerationsDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_weeklyGenerationsDate')!)
          : _weeklyGenerationsDate;
    });
    _safeInit(() {
      _darkModeSet = prefs.getBool('ff_darkModeSet') ?? _darkModeSet;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DateTime> _scheduledNotificationTimes = [];
  List<DateTime> get scheduledNotificationTimes => _scheduledNotificationTimes;
  set scheduledNotificationTimes(List<DateTime> value) {
    _scheduledNotificationTimes = value;
    prefs.setStringList('ff_scheduledNotificationTimes',
        value.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void addToScheduledNotificationTimes(DateTime value) {
    scheduledNotificationTimes.add(value);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void removeFromScheduledNotificationTimes(DateTime value) {
    scheduledNotificationTimes.remove(value);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void removeAtIndexFromScheduledNotificationTimes(int index) {
    scheduledNotificationTimes.removeAt(index);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void updateScheduledNotificationTimesAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    scheduledNotificationTimes[index] =
        updateFn(_scheduledNotificationTimes[index]);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void insertAtIndexInScheduledNotificationTimes(int index, DateTime value) {
    scheduledNotificationTimes.insert(index, value);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  DateTime? _lastGreetingTime =
      DateTime.fromMillisecondsSinceEpoch(1699550940000);
  DateTime? get lastGreetingTime => _lastGreetingTime;
  set lastGreetingTime(DateTime? value) {
    _lastGreetingTime = value;
    value != null
        ? prefs.setInt('ff_lastGreetingTime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastGreetingTime');
  }

  String _greeting = '';
  String get greeting => _greeting;
  set greeting(String value) {
    _greeting = value;
    prefs.setString('ff_greeting', value);
  }

  TempImageDocumentStruct _tempImageDocument = TempImageDocumentStruct();
  TempImageDocumentStruct get tempImageDocument => _tempImageDocument;
  set tempImageDocument(TempImageDocumentStruct value) {
    _tempImageDocument = value;
  }

  void updateTempImageDocumentStruct(
      Function(TempImageDocumentStruct) updateFn) {
    updateFn(_tempImageDocument);
  }

  int _weeklyGenerations = 10;
  int get weeklyGenerations => _weeklyGenerations;
  set weeklyGenerations(int value) {
    _weeklyGenerations = value;
    prefs.setInt('ff_weeklyGenerations', value);
  }

  DateTime? _weeklyGenerationsDate =
      DateTime.fromMillisecondsSinceEpoch(1699564320000);
  DateTime? get weeklyGenerationsDate => _weeklyGenerationsDate;
  set weeklyGenerationsDate(DateTime? value) {
    _weeklyGenerationsDate = value;
    value != null
        ? prefs.setInt('ff_weeklyGenerationsDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_weeklyGenerationsDate');
  }

  bool _darkModeSet = false;
  bool get darkModeSet => _darkModeSet;
  set darkModeSet(bool value) {
    _darkModeSet = value;
    prefs.setBool('ff_darkModeSet', value);
  }

  final _stylesManager = StreamRequestManager<List<AdminRecord>>();
  Stream<List<AdminRecord>> styles({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<AdminRecord>> Function() requestFn,
  }) =>
      _stylesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStylesCache() => _stylesManager.clear();
  void clearStylesCacheKey(String? uniqueKey) =>
      _stylesManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
