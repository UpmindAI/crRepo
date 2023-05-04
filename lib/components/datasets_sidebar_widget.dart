import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/datasets/new_dataset_button/new_dataset_button_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'datasets_sidebar_model.dart';
export 'datasets_sidebar_model.dart';

class DatasetsSidebarWidget extends StatefulWidget {
  const DatasetsSidebarWidget({Key? key}) : super(key: key);

  @override
  _DatasetsSidebarWidgetState createState() => _DatasetsSidebarWidgetState();
}

class _DatasetsSidebarWidgetState extends State<DatasetsSidebarWidget> {
  late DatasetsSidebarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatasetsSidebarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 300.0,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'DATASETS_SIDEBAR_Text_p4x97znh_ON_TAP');
                            logFirebaseEvent('Text_navigate_to');

                            context.pushNamed('Datasets');
                          },
                          child: Text(
                            'My Datasets',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 780.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: StreamBuilder<List<UserDatasetsRecord>>(
                              stream: queryUserDatasetsRecord(
                                parent: currentUserReference,
                                queryBuilder: (userDatasetsRecord) =>
                                    userDatasetsRecord.orderBy('dataset_name'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<UserDatasetsRecord>
                                    listViewUserDatasetsRecordList =
                                    snapshot.data!;
                                if (listViewUserDatasetsRecordList.isEmpty) {
                                  return Container(
                                    width: 300.0,
                                    height: 300.0,
                                    child: NewDatasetButtonWidget(),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewUserDatasetsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewUserDatasetsRecord =
                                        listViewUserDatasetsRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Theme(
                                                          data: ThemeData(
                                                            checkboxTheme:
                                                                CheckboxThemeData(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                            ),
                                                            unselectedWidgetColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                          child: Checkbox(
                                                            value: _model
                                                                        .checkboxValueMap[
                                                                    listViewUserDatasetsRecord] ??=
                                                                FFAppState()
                                                                    .selectedDataset
                                                                    .contains(
                                                                        listViewUserDatasetsRecord
                                                                            .datasetId),
                                                            onChanged:
                                                                (newValue) async {
                                                              setState(() =>
                                                                  _model.checkboxValueMap[
                                                                          listViewUserDatasetsRecord] =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                logFirebaseEvent(
                                                                    'DATASETS_SIDEBAR_Checkbox_a9m9jssk_ON_TO');
                                                                logFirebaseEvent(
                                                                    'Checkbox_update_app_state');
                                                                setState(() {
                                                                  FFAppState().addToSelectedDataset(
                                                                      listViewUserDatasetsRecord
                                                                          .datasetId!);
                                                                });
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'DATASETS_SIDEBAR_Checkbox_a9m9jssk_ON_TO');
                                                                logFirebaseEvent(
                                                                    'Checkbox_update_app_state');
                                                                setState(() {
                                                                  FFAppState().removeFromSelectedDataset(
                                                                      listViewUserDatasetsRecord
                                                                          .datasetId!);
                                                                });
                                                              }
                                                            },
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
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
                                                                    'DATASETS_SIDEBAR_Text_g1pgcwci_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Text_update_app_state');
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .activeDataset =
                                                                      listViewUserDatasetsRecord
                                                                          .reference;
                                                                  FFAppState()
                                                                          .selectedDocuments =
                                                                      listViewUserDatasetsRecord
                                                                          .activeDocs!
                                                                          .toList();
                                                                });
                                                                logFirebaseEvent(
                                                                    'Text_navigate_to');

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
                                                                  extra: <
                                                                      String,
                                                                      dynamic>{
                                                                    'activeDataset':
                                                                        listViewUserDatasetsRecord,
                                                                  },
                                                                );
                                                              },
                                                              child:
                                                                  AutoSizeText(
                                                                listViewUserDatasetsRecord
                                                                    .datasetName!
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 23,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                          ),
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
    );
  }
}
