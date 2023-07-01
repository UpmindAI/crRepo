import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/confirm_delete/confirm_delete_widget.dart';
import '/components/edit_dataset_title/edit_dataset_title_widget.dart';
import '/components/edit_title/edit_title_widget.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/datasets/add_dataset/add_dataset_widget.dart';
import '/pages/datasets/add_list/add_list_widget.dart';
import '/pages/datasets/new_dataset_button/new_dataset_button_widget.dart';
import '/pages/datasets/upload_config/upload_config_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'datasets_model.dart';
export 'datasets_model.dart';

class DatasetsWidget extends StatefulWidget {
  const DatasetsWidget({
    Key? key,
    this.activeDataset,
  }) : super(key: key);

  final UserDatasetsRecord? activeDataset;

  @override
  _DatasetsWidgetState createState() => _DatasetsWidgetState();
}

class _DatasetsWidgetState extends State<DatasetsWidget> {
  late DatasetsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatasetsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Datasets'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DATASETS_PAGE_Datasets_ON_INIT_STATE');
      logFirebaseEvent('Datasets_update_app_state');
      FFAppState().selectedDocuments =
          widget.activeDataset!.activeDocs.toList().cast<String>();
      FFAppState().currentPage = 'My Data';
    });

    _model.scrapeURLController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
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
                                  child: Stack(
                                    children: [
                                      if (FFAppState().activeDataset ==
                                          FFAppState().unsetDataset)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 50.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Select a Dataset from the right',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().activeDataset !=
                                          FFAppState().unsetDataset)
                                        StreamBuilder<UserDatasetsRecord>(
                                          stream:
                                              UserDatasetsRecord.getDocument(
                                                  FFAppState().activeDataset!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnUserDatasetsRecord =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          columnUserDatasetsRecord
                                                              .datasetName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'DATASETS_PAGE_Icon_u43xe4qu_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Icon_bottom_sheet');
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
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    child:
                                                                        EditDatasetTitleWidget(
                                                                      activeDatasetT:
                                                                          columnUserDatasetsRecord,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .edit,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 12.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'jm',
                                                              columnUserDatasetsRecord
                                                                  .createdOn!),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'MMMMEEEEd',
                                                              columnUserDatasetsRecord
                                                                  .createdOn!),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
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
                                                                  .fromSTEB(
                                                                      15.0,
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'DATASETS_PAGE_Icon_keakwikh_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Icon_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Color(
                                                                        0x1FFFFFFF),
                                                                barrierColor: Color(
                                                                    0x1FFFFFFF),
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      child:
                                                                          ConfirmDeleteWidget(
                                                                        datasetRef:
                                                                            columnUserDatasetsRecord.reference,
                                                                        datasetID:
                                                                            columnUserDatasetsRecord.datasetId,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .trashAlt,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
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
                                                                        25.0,
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'DATASETS_PAGE_Text_cx6lct4w_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Text_update_app_state');
                                                                setState(() {
                                                                  FFAppState().addToSelectedDataset(widget
                                                                      .activeDataset!
                                                                      .datasetId);
                                                                });
                                                                logFirebaseEvent(
                                                                    'Text_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                        'Home');
                                                              },
                                                              child: Text(
                                                                'P',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      fontSize:
                                                                          28.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    25.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'DATASETS_PAGE_Icon_0co53fcq_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Icon_update_app_state');
                                                            setState(() {
                                                              FFAppState()
                                                                  .addToSelectedDataset(widget
                                                                      .activeDataset!
                                                                      .datasetId);
                                                            });
                                                            logFirebaseEvent(
                                                                'Icon_navigate_to');

                                                            context.pushNamed(
                                                                'Chat');
                                                          },
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .robot,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'DATASETS_PAGE_Icon_e51703qn_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Icon_update_app_state');
                                                            setState(() {
                                                              FFAppState()
                                                                  .addToSelectedDataset(widget
                                                                      .activeDataset!
                                                                      .datasetId);
                                                            });
                                                            logFirebaseEvent(
                                                                'Icon_navigate_to');

                                                            context.pushNamed(
                                                                'Summarize');
                                                          },
                                                          child: Icon(
                                                            Icons.list,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 10.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      MouseRegion(
                                                        opaque: false,
                                                        cursor:
                                                            SystemMouseCursors
                                                                    .click ??
                                                                MouseCursor
                                                                    .defer,
                                                        child: Stack(
                                                          children: [
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 1.0,
                                                              child: Container(
                                                                width: 180.0,
                                                                height: 37.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        180.0,
                                                                    height:
                                                                        37.0,
                                                                    child: custom_widgets
                                                                        .SelectAndUploadFiles(
                                                                      width:
                                                                          180.0,
                                                                      height:
                                                                          37.0,
                                                                      userId:
                                                                          currentUserUid,
                                                                      datasetId:
                                                                          columnUserDatasetsRecord
                                                                              .datasetId,
                                                                      chunkSize:
                                                                          FFAppState()
                                                                              .setChunkSize,
                                                                      datasetName:
                                                                          columnUserDatasetsRecord
                                                                              .datasetName,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        onEnter:
                                                            ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionHovered1 =
                                                              true);
                                                        }),
                                                        onExit: ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionHovered1 =
                                                              false);
                                                        }),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'DATASETS_PAGE_Icon_g883ox4h_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Icon_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Color(
                                                                        0x1FFFFFFF),
                                                                barrierColor: Color(
                                                                    0x1FFFFFFF),
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      child:
                                                                          UploadConfigWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .settings_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .youtube,
                                                                color: Color(
                                                                    0xFFFF0000),
                                                                size: 22.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .globe,
                                                                color:
                                                                    Colors.blue,
                                                                size: 22.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 400.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 400.0,
                                                        ),
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
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 400.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .scrapeURLController,
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                logFirebaseEvent(
                                                                    'DATASETS_scrapeURL_ON_TEXTFIELD_SUBMIT');
                                                                logFirebaseEvent(
                                                                    'scrapeURL_show_snack_bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Scraping started...',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                  ),
                                                                );
                                                                logFirebaseEvent(
                                                                    'scrapeURL_update_widget_state');
                                                                setState(() {
                                                                  _model.urlID =
                                                                      random_data
                                                                          .randomString(
                                                                    6,
                                                                    6,
                                                                    true,
                                                                    true,
                                                                    true,
                                                                  );
                                                                });
                                                                logFirebaseEvent(
                                                                    'scrapeURL_backend_call');

                                                                var userTempUrlsRecordReference =
                                                                    UserTempUrlsRecord
                                                                        .createDoc(
                                                                            currentUserReference!);
                                                                await userTempUrlsRecordReference
                                                                    .set(
                                                                        createUserTempUrlsRecordData(
                                                                  urls: _model
                                                                      .scrapeURLController
                                                                      .text,
                                                                  datasetId: widget
                                                                      .activeDataset!
                                                                      .datasetId,
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                  urlId: random_data
                                                                      .randomString(
                                                                    8,
                                                                    8,
                                                                    true,
                                                                    true,
                                                                    true,
                                                                  ),
                                                                  datasetName: widget
                                                                      .activeDataset!
                                                                      .datasetName,
                                                                  chunkSize:
                                                                      FFAppState()
                                                                          .setChunkSize,
                                                                ));
                                                                _model.createURLdocu =
                                                                    UserTempUrlsRecord
                                                                        .getDocumentFromData(
                                                                            createUserTempUrlsRecordData(
                                                                              urls: _model.scrapeURLController.text,
                                                                              datasetId: widget.activeDataset!.datasetId,
                                                                              timestamp: getCurrentTimestamp,
                                                                              urlId: random_data.randomString(
                                                                                8,
                                                                                8,
                                                                                true,
                                                                                true,
                                                                                true,
                                                                              ),
                                                                              datasetName: widget.activeDataset!.datasetName,
                                                                              chunkSize: FFAppState().setChunkSize,
                                                                            ),
                                                                            userTempUrlsRecordReference);
                                                                logFirebaseEvent(
                                                                    'scrapeURL_clear_text_fields');
                                                                setState(() {
                                                                  _model
                                                                      .scrapeURLController
                                                                      ?.clear();
                                                                });
                                                                logFirebaseEvent(
                                                                    'scrapeURL_backend_call');
                                                                _model.scrapeURL =
                                                                    await ScrapeServerCall
                                                                        .call(
                                                                  urlId: _model
                                                                      .urlID,
                                                                  idToken:
                                                                      currentJwtToken,
                                                                  datasetId: widget
                                                                      .activeDataset!
                                                                      .datasetId,
                                                                );

                                                                setState(() {});
                                                              },
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                labelText:
                                                                    'Add Website or YouTube URL then hit enter...',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
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
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF980000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFF980000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              minLines: 1,
                                                              validator: _model
                                                                  .scrapeURLControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      MouseRegion(
                                                        opaque: false,
                                                        cursor: MouseCursor
                                                                .defer ??
                                                            MouseCursor.defer,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'DATASETS_PAGE_Icon_1pfhnqt4_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Icon_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              barrierColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        700.0,
                                                                    child:
                                                                        AddListWidget(
                                                                      setDataset:
                                                                          widget
                                                                              .activeDataset,
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
                                                                .format_line_spacing,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        onEnter:
                                                            ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionHovered2 =
                                                              true);
                                                          logFirebaseEvent(
                                                              'DATASETS_MouseRegion_rk2elr35_ON_TOGGLE_');
                                                          logFirebaseEvent(
                                                              'MouseRegion_update_widget_state');
                                                          setState(() {
                                                            _model.urlTooltip =
                                                                true;
                                                          });
                                                        }),
                                                        onExit: ((event) async {
                                                          setState(() => _model
                                                                  .mouseRegionHovered2 =
                                                              false);
                                                          logFirebaseEvent(
                                                              'DATASETS_MouseRegion_rk2elr35_ON_TOGGLE_');
                                                          logFirebaseEvent(
                                                              'MouseRegion_update_widget_state');
                                                          setState(() {
                                                            _model.urlTooltip =
                                                                false;
                                                          });
                                                        }),
                                                      ),
                                                      if (_model.urlTooltip)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'DATASETS_PAGE_Text_fwhtf2in_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Text_update_widget_state');
                                                              setState(() {
                                                                _model.urlTooltip =
                                                                    false;
                                                              });
                                                            },
                                                            child: Text(
                                                              'Add multiple URLs',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'Open',
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 90.0,
                                                        height: 20.0,
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
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Active',
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  StreamBuilder<
                                                                      List<
                                                                          UserDocsRecord>>(
                                                                    stream:
                                                                        queryUserDocsRecord(
                                                                      parent:
                                                                          currentUserReference,
                                                                      queryBuilder: (userDocsRecord) => userDocsRecord
                                                                          .where(
                                                                              'dataset_id',
                                                                              isEqualTo: columnUserDatasetsRecord
                                                                                  .datasetId)
                                                                          .orderBy(
                                                                              'timestamp',
                                                                              descending: true),
                                                                    ),
                                                                    builder:
                                                                        (context,
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
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<UserDocsRecord>
                                                                          listViewUserDocsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listViewUserDocsRecordList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                listViewIndex) {
                                                                          final listViewUserDocsRecord =
                                                                              listViewUserDocsRecordList[listViewIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                20.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 1.0,
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          child: Stack(
                                                                                            children: [
                                                                                              if (listViewUserDocsRecord.fileType == 'epub')
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.book,
                                                                                                  color: Color(0xFF7FB017),
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                              if (listViewUserDocsRecord.fileType == 'YouTube video')
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.youtube,
                                                                                                  color: Color(0xFFFF0000),
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                              if (listViewUserDocsRecord.fileType == 'pdf')
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.solidFilePdf,
                                                                                                  color: Color(0xFFAD0B00),
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                              if (listViewUserDocsRecord.fileType == 'url')
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.globe,
                                                                                                  color: Colors.blue,
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                              if (listViewUserDocsRecord.fileType == 'txt')
                                                                                                Icon(
                                                                                                  Icons.text_snippet,
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                              if (listViewUserDocsRecord.fileType == 'docx')
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.fileWord,
                                                                                                  color: Color(0xFF27508F),
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              listViewUserDocsRecord.docTitle.maybeHandleOverflow(
                                                                                                maxChars: 90,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('DATASETS_PAGE_Icon_z6yl06xt_ON_TAP');
                                                                                              logFirebaseEvent('Icon_bottom_sheet');
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: FlutterFlowTheme.of(context).overlay,
                                                                                                barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                                                enableDrag: false,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: Container(
                                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                      child: EditTitleWidget(
                                                                                                        activeDoc: listViewUserDocsRecord,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => setState(() {}));
                                                                                            },
                                                                                            child: FaIcon(
                                                                                              FontAwesomeIcons.edit,
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              size: 12.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 48.0, 0.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('DATASETS_PAGE_Icon_3k0ck7z4_ON_TAP');
                                                                                                  logFirebaseEvent('Icon_launch_u_r_l');
                                                                                                  await launchURL(listViewUserDocsRecord.url);
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.open_in_new,
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                            child: Theme(
                                                                                              data: ThemeData(
                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                  ),
                                                                                                ),
                                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).tertiary,
                                                                                              ),
                                                                                              child: Checkbox(
                                                                                                value: _model.checkboxValueMap[listViewUserDocsRecord] ??= columnUserDatasetsRecord.activeDocs.contains(listViewUserDocsRecord.docId),
                                                                                                onChanged: (newValue) async {
                                                                                                  setState(() => _model.checkboxValueMap[listViewUserDocsRecord] = newValue!);
                                                                                                  if (newValue!) {
                                                                                                    logFirebaseEvent('DATASETS_Checkbox_0au6mmmd_ON_TOGGLE_ON');
                                                                                                    logFirebaseEvent('Checkbox_backend_call');

                                                                                                    await columnUserDatasetsRecord.reference.update({
                                                                                                      'active_docs': FieldValue.arrayUnion([
                                                                                                        listViewUserDocsRecord.docId
                                                                                                      ]),
                                                                                                    });
                                                                                                  } else {
                                                                                                    logFirebaseEvent('DATASETS_Checkbox_0au6mmmd_ON_TOGGLE_OFF');
                                                                                                    logFirebaseEvent('Checkbox_backend_call');

                                                                                                    await columnUserDatasetsRecord.reference.update({
                                                                                                      'active_docs': FieldValue.arrayRemove([
                                                                                                        listViewUserDocsRecord.docId
                                                                                                      ]),
                                                                                                    });
                                                                                                  }
                                                                                                },
                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                checkColor: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 165.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    Icons.calendar_today_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    size: 14.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat('jm', listViewUserDocsRecord.timestamp!),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          fontSize: 12.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat('yMMMd', listViewUserDocsRecord.timestamp!),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          fontSize: 12.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
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
                                                                                                logFirebaseEvent('DATASETS_PAGE_Icon_h3skkjw1_ON_TAP');
                                                                                                logFirebaseEvent('Icon_backend_call');
                                                                                                await listViewUserDocsRecord.reference.delete();
                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                await columnUserDatasetsRecord.reference.update({
                                                                                                  'active_docs': FieldValue.arrayRemove([
                                                                                                    listViewUserDocsRecord.docId
                                                                                                  ]),
                                                                                                });
                                                                                              },
                                                                                              child: FaIcon(
                                                                                                FontAwesomeIcons.trashAlt,
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                size: 14.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              listViewUserDocsRecord.progressStatus,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: listViewUserDocsRecord.progressStatus == 'Ready' ? FlutterFlowTheme.of(context).green : FlutterFlowTheme.of(context).secondary,
                                                                                                    fontSize: 12.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          if (listViewUserDocsRecord.progressPercentage != null)
                                                                                            Container(
                                                                                              width: 124.0,
                                                                                              height: 12.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Visibility(
                                                                                                visible: (listViewUserDocsRecord.progressPercentage != null) && (listViewUserDocsRecord.progressPercentage != 100),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 130.0,
                                                                                                    height: 12.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
                                                                                                      child: LinearPercentIndicator(
                                                                                                        percent: functions.getPercentage(listViewUserDocsRecord.progressPercentage)!,
                                                                                                        width: 120.0,
                                                                                                        lineHeight: 12.0,
                                                                                                        animation: true,
                                                                                                        progressColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                        center: Text(
                                                                                                          '${listViewUserDocsRecord.progressPercentage.toString()} %',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                fontSize: 12.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                        barRadius: Radius.circular(3.0),
                                                                                                        padding: EdgeInsets.zero,
                                                                                                      ),
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
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
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
                                            );
                                          },
                                        ),
                                    ],
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
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
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Text(
                                                  'My Datasets',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 5.0, 0.0),
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
                                                          'DATASETS_PAGE_Icon_cj8mgdw6_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_bottom_sheet');
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
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              child:
                                                                  AddDatasetWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .create_new_folder_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 700.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: StreamBuilder<
                                                List<UserDatasetsRecord>>(
                                              stream: queryUserDatasetsRecord(
                                                parent: currentUserReference,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewUserDatasetsRecord =
                                                        listViewUserDatasetsRecordList[
                                                            listViewIndex];
                                                    return SingleChildScrollView(
                                                      primary: false,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'DATASETS_PAGE_Container_gcgzqo67_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_update_app_state');
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .activeDataset =
                                                                      listViewUserDatasetsRecord
                                                                          .reference;
                                                                  FFAppState()
                                                                          .selectedDocuments =
                                                                      listViewUserDatasetsRecord
                                                                          .activeDocs
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                });
                                                                logFirebaseEvent(
                                                                    'Container_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'Datasets',
                                                                  queryParameters:
                                                                      {
                                                                    'activeDataset':
                                                                        serializeParam(
                                                                      listViewUserDatasetsRecord,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'activeDataset':
                                                                        listViewUserDatasetsRecord,
                                                                  },
                                                                );
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 2.0,
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            2.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.folder,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).grayIcon,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            listViewUserDatasetsRecord.datasetName.maybeHandleOverflow(
                                                                              maxChars: 23,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                    );
                                                  },
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
    );
  }
}
