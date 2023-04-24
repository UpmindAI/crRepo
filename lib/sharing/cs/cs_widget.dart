import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chat/empt_chat/empt_chat_widget.dart';
import '/sharing/shared_chat_chunks/shared_chat_chunks_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cs_model.dart';
export 'cs_model.dart';

class CsWidget extends StatefulWidget {
  const CsWidget({
    Key? key,
    this.bid,
    this.cid,
    this.chatMeta,
    bool? inChat,
  })  : this.inChat = inChat ?? false,
        super(key: key);

  final String? bid;
  final String? cid;
  final DocumentReference? chatMeta;
  final bool inChat;

  @override
  _CsWidgetState createState() => _CsWidgetState();
}

class _CsWidgetState extends State<CsWidget> {
  late CsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'cs'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CS_PAGE_cs_ON_INIT_STATE');
      logFirebaseEvent('cs_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.dark);
      logFirebaseEvent('cs_update_app_state');
      setState(() {
        FFAppState().currentPage = 'Chat';
      });
      logFirebaseEvent('cs_scroll_to');
      await _model.chatColumn?.animateTo(
        _model.chatColumn!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.startFieldController ??= TextEditingController();
    _model.sendFieldController ??= TextEditingController();
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
        appBar: responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).bandW,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'OMP!',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                  actions: [],
                  centerTitle: true,
                  toolbarHeight: 0.0,
                  elevation: 0.0,
                ),
              )
            : null,
        body: SafeArea(
          child: StreamBuilder<List<SharedBotsRecord>>(
            stream: querySharedBotsRecord(
              queryBuilder: (sharedBotsRecord) =>
                  sharedBotsRecord.where('bid', isEqualTo: widget.bid),
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitRipple(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              List<SharedBotsRecord> columnSharedBotsRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final columnSharedBotsRecord =
                  columnSharedBotsRecordList.isNotEmpty
                      ? columnSharedBotsRecordList.first
                      : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ))
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
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: ClipRect(
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 150.0,
                                            sigmaY: 150.0,
                                          ),
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: Image.asset(
                                                  'assets/images/blur-bg.jpg',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        5.0,
                                                                        10.0,
                                                                        5.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'CS_PAGE_REFRESH_BTN_ON_TAP');
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
                                                                logFirebaseEvent(
                                                                    'Button_update_widget_state');
                                                                setState(() {
                                                                  _model.setCid =
                                                                      null;
                                                                });
                                                                logFirebaseEvent(
                                                                    'Button_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'cs',
                                                                  queryParams: {
                                                                    'bid':
                                                                        serializeParam(
                                                                      widget
                                                                          .bid,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'inChat':
                                                                        serializeParam(
                                                                      false,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              text: 'Refresh',
                                                              icon: Icon(
                                                                Icons.close,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 16.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                                elevation: 2.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/Logo-OMP-122-40-white.png',
                                                            width: 122.0,
                                                            height: 40.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              FFAppState()
                                                                  .version
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            Icon(
                                                              Icons.menu,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 36.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                BoxDecoration(),
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
                                                                      SharedChatsRecord>>(
                                                                stream:
                                                                    querySharedChatsRecord(
                                                                  parent: columnSharedBotsRecord!
                                                                      .reference,
                                                                  queryBuilder: (sharedChatsRecord) => sharedChatsRecord
                                                                      .where(
                                                                          'cid',
                                                                          isEqualTo: widget
                                                                              .cid)
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
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitRipple(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<SharedChatsRecord>
                                                                      chatColumnSharedChatsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  if (chatColumnSharedChatsRecordList
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child:
                                                                          EmptChatWidget(),
                                                                    );
                                                                  }
                                                                  return SingleChildScrollView(
                                                                    controller:
                                                                        _model
                                                                            .chatColumn,
                                                                    child:
                                                                        Column(
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
                                                                          chatColumnSharedChatsRecordList
                                                                              .length,
                                                                          (chatColumnIndex) {
                                                                        final chatColumnSharedChatsRecord =
                                                                            chatColumnSharedChatsRecordList[chatColumnIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              if (chatColumnSharedChatsRecord.isCompletion ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 15.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: Material(
                                                                                            color: Colors.transparent,
                                                                                            elevation: 8.0,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 2.0,
                                                                                                    color: Color(0x2A79C7E3),
                                                                                                    offset: Offset(0.0, 2.0),
                                                                                                    spreadRadius: 2.0,
                                                                                                  )
                                                                                                ],
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
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
                                                                                                                  if (chatColumnSharedChatsRecord.isLoading ?? true)
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
                                                                                                                      if (!chatColumnSharedChatsRecord.isLoading!)
                                                                                                                        Align(
                                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 5.0),
                                                                                                                            child: SelectionArea(
                                                                                                                                child: Text(
                                                                                                                              chatColumnSharedChatsRecord.completion!,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                    color: chatColumnSharedChatsRecord.isError! ? Color(0xFF980000) : FlutterFlowTheme.of(context).accentTwo,
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
                                                                                                                        dateTimeFormat('relative', chatColumnSharedChatsRecord.timestamp!),
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
                                                                                                                        logFirebaseEvent('CS_PAGE_Text_ngu39xck_ON_TAP');
                                                                                                                        logFirebaseEvent('Text_bottom_sheet');
                                                                                                                        await showModalBottomSheet(
                                                                                                                          isScrollControlled: true,
                                                                                                                          backgroundColor: FlutterFlowTheme.of(context).overlay,
                                                                                                                          barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                                                                          enableDrag: false,
                                                                                                                          context: context,
                                                                                                                          builder: (bottomSheetContext) {
                                                                                                                            return GestureDetector(
                                                                                                                              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                              child: Padding(
                                                                                                                                padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                                child: Container(
                                                                                                                                  height: MediaQuery.of(context).size.height * 0.8,
                                                                                                                                  child: SharedChatChunksWidget(
                                                                                                                                    chatDoc: chatColumnSharedChatsRecord,
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
                                                                                                                        logFirebaseEvent('CS_PAGE_Icon_gw4586f9_ON_TAP');
                                                                                                                        logFirebaseEvent('Icon_copy_to_clipboard');
                                                                                                                        await Clipboard.setData(ClipboardData(text: chatColumnSharedChatsRecord.completion!));
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
                                                                                                                      logFirebaseEvent('CS_PAGE_Icon_24zbvcwc_ON_TAP');
                                                                                                                      logFirebaseEvent('Icon_backend_call');
                                                                                                                      await chatColumnSharedChatsRecord.reference.delete();
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
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              if (!chatColumnSharedChatsRecord.isCompletion!)
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
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 8.0, 8.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 5.0),
                                                                                                          child: SelectionArea(
                                                                                                              child: Text(
                                                                                                            chatColumnSharedChatsRecord.prompt!,
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
                                                                                                                dateTimeFormat('relative', chatColumnSharedChatsRecord.timestamp!),
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
                                                                                                                  logFirebaseEvent('CS_PAGE_Icon_iddf5xv1_ON_TAP');
                                                                                                                  logFirebaseEvent('Icon_copy_to_clipboard');
                                                                                                                  await Clipboard.setData(ClipboardData(text: chatColumnSharedChatsRecord.prompt!));
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
                                                                                                                  logFirebaseEvent('CS_PAGE_Icon_o9ijvthh_ON_TAP');
                                                                                                                  logFirebaseEvent('Icon_backend_call');
                                                                                                                  await chatColumnSharedChatsRecord.reference.delete();
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
                                                                MainAxisSize
                                                                    .min,
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
                                                                            20.0,
                                                                            12.0),
                                                                    child:
                                                                        MouseRegion(
                                                                      opaque:
                                                                          true,
                                                                      cursor: SystemMouseCursors
                                                                              .click ??
                                                                          MouseCursor
                                                                              .defer,
                                                                      child:
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
                                                                          logFirebaseEvent(
                                                                              'CS_PAGE_Container_3wsx79fw_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Container_drawer');
                                                                          scaffoldKey
                                                                              .currentState!
                                                                              .openEndDrawer();
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
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
                                                                              color: _model.mouseEnter ? FlutterFlowTheme.of(context).secondary : Color(0x2D79C7E3),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.flask,
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                size: 24.0,
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
                                                                            'CS_MouseRegion_pan8drzl_ON_TOGGLE_ON');
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
                                                                            'CS_MouseRegion_pan8drzl_ON_TOGGLE_OFF');
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (!widget
                                                                  .inChat)
                                                                Form(
                                                                  key: _model
                                                                      .formKey2,
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .disabled,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .startFieldController,
                                                                    onFieldSubmitted:
                                                                        (_) async {
                                                                      logFirebaseEvent(
                                                                          'CS_PAGE_startField_ON_TEXTFIELD_SUBMIT');
                                                                      logFirebaseEvent(
                                                                          'startField_update_widget_state');
                                                                      setState(
                                                                          () {
                                                                        _model.setCid =
                                                                            random_data.randomString(
                                                                          6,
                                                                          6,
                                                                          true,
                                                                          true,
                                                                          true,
                                                                        );
                                                                      });
                                                                      // createMeta
                                                                      logFirebaseEvent(
                                                                          'startField_createMeta');

                                                                      final sharedChatMetaCreateData =
                                                                          {
                                                                        ...createSharedChatMetaRecordData(
                                                                          cid: _model
                                                                              .setCid,
                                                                          bid: widget
                                                                              .bid,
                                                                          createdOn:
                                                                              getCurrentTimestamp,
                                                                        ),
                                                                        'prompts':
                                                                            [
                                                                          _model
                                                                              .startFieldController
                                                                              .text
                                                                        ],
                                                                      };
                                                                      var sharedChatMetaRecordReference =
                                                                          SharedChatMetaRecord.createDoc(
                                                                              columnSharedBotsRecord!.reference);
                                                                      await sharedChatMetaRecordReference
                                                                          .set(
                                                                              sharedChatMetaCreateData);
                                                                      _model.createSharedChatMeta = SharedChatMetaRecord.getDocumentFromData(
                                                                          sharedChatMetaCreateData,
                                                                          sharedChatMetaRecordReference);
                                                                      logFirebaseEvent(
                                                                          'startField_backend_call');

                                                                      final sharedChatsCreateData =
                                                                          createSharedChatsRecordData(
                                                                        prompt: _model
                                                                            .startFieldController
                                                                            .text,
                                                                        cid: _model
                                                                            .setCid,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                        isCompletion:
                                                                            false,
                                                                        bid: widget
                                                                            .bid,
                                                                        qid: random_data
                                                                            .randomString(
                                                                          10,
                                                                          10,
                                                                          true,
                                                                          true,
                                                                          true,
                                                                        ),
                                                                      );
                                                                      var sharedChatsRecordReference =
                                                                          SharedChatsRecord.createDoc(
                                                                              columnSharedBotsRecord!.reference);
                                                                      await sharedChatsRecordReference
                                                                          .set(
                                                                              sharedChatsCreateData);
                                                                      _model.shareChatMessage = SharedChatsRecord.getDocumentFromData(
                                                                          sharedChatsCreateData,
                                                                          sharedChatsRecordReference);
                                                                      logFirebaseEvent(
                                                                          'startField_clear_text_fields');
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .startFieldController
                                                                            ?.clear();
                                                                        _model
                                                                            .sendFieldController
                                                                            ?.clear();
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'startField_update_widget_state');
                                                                      setState(
                                                                          () {
                                                                        _model.setChat =
                                                                            _model.createSharedChatMeta;
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'startField_backend_call');
                                                                      _model.apiResulthea =
                                                                          await ShareChatCall
                                                                              .call(
                                                                        bid: widget
                                                                            .bid,
                                                                        cid: _model
                                                                            .setCid,
                                                                        qid: _model
                                                                            .shareChatMessage!
                                                                            .qid,
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'startField_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'cs',
                                                                        queryParams:
                                                                            {
                                                                          'bid':
                                                                              serializeParam(
                                                                            widget.bid,
                                                                            ParamType.String,
                                                                          ),
                                                                          'cid':
                                                                              serializeParam(
                                                                            _model.setCid,
                                                                            ParamType.String,
                                                                          ),
                                                                          'chatMeta':
                                                                              serializeParam(
                                                                            _model.createSharedChatMeta!.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                          'inChat':
                                                                              serializeParam(
                                                                            true,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    autofocus:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Ask a question or enter a prompt...',
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmall,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFF980000),
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFF980000),
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bandW,
                                                                      suffixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .send,
                                                                        color: Color(
                                                                            0xFF757575),
                                                                        size:
                                                                            22.0,
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              18.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    minLines: 1,
                                                                    validator: _model
                                                                        .startFieldControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              if (widget.inChat)
                                                                Form(
                                                                  key: _model
                                                                      .formKey1,
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .disabled,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            12.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .sendFieldController,
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        logFirebaseEvent(
                                                                            'CS_PAGE_sendField_ON_TEXTFIELD_SUBMIT');
                                                                        // sendMessage
                                                                        logFirebaseEvent(
                                                                            'sendField_sendMessage');

                                                                        final chatsCreateData =
                                                                            createChatsRecordData(
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
                                                                        );
                                                                        var chatsRecordReference =
                                                                            ChatsRecord.createDoc(currentUserReference!);
                                                                        await chatsRecordReference
                                                                            .set(chatsCreateData);
                                                                        _model.chatMessageNewFromField = ChatsRecord.getDocumentFromData(
                                                                            chatsCreateData,
                                                                            chatsRecordReference);
                                                                        logFirebaseEvent(
                                                                            'sendField_backend_call');

                                                                        final chatMetaUpdateData =
                                                                            {
                                                                          'prompts':
                                                                              FieldValue.arrayUnion([
                                                                            _model.sendFieldController.text
                                                                          ]),
                                                                        };
                                                                        await FFAppState()
                                                                            .setChat!
                                                                            .update(chatMetaUpdateData);
                                                                        logFirebaseEvent(
                                                                            'sendField_clear_text_fields');
                                                                        setState(
                                                                            () {
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
                                                                          duration:
                                                                              Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'sendField_backend_call');
                                                                        _model.apiResultzymFF =
                                                                            await MixedChatCall.call(
                                                                          idToken:
                                                                              currentJwtToken,
                                                                          qid: _model
                                                                              .chatMessageNewFromField!
                                                                              .qid,
                                                                          cid: FFAppState()
                                                                              .setCid,
                                                                          datasetIdsList:
                                                                              FFAppState().selectedDataset,
                                                                          topK:
                                                                              FFAppState().setTopKchat,
                                                                          guardrail:
                                                                              FFAppState().setChatGR,
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'sendField_wait__delay');
                                                                        await Future.delayed(const Duration(
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
                                                                          duration:
                                                                              Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'sendField_wait__delay');
                                                                        await Future.delayed(const Duration(
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
                                                                          duration:
                                                                              Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'sendField_wait__delay');
                                                                        await Future.delayed(const Duration(
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
                                                                          duration:
                                                                              Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'sendField_update_app_state');
                                                                        setState(
                                                                            () {
                                                                          FFAppState().setPromptPL =
                                                                              '';
                                                                        });

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Continue your chat...',
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                            width:
                                                                                3.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                3.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF980000),
                                                                            width:
                                                                                3.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF980000),
                                                                            width:
                                                                                3.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).bandW,
                                                                        suffixIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .send,
                                                                          color:
                                                                              Color(0xFF757575),
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                18.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                      minLines:
                                                                          1,
                                                                      validator: _model
                                                                          .sendFieldControllerValidator
                                                                          .asValidator(
                                                                              context),
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
                                            ],
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
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ))
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
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height:
                                            MediaQuery.of(context).size.height *
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
