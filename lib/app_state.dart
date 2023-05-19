import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _selectedDataset =
        prefs.getStringList('ff_selectedDataset') ?? _selectedDataset;
    _setChunkSize = prefs.getDouble('ff_setChunkSize') ?? _setChunkSize;
    _selectedDocuments =
        prefs.getStringList('ff_selectedDocuments') ?? _selectedDocuments;
    _setChat = prefs.getString('ff_setChat')?.ref ?? _setChat;
    if (prefs.containsKey('ff_apiSuccess')) {
      try {
        _apiSuccess = jsonDecode(prefs.getString('ff_apiSuccess') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _setDropdown = prefs.getString('ff_setDropdown') ?? _setDropdown;
    _setTopKplay = prefs.getInt('ff_setTopKplay') ?? _setTopKplay;
    _setTopKchat = prefs.getInt('ff_setTopKchat') ?? _setTopKchat;
    _setChatDropdown =
        prefs.getString('ff_setChatDropdown') ?? _setChatDropdown;
    _setChatGR = prefs.getString('ff_setChatGR') ?? _setChatGR;
    _chatPersSwitch = prefs.getBool('ff_chatPersSwitch') ?? _chatPersSwitch;
    _setTopK = prefs.getDouble('ff_setTopK') ?? _setTopK;
    _setSystem = prefs.getString('ff_setSystem') ?? _setSystem;
    _setContentPL = prefs.getString('ff_setContentPL') ?? _setContentPL;
    _setCompletionPL =
        prefs.getString('ff_setCompletionPL')?.ref ?? _setCompletionPL;
    _setPromptPL = prefs.getString('ff_setPromptPL') ?? _setPromptPL;
    _grOn = prefs.getBool('ff_grOn') ?? _grOn;
    _chatGPTengine = prefs.getString('ff_chatGPTengine') ?? _chatGPTengine;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _activeDataset =
      FirebaseFirestore.instance.doc('/user_datasets/unset');
  DocumentReference? get activeDataset => _activeDataset;
  set activeDataset(DocumentReference? _value) {
    _activeDataset = _value;
  }

  DocumentReference? _unsetDataset =
      FirebaseFirestore.instance.doc('/user_datasets/unset');
  DocumentReference? get unsetDataset => _unsetDataset;
  set unsetDataset(DocumentReference? _value) {
    _unsetDataset = _value;
  }

  List<String> _selectedDataset = [];
  List<String> get selectedDataset => _selectedDataset;
  set selectedDataset(List<String> _value) {
    _selectedDataset = _value;
    prefs.setStringList('ff_selectedDataset', _value);
  }

  void addToSelectedDataset(String _value) {
    _selectedDataset.add(_value);
    prefs.setStringList('ff_selectedDataset', _selectedDataset);
  }

  void removeFromSelectedDataset(String _value) {
    _selectedDataset.remove(_value);
    prefs.setStringList('ff_selectedDataset', _selectedDataset);
  }

  void removeAtIndexFromSelectedDataset(int _index) {
    _selectedDataset.removeAt(_index);
    prefs.setStringList('ff_selectedDataset', _selectedDataset);
  }

  void updateSelectedDatasetAtIndex(
    int _index,
    Function(String) updateFn,
  ) {
    updateFn(_selectedDataset[_index]);
    prefs.setStringList('ff_selectedDataset', _selectedDataset);
  }

  String _setQid = '';
  String get setQid => _setQid;
  set setQid(String _value) {
    _setQid = _value;
  }

  String _setEngine = '';
  String get setEngine => _setEngine;
  set setEngine(String _value) {
    _setEngine = _value;
  }

  DocumentReference? _setCompletion;
  DocumentReference? get setCompletion => _setCompletion;
  set setCompletion(DocumentReference? _value) {
    _setCompletion = _value;
  }

  double _setChunkSize = 1;
  double get setChunkSize => _setChunkSize;
  set setChunkSize(double _value) {
    _setChunkSize = _value;
    prefs.setDouble('ff_setChunkSize', _value);
  }

  List<String> _selectedDocuments = [];
  List<String> get selectedDocuments => _selectedDocuments;
  set selectedDocuments(List<String> _value) {
    _selectedDocuments = _value;
    prefs.setStringList('ff_selectedDocuments', _value);
  }

  void addToSelectedDocuments(String _value) {
    _selectedDocuments.add(_value);
    prefs.setStringList('ff_selectedDocuments', _selectedDocuments);
  }

  void removeFromSelectedDocuments(String _value) {
    _selectedDocuments.remove(_value);
    prefs.setStringList('ff_selectedDocuments', _selectedDocuments);
  }

  void removeAtIndexFromSelectedDocuments(int _index) {
    _selectedDocuments.removeAt(_index);
    prefs.setStringList('ff_selectedDocuments', _selectedDocuments);
  }

  void updateSelectedDocumentsAtIndex(
    int _index,
    Function(String) updateFn,
  ) {
    updateFn(_selectedDocuments[_index]);
    prefs.setStringList('ff_selectedDocuments', _selectedDocuments);
  }

  bool _sourcesOn = false;
  bool get sourcesOn => _sourcesOn;
  set sourcesOn(bool _value) {
    _sourcesOn = _value;
  }

  DocumentReference? _setChat;
  DocumentReference? get setChat => _setChat;
  set setChat(DocumentReference? _value) {
    _setChat = _value;
    _value != null
        ? prefs.setString('ff_setChat', _value.path)
        : prefs.remove('ff_setChat');
  }

  String _setSummaryTemplate = 'Write a detailed summary:';
  String get setSummaryTemplate => _setSummaryTemplate;
  set setSummaryTemplate(String _value) {
    _setSummaryTemplate = _value;
  }

  String _testAPI = '';
  String get testAPI => _testAPI;
  set testAPI(String _value) {
    _testAPI = _value;
  }

  String _testAPIbody = '';
  String get testAPIbody => _testAPIbody;
  set testAPIbody(String _value) {
    _testAPIbody = _value;
  }

  dynamic _apiError = jsonDecode('{\"message\":\"error\"}');
  dynamic get apiError => _apiError;
  set apiError(dynamic _value) {
    _apiError = _value;
  }

  dynamic _apiSuccess = jsonDecode('{\"message\":\"success\"}');
  dynamic get apiSuccess => _apiSuccess;
  set apiSuccess(dynamic _value) {
    _apiSuccess = _value;
    prefs.setString('ff_apiSuccess', jsonEncode(_value));
  }

  List<String> _chainDropdown = [
    'My Data + GPT',
    'GPT Only',
    'Summarize',
    'My Data Only'
  ];
  List<String> get chainDropdown => _chainDropdown;
  set chainDropdown(List<String> _value) {
    _chainDropdown = _value;
  }

  void addToChainDropdown(String _value) {
    _chainDropdown.add(_value);
  }

  void removeFromChainDropdown(String _value) {
    _chainDropdown.remove(_value);
  }

  void removeAtIndexFromChainDropdown(int _index) {
    _chainDropdown.removeAt(_index);
  }

  void updateChainDropdownAtIndex(
    int _index,
    Function(String) updateFn,
  ) {
    updateFn(_chainDropdown[_index]);
  }

  String _setDropdown = 'My Data + GPT';
  String get setDropdown => _setDropdown;
  set setDropdown(String _value) {
    _setDropdown = _value;
    prefs.setString('ff_setDropdown', _value);
  }

  int _setTopKplay = 5;
  int get setTopKplay => _setTopKplay;
  set setTopKplay(int _value) {
    _setTopKplay = _value;
    prefs.setInt('ff_setTopKplay', _value);
  }

  int _setTopKchat = 5;
  int get setTopKchat => _setTopKchat;
  set setTopKchat(int _value) {
    _setTopKchat = _value;
    prefs.setInt('ff_setTopKchat', _value);
  }

  String _setChatDropdown = 'My Data + GPT';
  String get setChatDropdown => _setChatDropdown;
  set setChatDropdown(String _value) {
    _setChatDropdown = _value;
    prefs.setString('ff_setChatDropdown', _value);
  }

  String _setChatGR = 'no';
  String get setChatGR => _setChatGR;
  set setChatGR(String _value) {
    _setChatGR = _value;
    prefs.setString('ff_setChatGR', _value);
  }

  bool _chatPersSwitch = false;
  bool get chatPersSwitch => _chatPersSwitch;
  set chatPersSwitch(bool _value) {
    _chatPersSwitch = _value;
    prefs.setBool('ff_chatPersSwitch', _value);
  }

  int _version = 30;
  int get version => _version;
  set version(int _value) {
    _version = _value;
  }

  String _apiErrortxt = '{\"message\":\"error\"}';
  String get apiErrortxt => _apiErrortxt;
  set apiErrortxt(String _value) {
    _apiErrortxt = _value;
  }

  String _setCid = '';
  String get setCid => _setCid;
  set setCid(String _value) {
    _setCid = _value;
  }

  String _currentPage = '';
  String get currentPage => _currentPage;
  set currentPage(String _value) {
    _currentPage = _value;
  }

  double _setTopK = 5;
  double get setTopK => _setTopK;
  set setTopK(double _value) {
    _setTopK = _value;
    prefs.setDouble('ff_setTopK', _value);
  }

  String _setSystem = '';
  String get setSystem => _setSystem;
  set setSystem(String _value) {
    _setSystem = _value;
    prefs.setString('ff_setSystem', _value);
  }

  String _setContentPL = '';
  String get setContentPL => _setContentPL;
  set setContentPL(String _value) {
    _setContentPL = _value;
    prefs.setString('ff_setContentPL', _value);
  }

  DocumentReference? _setCompletionPL;
  DocumentReference? get setCompletionPL => _setCompletionPL;
  set setCompletionPL(DocumentReference? _value) {
    _setCompletionPL = _value;
    _value != null
        ? prefs.setString('ff_setCompletionPL', _value.path)
        : prefs.remove('ff_setCompletionPL');
  }

  String _setPromptPL = '';
  String get setPromptPL => _setPromptPL;
  set setPromptPL(String _value) {
    _setPromptPL = _value;
    prefs.setString('ff_setPromptPL', _value);
  }

  List<String> _emptyList = [];
  List<String> get emptyList => _emptyList;
  set emptyList(List<String> _value) {
    _emptyList = _value;
  }

  void addToEmptyList(String _value) {
    _emptyList.add(_value);
  }

  void removeFromEmptyList(String _value) {
    _emptyList.remove(_value);
  }

  void removeAtIndexFromEmptyList(int _index) {
    _emptyList.removeAt(_index);
  }

  void updateEmptyListAtIndex(
    int _index,
    Function(String) updateFn,
  ) {
    updateFn(_emptyList[_index]);
  }

  bool _grOn = false;
  bool get grOn => _grOn;
  set grOn(bool _value) {
    _grOn = _value;
    prefs.setBool('ff_grOn', _value);
  }

  String _setShareCID = '';
  String get setShareCID => _setShareCID;
  set setShareCID(String _value) {
    _setShareCID = _value;
  }

  String _chatGPTengine = 'gpt-3.5-turbo';
  String get chatGPTengine => _chatGPTengine;
  set chatGPTengine(String _value) {
    _chatGPTengine = _value;
    prefs.setString('ff_chatGPTengine', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
