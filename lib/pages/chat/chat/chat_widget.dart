import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chat/chat_chunks/chat_chunks_widget.dart';
import '/pages/chat/chat_history/chat_history_widget.dart';
import '/pages/chat/configure_bot/configure_bot_widget.dart';
import '/pages/chat/empt_chat/empt_chat_widget.dart';
import '/pages/datasets/add_dataset/add_dataset_widget.dart';
import '/pages/datasets/new_dataset_button/new_dataset_button_widget.dart';
import '/pages/prompt_lab/empty_promtlab/empty_promtlab_widget.dart';
import '/pages/prompt_lab/prompts_main/prompts_main_widget.dart';
import '/pages/prompt_lab/prompts_sub/prompts_sub_widget.dart';
import '/sharing/share_popup/share_popup_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    this.plPrompt,
  }) : super(key: key);

  final String? plPrompt;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Chat'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_PAGE_Chat_ON_INIT_STATE');
      logFirebaseEvent('Chat_update_app_state');
      setState(() {
        FFAppState().currentPage = 'Chat';
      });
      logFirebaseEvent('Chat_scroll_to');
      await _model.chatColumn?.animateTo(
        _model.chatColumn!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.startFieldController ??= TextEditingController(
        text: widget.plPrompt != null && widget.plPrompt != ''
            ? widget.plPrompt
            : '');
    _model.sendFieldController ??= TextEditingController(
        text: widget.plPrompt != null && widget.plPrompt != ''
            ? widget.plPrompt
            : '');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: Container(
          width: 400.0,
          child: Drawer(
            elevation: 16.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('CHAT_PAGE_Container_1qxxq7oz_ON_TAP');
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed('promptLab');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.flask,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Promp Lab',
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 4.0, 0.0),
                          child: StreamBuilder<List<PromptlabRecord>>(
                            stream: queryPromptlabRecord(
                              parent: currentUserReference,
                              queryBuilder: (promptlabRecord) =>
                                  promptlabRecord.orderBy('folder_name'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitRipple(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<PromptlabRecord> columnPromptlabRecordList =
                                  snapshot.data!;
                              if (columnPromptlabRecordList.isEmpty) {
                                return Center(
                                  child: EmptyPromtlabWidget(),
                                );
                              }
                              return SingleChildScrollView(
                                controller: _model.columnController2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnPromptlabRecordList.length,
                                      (columnIndex) {
                                    final columnPromptlabRecord =
                                        columnPromptlabRecordList[columnIndex];
                                    return Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CHAT_PAGE_Container_3pfr7w8p_ON_TAP');
                                                      if (_model.openFolder ==
                                                          columnPromptlabRecord
                                                              .reference) {
                                                        logFirebaseEvent(
                                                            'Container_update_widget_state');
                                                        setState(() {
                                                          _model.openFolder =
                                                              null;
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_update_widget_state');
                                                        setState(() {
                                                          _model.openFolder =
                                                              columnPromptlabRecord
                                                                  .reference;
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (_model
                                                                      .openFolder !=
                                                                  columnPromptlabRecord
                                                                      .reference)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .solidFolder,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 14.0,
                                                                  ),
                                                                ),
                                                              if (_model
                                                                      .openFolder ==
                                                                  columnPromptlabRecord
                                                                      .reference)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .folderOpen,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 14.0,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        3.0,
                                                                        0.0,
                                                                        3.0),
                                                            child: Text(
                                                              columnPromptlabRecord
                                                                  .folderName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model.openFolder ==
                                                      columnPromptlabRecord
                                                          .reference)
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (_model.openFolder ==
                                              columnPromptlabRecord.reference)
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(36.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final children =
                                                            columnPromptlabRecord
                                                                .children!
                                                                .toList()
                                                                .take(10)
                                                                .toList();
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              children.length,
                                                          itemBuilder: (context,
                                                              childrenIndex) {
                                                            final childrenItem =
                                                                children[
                                                                    childrenIndex];
                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('CHAT_PAGE_Container_8hlq9bnv_ON_TAP');
                                                                            if (_model.openSub ==
                                                                                childrenItem.docRef) {
                                                                              logFirebaseEvent('Container_update_widget_state');
                                                                              setState(() {
                                                                                _model.openSub = null;
                                                                              });
                                                                            } else {
                                                                              logFirebaseEvent('Container_update_widget_state');
                                                                              setState(() {
                                                                                _model.openSub = childrenItem.docRef;
                                                                              });
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    if (valueOrDefault<bool>(
                                                                                      _model.openSub == childrenItem.docRef,
                                                                                      true,
                                                                                    ))
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.folderOpen,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 14.0,
                                                                                        ),
                                                                                      ),
                                                                                    if (valueOrDefault<bool>(
                                                                                      _model.openSub != childrenItem.docRef,
                                                                                      true,
                                                                                    ))
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.solidFolder,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 14.0,
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Text(
                                                                                  childrenItem.folderName!,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (_model.openSub ==
                                                                            childrenItem.docRef)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                15.0,
                                                                                2.0,
                                                                                0.0,
                                                                                2.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (valueOrDefault<
                                                                      bool>(
                                                                    _model.openSub ==
                                                                        childrenItem
                                                                            .docRef,
                                                                    true,
                                                                  ))
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                PromptsSubWidget(
                                                                              key: Key('Keyl09_${childrenIndex}_of_${children.length}'),
                                                                              subFolder: _model.openSub,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          controller: _model
                                                              .listViewController2,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                PromptsMainWidget(
                                                              key: Key(
                                                                  'Keydmj_${columnIndex}_of_${columnPromptlabRecordList.length}'),
                                                              plpromptsMain:
                                                                  _model
                                                                      .openFolder,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.mainMenuModel,
                                    updateCallback: () => setState(() {}),
                                    child: MainMenuWidget(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: MediaQuery.of(context).size.height *
                                        1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 5.0,
                                                                5.0, 5.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'CHAT_PAGE_CONFIGURE_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Color(0x1DFFFFFF),
                                                          barrierColor:
                                                              Color(0x1DFFFFFF),
                                                          enableDrag: false,
                                                          context: context,
                                                          builder:
                                                              (bottomSheetContext) {
                                                            return GestureDetector(
                                                              onTap: () => FocusScope
                                                                      .of(
                                                                          context)
                                                                  .requestFocus(
                                                                      _unfocusNode),
                                                              child: Padding(
                                                                padding: MediaQuery.of(
                                                                        bottomSheetContext)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      1.0,
                                                                  child:
                                                                      ConfigureBotWidget(
                                                                    chatMeta:
                                                                        FFAppState()
                                                                            .setChat,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      text: 'Configure',
                                                      icon: Icon(
                                                        Icons.settings_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 130.0,
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 5.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'CHAT_PAGE_CHAT_HISTORY_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          barrierColor:
                                                              Color(0x1A090F13),
                                                          enableDrag: false,
                                                          context: context,
                                                          builder:
                                                              (bottomSheetContext) {
                                                            return GestureDetector(
                                                              onTap: () => FocusScope
                                                                      .of(
                                                                          context)
                                                                  .requestFocus(
                                                                      _unfocusNode),
                                                              child: Padding(
                                                                padding: MediaQuery.of(
                                                                        bottomSheetContext)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.8,
                                                                  child:
                                                                      ChatHistoryWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      text: 'Chat History',
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.clock,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 130.0,
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                10.0, 5.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'CHAT_PAGE_CLEAR_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_update_app_state');
                                                        FFAppState().update(() {
                                                          FFAppState().setCid =
                                                              '';
                                                          FFAppState().setChat =
                                                              null;
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_clear_text_fields');
                                                        setState(() {
                                                          _model
                                                              .startFieldController
                                                              ?.clear();
                                                          _model
                                                              .sendFieldController
                                                              ?.clear();
                                                        });
                                                      },
                                                      text: 'Clear',
                                                      icon: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false))
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CHAT_PAGE_SHARE_BTN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button_update_widget_state');
                                                              setState(() {
                                                                _model.setBid =
                                                                    random_data
                                                                        .randomString(
                                                                  9,
                                                                  9,
                                                                  true,
                                                                  false,
                                                                  true,
                                                                );
                                                              });
                                                              logFirebaseEvent(
                                                                  'Button_backend_call');

                                                              final sharedBotsCreateData =
                                                                  {
                                                                ...createSharedBotsRecordData(
                                                                  bid: _model
                                                                      .setBid,
                                                                  guardrail: valueOrDefault(currentUserDocument?.chatGr, '') !=
                                                                              null &&
                                                                          valueOrDefault(currentUserDocument?.chatGr, '') !=
                                                                              ''
                                                                      ? valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.chatGr,
                                                                          '')
                                                                      : '',
                                                                  system: valueOrDefault(currentUserDocument?.chatPersonality, '') !=
                                                                              null &&
                                                                          valueOrDefault(currentUserDocument?.chatPersonality, '') !=
                                                                              ''
                                                                      ? valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.chatPersonality,
                                                                          '')
                                                                      : '',
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                  topK: FFAppState()
                                                                      .setTopKchat
                                                                      .toDouble(),
                                                                  image: valueOrDefault(currentUserDocument?.chatImage, '') !=
                                                                              null &&
                                                                          valueOrDefault(currentUserDocument?.chatImage, '') !=
                                                                              ''
                                                                      ? valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.chatImage,
                                                                          '')
                                                                      : random_data
                                                                          .randomImageUrl(
                                                                          200,
                                                                          200,
                                                                        ),
                                                                ),
                                                                'doc_ids':
                                                                    FFAppState()
                                                                        .selectedDocuments,
                                                              };
                                                              var sharedBotsRecordReference =
                                                                  SharedBotsRecord
                                                                      .collection
                                                                      .doc();
                                                              await sharedBotsRecordReference
                                                                  .set(
                                                                      sharedBotsCreateData);
                                                              _model.createBot =
                                                                  SharedBotsRecord
                                                                      .getDocumentFromData(
                                                                          sharedBotsCreateData,
                                                                          sharedBotsRecordReference);
                                                              logFirebaseEvent(
                                                                  'Button_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .overlay,
                                                                barrierColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .overlay,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (bottomSheetContext) {
                                                                  return GestureDetector(
                                                                    onTap: () => FocusScope.of(
                                                                            context)
                                                                        .requestFocus(
                                                                            _unfocusNode),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery.of(
                                                                              bottomSheetContext)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            1.0,
                                                                        child:
                                                                            SharePopupWidget(
                                                                          bid: _model
                                                                              .setBid,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              setState(() {});
                                                            },
                                                            text: 'Share',
                                                            icon: Icon(
                                                              Icons
                                                                  .share_rounded,
                                                              size: 16.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 130.0,
                                                              height: 30.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ChatsRecord>>(
                                                            stream:
                                                                queryChatsRecord(
                                                              parent:
                                                                  currentUserReference,
                                                              queryBuilder: (chatsRecord) => chatsRecord
                                                                  .where('cid',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .setCid)
                                                                  .orderBy(
                                                                      'timestamp'),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ChatsRecord>
                                                                  chatColumnChatsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              if (chatColumnChatsRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child:
                                                                      EmptChatWidget(),
                                                                );
                                                              }
                                                              return SingleChildScrollView(
                                                                controller: _model
                                                                    .chatColumn,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: List.generate(
                                                                      chatColumnChatsRecordList
                                                                          .length,
                                                                      (chatColumnIndex) {
                                                                    final chatColumnChatsRecord =
                                                                        chatColumnChatsRecordList[
                                                                            chatColumnIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          if (!chatColumnChatsRecord
                                                                              .isCompletion!)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 2.0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: 40.0,
                                                                                                height: 40.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                ),
                                                                                                child: AuthUserStreamWidget(
                                                                                                  builder: (context) => ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                    child: Image.network(
                                                                                                      currentUserPhoto,
                                                                                                      width: 40.0,
                                                                                                      height: 40.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 5.0),
                                                                                                    child: SelectionArea(
                                                                                                        child: Text(
                                                                                                      chatColumnChatsRecord.prompt!,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            fontSize: 16.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    )),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          dateTimeFormat('relative', chatColumnChatsRecord.timestamp!),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 10.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('CHAT_PAGE_Icon_d5n0sx84_ON_TAP');
                                                                                                            logFirebaseEvent('Icon_copy_to_clipboard');
                                                                                                            await Clipboard.setData(ClipboardData(text: chatColumnChatsRecord.prompt!));
                                                                                                          },
                                                                                                          child: FaIcon(
                                                                                                            FontAwesomeIcons.copy,
                                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                                            size: 14.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('CHAT_PAGE_Icon_blrwndfc_ON_TAP');
                                                                                                            logFirebaseEvent('Icon_backend_call');
                                                                                                            await chatColumnChatsRecord.reference.delete();
                                                                                                          },
                                                                                                          child: FaIcon(
                                                                                                            FontAwesomeIcons.trashAlt,
                                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                                            size: 14.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (chatColumnChatsRecord.isCompletion ??
                                                                              true)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 15.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: Container(
                                                                                                width: 40.0,
                                                                                                height: 40.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                ),
                                                                                                child: Stack(
                                                                                                  children: [
                                                                                                    if (valueOrDefault(currentUserDocument?.chatImage, '') == null || valueOrDefault(currentUserDocument?.chatImage, '') == '')
                                                                                                      AuthUserStreamWidget(
                                                                                                        builder: (context) => Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            FaIcon(
                                                                                                              FontAwesomeIcons.robot,
                                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    if (valueOrDefault(currentUserDocument?.chatImage, '') != null && valueOrDefault(currentUserDocument?.chatImage, '') != '')
                                                                                                      AuthUserStreamWidget(
                                                                                                        builder: (context) => Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Card(
                                                                                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              elevation: 1.0,
                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                borderRadius: BorderRadius.circular(50.0),
                                                                                                              ),
                                                                                                              child: Container(
                                                                                                                width: 40.0,
                                                                                                                height: 40.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  image: DecorationImage(
                                                                                                                    fit: BoxFit.cover,
                                                                                                                    image: Image.network(
                                                                                                                      valueOrDefault(currentUserDocument?.chatImage, ''),
                                                                                                                    ).image,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Stack(
                                                                                                    children: [
                                                                                                      if (chatColumnChatsRecord.isLoading ?? true)
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 5.0),
                                                                                                            child: Text(
                                                                                                              'Typing...',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).green,
                                                                                                                    fontSize: 16.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          if (!chatColumnChatsRecord.isLoading!)
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 5.0),
                                                                                                                child: SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  chatColumnChatsRecord.completion!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: chatColumnChatsRecord.isError! ? Color(0xFF980000) : FlutterFlowTheme.of(context).accentTwo,
                                                                                                                        fontSize: 16.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                        lineHeight: 1.4,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ),
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                          child: Text(
                                                                                                            dateTimeFormat('relative', chatColumnChatsRecord.timestamp!),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 10.0,
                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                        child: Icon(
                                                                                                          Icons.search,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 14.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('CHAT_PAGE_Text_2izxnngc_ON_TAP');
                                                                                                            logFirebaseEvent('Text_bottom_sheet');
                                                                                                            await showModalBottomSheet(
                                                                                                              isScrollControlled: true,
                                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              barrierColor: Color(0x1A090F13),
                                                                                                              enableDrag: false,
                                                                                                              context: context,
                                                                                                              builder: (bottomSheetContext) {
                                                                                                                return GestureDetector(
                                                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                  child: Padding(
                                                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                    child: Container(
                                                                                                                      height: MediaQuery.of(context).size.height * 0.8,
                                                                                                                      child: ChatChunksWidget(
                                                                                                                        chatDoc: chatColumnChatsRecord,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => setState(() {}));
                                                                                                          },
                                                                                                          child: Text(
                                                                                                            'Sources',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('CHAT_PAGE_Icon_xrvap7xg_ON_TAP');
                                                                                                            logFirebaseEvent('Icon_copy_to_clipboard');
                                                                                                            await Clipboard.setData(ClipboardData(text: chatColumnChatsRecord.completion!));
                                                                                                          },
                                                                                                          child: FaIcon(
                                                                                                            FontAwesomeIcons.copy,
                                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                                            size: 14.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          logFirebaseEvent('CHAT_PAGE_Icon_fs011uui_ON_TAP');
                                                                                                          logFirebaseEvent('Icon_backend_call');
                                                                                                          await chatColumnChatsRecord.reference.delete();
                                                                                                        },
                                                                                                        child: FaIcon(
                                                                                                          FontAwesomeIcons.trashAlt,
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          size: 14.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  }),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        12.0),
                                                                child:
                                                                    MouseRegion(
                                                                  opaque: true,
                                                                  cursor: SystemMouseCursors
                                                                          .click ??
                                                                      MouseCursor
                                                                          .defer,
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CHAT_PAGE_Container_6omxq56t_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Container_drawer');
                                                                      scaffoldKey
                                                                          .currentState!
                                                                          .openEndDrawer();
                                                                    },
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          2.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: _model.mouseEnter
                                                                              ? FlutterFlowTheme.of(context).secondary
                                                                              : Color(0x2D79C7E3),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.flask,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onEnter:
                                                                      ((event) async {
                                                                    setState(() =>
                                                                        _model.mouseRegionHovered =
                                                                            true);
                                                                    logFirebaseEvent(
                                                                        'CHAT_MouseRegion_sqpf85dq_ON_TOGGLE_ON');
                                                                    logFirebaseEvent(
                                                                        'MouseRegion_update_widget_state');
                                                                    setState(
                                                                        () {
                                                                      _model.mouseEnter =
                                                                          true;
                                                                    });
                                                                  }),
                                                                  onExit:
                                                                      ((event) async {
                                                                    setState(() =>
                                                                        _model.mouseRegionHovered =
                                                                            false);
                                                                    logFirebaseEvent(
                                                                        'CHAT_MouseRegion_sqpf85dq_ON_TOGGLE_OFF');
                                                                    logFirebaseEvent(
                                                                        'MouseRegion_update_widget_state');
                                                                    setState(
                                                                        () {
                                                                      _model.mouseEnter =
                                                                          false;
                                                                    });
                                                                  }),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Stack(
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if (FFAppState()
                                                                      .setCid ==
                                                                  null ||
                                                              FFAppState()
                                                                      .setCid ==
                                                                  '')
                                                            Form(
                                                              key: _model
                                                                  .formKey1,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .disabled,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .startFieldController,
                                                                onFieldSubmitted:
                                                                    (_) async {
                                                                  logFirebaseEvent(
                                                                      'CHAT_PAGE_startField_ON_TEXTFIELD_SUBMIT');
                                                                  logFirebaseEvent(
                                                                      'startField_update_app_state');
                                                                  FFAppState()
                                                                          .setCid =
                                                                      random_data
                                                                          .randomString(
                                                                    9,
                                                                    9,
                                                                    true,
                                                                    true,
                                                                    true,
                                                                  );
                                                                  // createMeta
                                                                  logFirebaseEvent(
                                                                      'startField_createMeta');

                                                                  final chatMetaCreateData =
                                                                      {
                                                                    ...createChatMetaRecordData(
                                                                      createdOn:
                                                                          getCurrentTimestamp,
                                                                      cid: FFAppState()
                                                                          .setCid,
                                                                      isLoading:
                                                                          true,
                                                                      uid:
                                                                          currentUserUid,
                                                                    ),
                                                                    'prompts': [
                                                                      _model
                                                                          .startFieldController
                                                                          .text
                                                                    ],
                                                                  };
                                                                  var chatMetaRecordReference =
                                                                      ChatMetaRecord
                                                                          .createDoc(
                                                                              currentUserReference!);
                                                                  await chatMetaRecordReference
                                                                      .set(
                                                                          chatMetaCreateData);
                                                                  _model.createChatForm =
                                                                      ChatMetaRecord.getDocumentFromData(
                                                                          chatMetaCreateData,
                                                                          chatMetaRecordReference);
                                                                  logFirebaseEvent(
                                                                      'startField_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .setChat =
                                                                        _model
                                                                            .createChatForm!
                                                                            .reference;
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'startField_backend_call');

                                                                  final chatsCreateData =
                                                                      {
                                                                    ...createChatsRecordData(
                                                                      cid: FFAppState()
                                                                          .setCid,
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                      isCompletion:
                                                                          false,
                                                                      qid: random_data
                                                                          .randomString(
                                                                        11,
                                                                        11,
                                                                        true,
                                                                        true,
                                                                        true,
                                                                      ),
                                                                      prompt: _model
                                                                          .startFieldController
                                                                          .text,
                                                                      uid:
                                                                          currentUserUid,
                                                                    ),
                                                                    'dataset_ids': _model
                                                                        .checkboxCheckedItems
                                                                        .map((e) =>
                                                                            e.datasetId)
                                                                        .withoutNulls
                                                                        .toList(),
                                                                  };
                                                                  var chatsRecordReference =
                                                                      ChatsRecord
                                                                          .createDoc(
                                                                              currentUserReference!);
                                                                  await chatsRecordReference
                                                                      .set(
                                                                          chatsCreateData);
                                                                  _model.createMessageForm =
                                                                      ChatsRecord.getDocumentFromData(
                                                                          chatsCreateData,
                                                                          chatsRecordReference);
                                                                  logFirebaseEvent(
                                                                      'startField_clear_text_fields');
                                                                  setState(() {
                                                                    _model
                                                                        .startFieldController
                                                                        ?.clear();
                                                                    _model
                                                                        .sendFieldController
                                                                        ?.clear();
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'startField_backend_call');
                                                                  _model.apiResultStartForm =
                                                                      await MixedChatCall
                                                                          .call(
                                                                    idToken:
                                                                        currentJwtToken,
                                                                    qid: _model
                                                                        .createMessageForm!
                                                                        .qid,
                                                                    cid: FFAppState()
                                                                        .setCid,
                                                                    datasetIdsList:
                                                                        FFAppState()
                                                                            .selectedDataset,
                                                                    topK: FFAppState()
                                                                        .setTopKchat,
                                                                    guardrail:
                                                                        FFAppState()
                                                                            .setChatGR,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'startField_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                          'Chat');

                                                                  logFirebaseEvent(
                                                                      'startField_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .setPromptPL = '';
                                                                  });

                                                                  setState(
                                                                      () {});
                                                                },
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'Ask a question or enter a prompt...',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF980000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF980000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  suffixIcon:
                                                                      Icon(
                                                                    Icons.send,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          18.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                                minLines: 1,
                                                                validator: _model
                                                                    .startFieldControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                      .setCid !=
                                                                  null &&
                                                              FFAppState()
                                                                      .setCid !=
                                                                  '')
                                                            Form(
                                                              key: _model
                                                                  .formKey2,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .disabled,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .sendFieldController,
                                                                onFieldSubmitted:
                                                                    (_) async {
                                                                  logFirebaseEvent(
                                                                      'CHAT_PAGE_sendField_ON_TEXTFIELD_SUBMIT');
                                                                  // sendMessage
                                                                  logFirebaseEvent(
                                                                      'sendField_sendMessage');

                                                                  final chatsCreateData =
                                                                      {
                                                                    ...createChatsRecordData(
                                                                      cid: FFAppState()
                                                                          .setCid,
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                      isCompletion:
                                                                          false,
                                                                      qid: random_data
                                                                          .randomString(
                                                                        11,
                                                                        11,
                                                                        true,
                                                                        true,
                                                                        true,
                                                                      ),
                                                                      prompt: _model
                                                                          .sendFieldController
                                                                          .text,
                                                                      uid:
                                                                          currentUserUid,
                                                                    ),
                                                                    'dataset_ids': _model
                                                                        .checkboxCheckedItems
                                                                        .map((e) =>
                                                                            e.datasetId)
                                                                        .withoutNulls
                                                                        .toList(),
                                                                  };
                                                                  var chatsRecordReference =
                                                                      ChatsRecord
                                                                          .createDoc(
                                                                              currentUserReference!);
                                                                  await chatsRecordReference
                                                                      .set(
                                                                          chatsCreateData);
                                                                  _model.chatMessageNewFromField =
                                                                      ChatsRecord.getDocumentFromData(
                                                                          chatsCreateData,
                                                                          chatsRecordReference);
                                                                  logFirebaseEvent(
                                                                      'sendField_backend_call');

                                                                  final chatMetaUpdateData =
                                                                      {
                                                                    'prompts':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      _model
                                                                          .sendFieldController
                                                                          .text
                                                                    ]),
                                                                  };
                                                                  await FFAppState()
                                                                      .setChat!
                                                                      .update(
                                                                          chatMetaUpdateData);
                                                                  logFirebaseEvent(
                                                                      'sendField_clear_text_fields');
                                                                  setState(() {
                                                                    _model
                                                                        .startFieldController
                                                                        ?.clear();
                                                                    _model
                                                                        .sendFieldController
                                                                        ?.clear();
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'sendField_scroll_to');
                                                                  await _model
                                                                      .chatColumn
                                                                      ?.animateTo(
                                                                    _model
                                                                        .chatColumn!
                                                                        .position
                                                                        .maxScrollExtent,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'sendField_backend_call');
                                                                  _model.apiResultzymFF =
                                                                      await MixedChatCall
                                                                          .call(
                                                                    idToken:
                                                                        currentJwtToken,
                                                                    qid: _model
                                                                        .chatMessageNewFromField!
                                                                        .qid,
                                                                    cid: FFAppState()
                                                                        .setCid,
                                                                    datasetIdsList:
                                                                        FFAppState()
                                                                            .selectedDataset,
                                                                    topK: FFAppState()
                                                                        .setTopKchat,
                                                                    guardrail:
                                                                        FFAppState()
                                                                            .setChatGR,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'sendField_wait__delay');
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1000));
                                                                  logFirebaseEvent(
                                                                      'sendField_scroll_to');
                                                                  await _model
                                                                      .chatColumn
                                                                      ?.animateTo(
                                                                    _model
                                                                        .chatColumn!
                                                                        .position
                                                                        .maxScrollExtent,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'sendField_wait__delay');
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1000));
                                                                  logFirebaseEvent(
                                                                      'sendField_scroll_to');
                                                                  await _model
                                                                      .chatColumn
                                                                      ?.animateTo(
                                                                    _model
                                                                        .chatColumn!
                                                                        .position
                                                                        .maxScrollExtent,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'sendField_wait__delay');
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1000));
                                                                  logFirebaseEvent(
                                                                      'sendField_scroll_to');
                                                                  await _model
                                                                      .chatColumn
                                                                      ?.animateTo(
                                                                    _model
                                                                        .chatColumn!
                                                                        .position
                                                                        .maxScrollExtent,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'sendField_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .setPromptPL = '';
                                                                  });

                                                                  setState(
                                                                      () {});
                                                                },
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'Continue your chat...',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF980000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF980000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  suffixIcon:
                                                                      Icon(
                                                                    Icons.send,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          18.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                                minLines: 1,
                                                                validator: _model
                                                                    .sendFieldControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: MediaQuery.of(context).size.height *
                                        1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        controller: _model.columnController1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'CHAT_PAGE_Text_3gtzk62e_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                              'Datasets');
                                                        },
                                                        child: Text(
                                                          'My Datasets',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'CHAT_PAGE_Icon_n1hmejsz_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    barrierColor:
                                                                        Color(
                                                                            0x1A090F13),
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (bottomSheetContext) {
                                                                      return GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(context).requestFocus(_unfocusNode),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.of(bottomSheetContext).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                400.0,
                                                                            child:
                                                                                AddDatasetWidget(),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .create_new_folder_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  size: 22.0,
                                                                ),
                                                              ),
                                                            ),
                                                            if (FFAppState()
                                                                    .selectedDataset
                                                                    .length >=
                                                                1)
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'CHAT_PAGE_Text_zip34qpk_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Text_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().selectedDataset =
                                                                              [];
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Text_navigate_to');

                                                                        context.pushNamed(
                                                                            'Home');
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Clear',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              fontSize: 11.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: 780.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: StreamBuilder<
                                                    List<UserDatasetsRecord>>(
                                                  stream:
                                                      queryUserDatasetsRecord(
                                                    parent:
                                                        currentUserReference,
                                                    queryBuilder:
                                                        (userDatasetsRecord) =>
                                                            userDatasetsRecord
                                                                .orderBy(
                                                                    'dataset_name'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child: SpinKitRipple(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UserDatasetsRecord>
                                                        listViewUserDatasetsRecordList =
                                                        snapshot.data!;
                                                    if (listViewUserDatasetsRecordList
                                                        .isEmpty) {
                                                      return Center(
                                                        child:
                                                            NewDatasetButtonWidget(),
                                                      );
                                                    }
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewUserDatasetsRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewUserDatasetsRecord =
                                                            listViewUserDatasetsRecordList[
                                                                listViewIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  1.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Theme(
                                                                              data: ThemeData(
                                                                                checkboxTheme: CheckboxThemeData(
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                  ),
                                                                                ),
                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                              child: Checkbox(
                                                                                value: _model.checkboxValueMap[listViewUserDatasetsRecord] ??= FFAppState().selectedDataset.contains(listViewUserDatasetsRecord.datasetId),
                                                                                onChanged: (newValue) async {
                                                                                  setState(() => _model.checkboxValueMap[listViewUserDatasetsRecord] = newValue!);
                                                                                  if (newValue!) {
                                                                                    logFirebaseEvent('CHAT_PAGE_Checkbox_dyj21xki_ON_TOGGLE_ON');
                                                                                    logFirebaseEvent('Checkbox_update_app_state');
                                                                                    setState(() {
                                                                                      FFAppState().addToSelectedDataset(listViewUserDatasetsRecord.datasetId!);
                                                                                    });
                                                                                  } else {
                                                                                    logFirebaseEvent('CHAT_Checkbox_dyj21xki_ON_TOGGLE_OFF');
                                                                                    logFirebaseEvent('Checkbox_update_app_state');
                                                                                    setState(() {
                                                                                      FFAppState().removeFromSelectedDataset(listViewUserDatasetsRecord.datasetId!);
                                                                                    });
                                                                                  }
                                                                                },
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    flex: 7,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('CHAT_PAGE_Text_q5qe4zal_ON_TAP');
                                                                                    logFirebaseEvent('Text_update_app_state');
                                                                                    FFAppState().activeDataset = listViewUserDatasetsRecord.reference;
                                                                                    logFirebaseEvent('Text_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Datasets',
                                                                                      queryParams: {
                                                                                        'activeDataset': serializeParam(
                                                                                          listViewUserDatasetsRecord,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'activeDataset': listViewUserDatasetsRecord,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: AutoSizeText(
                                                                                    listViewUserDatasetsRecord.datasetName!.maybeHandleOverflow(
                                                                                      maxChars: 23,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      controller: _model
                                                          .listViewController1,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
