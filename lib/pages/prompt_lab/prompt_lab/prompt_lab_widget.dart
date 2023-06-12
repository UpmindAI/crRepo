import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/datasets_sidebar_widget.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/components/promptlab_prompt_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/prompt_lab/add_prompt/add_prompt_widget.dart';
import '/pages/prompt_lab/add_sub_folder/add_sub_folder_widget.dart';
import '/pages/prompt_lab/empty_promtlab/empty_promtlab_widget.dart';
import '/pages/prompt_lab/folder_options/folder_options_widget.dart';
import '/pages/prompt_lab/folder_options_sub/folder_options_sub_widget.dart';
import '/pages/prompt_lab/pl_completion/pl_completion_widget.dart';
import '/pages/prompt_lab/prompt_lab_system/prompt_lab_system_widget.dart';
import '/pages/prompt_lab/promptlabl_content/promptlabl_content_widget.dart';
import '/pages/prompt_lab/prompts_main/prompts_main_widget.dart';
import '/pages/prompt_lab/prompts_sub/prompts_sub_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'prompt_lab_model.dart';
export 'prompt_lab_model.dart';

class PromptLabWidget extends StatefulWidget {
  const PromptLabWidget({Key? key}) : super(key: key);

  @override
  _PromptLabWidgetState createState() => _PromptLabWidgetState();
}

class _PromptLabWidgetState extends State<PromptLabWidget> {
  late PromptLabModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromptLabModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'promptLab'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROMPT_LAB_PAGE_promptLab_ON_INIT_STATE');
      logFirebaseEvent('promptLab_update_app_state');
      setState(() {
        FFAppState().currentPage = 'promptLab';
      });
    });

    _model.searchBarController ??= TextEditingController();
    _model.nameFolderController ??= TextEditingController();
    _model.textController3 ??= TextEditingController(text: '5');
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: Container(
          width: 300.0,
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.datasetsSidebarModel,
              updateCallback: () => setState(() {}),
              child: DatasetsSidebarWidget(),
            ),
          ),
        ),
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
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 20.0),
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
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .searchBarController,
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Search..',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                            enabledBorder:
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
                                                                    0x00000000),
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
                                                                    0x00000000),
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
                                                            prefixIcon: Icon(
                                                              Icons.search,
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          validator: _model
                                                              .searchBarControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if (!_model.addFolder)
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PROMPT_LAB_PAGE_ADD_FOLDER_BTN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Button_update_widget_state');
                                                                  setState(() {
                                                                    _model.addFolder =
                                                                        true;
                                                                  });
                                                                },
                                                                text:
                                                                    'Add Folder',
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .folderPlus,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 14.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                                  iconPadding: EdgeInsetsDirectional
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
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
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
                                                            ],
                                                          ),
                                                        if (_model.addFolder)
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        300.0,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .nameFolderController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        hintText:
                                                                            '[Name of your folder...]',
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .nameFolderControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'PROMPT_LAB_PAGE_ADD_BTN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    final promptlabCreateData =
                                                                        createPromptlabRecordData(
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                      folderName: _model
                                                                          .nameFolderController
                                                                          .text,
                                                                    );
                                                                    await PromptlabRecord.createDoc(
                                                                            currentUserReference!)
                                                                        .set(
                                                                            promptlabCreateData);
                                                                    logFirebaseEvent(
                                                                        'Button_clear_text_fields');
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .nameFolderController
                                                                          ?.clear();
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'Button_update_widget_state');
                                                                    setState(
                                                                        () {
                                                                      _model.addFolder =
                                                                          false;
                                                                    });
                                                                  },
                                                                  text: 'Add',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
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
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: StreamBuilder<
                                                        List<PromptlabRecord>>(
                                                      stream:
                                                          queryPromptlabRecord(
                                                        parent:
                                                            currentUserReference,
                                                        queryBuilder:
                                                            (promptlabRecord) =>
                                                                promptlabRecord
                                                                    .orderBy(
                                                                        'folder_name'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<PromptlabRecord>
                                                            columnPromptlabRecordList =
                                                            snapshot.data!;
                                                        if (columnPromptlabRecordList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  1.0,
                                                              child:
                                                                  EmptyPromtlabWidget(),
                                                            ),
                                                          );
                                                        }
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                columnPromptlabRecordList
                                                                    .length,
                                                                (columnIndex) {
                                                              final columnPromptlabRecord =
                                                                  columnPromptlabRecordList[
                                                                      columnIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      1.0,
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
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('PROMPT_LAB_Container_gaw8jmwp_ON_TAP');
                                                                                  if (_model.openFolder == columnPromptlabRecord.reference) {
                                                                                    logFirebaseEvent('Container_update_widget_state');
                                                                                    setState(() {
                                                                                      _model.openFolder = null;
                                                                                    });
                                                                                  } else {
                                                                                    logFirebaseEvent('Container_update_widget_state');
                                                                                    setState(() {
                                                                                      _model.openFolder = columnPromptlabRecord.reference;
                                                                                    });
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Stack(
                                                                                        children: [
                                                                                          if (_model.openFolder != columnPromptlabRecord.reference)
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                              child: FaIcon(
                                                                                                FontAwesomeIcons.solidFolder,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 14.0,
                                                                                              ),
                                                                                            ),
                                                                                          if (_model.openFolder == columnPromptlabRecord.reference)
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                              child: FaIcon(
                                                                                                FontAwesomeIcons.folderOpen,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 14.0,
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                        child: Text(
                                                                                          columnPromptlabRecord.folderName,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 16.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (_model.openFolder == columnPromptlabRecord.reference)
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('PROMPT_LAB_PAGE_Icon_ibw5boge_ON_TAP');
                                                                                                  logFirebaseEvent('Icon_bottom_sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).overlay,
                                                                                                    barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                                                    enableDrag: false,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return GestureDetector(
                                                                                                        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                        child: Padding(
                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                          child: Container(
                                                                                                            height: MediaQuery.of(context).size.height * 1.0,
                                                                                                            child: FolderOptionsWidget(
                                                                                                              folderDoc: columnPromptlabRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.settings_outlined,
                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                  size: 15.0,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('PROMPT_LAB_Container_vux2xwwi_ON_TAP');
                                                                                                  logFirebaseEvent('Container_bottom_sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).overlay,
                                                                                                    barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                                                    enableDrag: false,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return GestureDetector(
                                                                                                        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                        child: Padding(
                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                          child: Container(
                                                                                                            height: MediaQuery.of(context).size.height * 1.0,
                                                                                                            child: AddPromptWidget(
                                                                                                              promptRef: columnPromptlabRecord.reference,
                                                                                                              isSub: false,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                          child: Icon(
                                                                                                            Icons.playlist_add_sharp,
                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                            size: 14.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'prompt',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 0.0, 0.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('PROMPT_LAB_Container_h0dukuqv_ON_TAP');
                                                                                                  logFirebaseEvent('Container_bottom_sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).overlay,
                                                                                                    barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                                                    enableDrag: false,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return GestureDetector(
                                                                                                        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                        child: Padding(
                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                          child: Container(
                                                                                                            height: MediaQuery.of(context).size.height * 1.0,
                                                                                                            child: AddSubFolderWidget(
                                                                                                              folderRef: columnPromptlabRecord.reference,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                          child: Icon(
                                                                                                            Icons.create_new_folder_outlined,
                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                            size: 15.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'subfolder',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                              .openFolder ==
                                                                          columnPromptlabRecord
                                                                              .reference)
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 0.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final children = columnPromptlabRecord.children.toList().take(10).toList();
                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: children.length,
                                                                                      itemBuilder: (context, childrenIndex) {
                                                                                        final childrenItem = children[childrenIndex];
                                                                                        return Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('PROMPT_LAB_Container_fcqsjx4t_ON_TAP');
                                                                                                        if (_model.openSub == childrenItem.docRef) {
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
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Row(
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
                                                                                                              childrenItem.folderName,
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
                                                                                                    if (_model.openSub == childrenItem.docRef)
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 2.0, 0.0, 2.0),
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  logFirebaseEvent('PROMPT_LAB_PAGE_Icon_gmf2ep9u_ON_TAP');
                                                                                                                  logFirebaseEvent('Icon_bottom_sheet');
                                                                                                                  await showModalBottomSheet(
                                                                                                                    isScrollControlled: true,
                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                    enableDrag: false,
                                                                                                                    context: context,
                                                                                                                    builder: (context) {
                                                                                                                      return GestureDetector(
                                                                                                                        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                                        child: Padding(
                                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                                          child: Container(
                                                                                                                            height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                            child: FolderOptionsSubWidget(
                                                                                                                              folderRef: columnPromptlabRecord.children[childrenIndex].docRef,
                                                                                                                              index: childrenIndex,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ).then((value) => setState(() {}));
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  Icons.settings_outlined,
                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                  size: 15.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  logFirebaseEvent('PROMPT_LAB_Container_4g0lytkd_ON_TAP');
                                                                                                                  logFirebaseEvent('Container_bottom_sheet');
                                                                                                                  await showModalBottomSheet(
                                                                                                                    isScrollControlled: true,
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).overlay,
                                                                                                                    barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                                                                    enableDrag: false,
                                                                                                                    context: context,
                                                                                                                    builder: (context) {
                                                                                                                      return GestureDetector(
                                                                                                                        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                                        child: Padding(
                                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                                          child: Container(
                                                                                                                            height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                            child: AddPromptWidget(
                                                                                                                              subRef: childrenItem.docRef,
                                                                                                                              isSub: true,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ).then((value) => setState(() {}));
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 2.0, 0.0),
                                                                                                                          child: Icon(
                                                                                                                            Icons.playlist_add_sharp,
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            size: 14.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          'prompt',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              if (valueOrDefault<bool>(
                                                                                                _model.openSub == childrenItem.docRef,
                                                                                                true,
                                                                                              ))
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: PromptsSubWidget(
                                                                                                          key: Key('Keyqq3_${childrenIndex}_of_${children.length}'),
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
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: PromptsMainWidget(
                                                                                          key: Key('Keyna0_${columnIndex}_of_${columnPromptlabRecordList.length}'),
                                                                                          plpromptsMain: _model.openFolder,
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
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
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
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 8.0, 0.0, 8.0),
                                              child: Text(
                                                'Test your Prompt',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: wrapWithModel(
                                              model:
                                                  _model.promptLabSystemModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: PromptLabSystemWidget(
                                                setSystem:
                                                    FFAppState().setSystem,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: wrapWithModel(
                                              model:
                                                  _model.promptlablContentModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: PromptlablContentWidget(
                                                setContent:
                                                    FFAppState().setContentPL,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Switch(
                                                value: _model.switchValue ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                      .switchValue = newValue!);
                                                },
                                              ),
                                            ),
                                            Text(
                                              'Include Active Datasets',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PROMPT_LAB_PAGE_Text_7m1w8xnf_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Text_drawer');
                                                  scaffoldKey.currentState!
                                                      .openEndDrawer();
                                                },
                                                child: Text(
                                                  'Show',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
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
                                            child: wrapWithModel(
                                              model:
                                                  _model.promptlabPromptModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: PromptlabPromptWidget(
                                                setPrompt:
                                                    FFAppState().setPromptPL,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 0.0, 8.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'PROMPT_LAB_PAGE_OMP!_BTN_ON_TAP');
                                                if (_model.switchValue!) {
                                                  logFirebaseEvent(
                                                      'Button_backend_call');

                                                  final plPromptsCreateData1 = {
                                                    ...createPlPromptsRecordData(
                                                      system: _model
                                                          .promptLabSystemModel
                                                          .textController
                                                          .text,
                                                      content: _model
                                                          .promptlablContentModel
                                                          .textController
                                                          .text,
                                                      prompt: _model
                                                          .promptlabPromptModel
                                                          .textController
                                                          .text,
                                                      timestamp:
                                                          getCurrentTimestamp,
                                                      plid: random_data
                                                          .randomString(
                                                        10,
                                                        10,
                                                        true,
                                                        true,
                                                        true,
                                                      ),
                                                      topK: int.tryParse(_model
                                                          .textController3
                                                          .text),
                                                      temp: valueOrDefault<
                                                          double>(
                                                        _model.sliderValue,
                                                        0.0,
                                                      ),
                                                    ),
                                                    'active_datasets':
                                                        FFAppState()
                                                            .selectedDataset,
                                                  };
                                                  var plPromptsRecordReference1 =
                                                      PlPromptsRecord.createDoc(
                                                          currentUserReference!);
                                                  await plPromptsRecordReference1
                                                      .set(
                                                          plPromptsCreateData1);
                                                  _model.setPromptDataset =
                                                      PlPromptsRecord
                                                          .getDocumentFromData(
                                                              plPromptsCreateData1,
                                                              plPromptsRecordReference1);
                                                  logFirebaseEvent(
                                                      'Button_backend_call');
                                                  _model.apiResulty84 =
                                                      await PromptLabCall.call(
                                                    plid: _model
                                                        .setPromptDataset!.plid,
                                                    idToken: currentJwtToken,
                                                    datasetIdsList: FFAppState()
                                                        .selectedDataset,
                                                  );
                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  setState(() {
                                                    FFAppState()
                                                            .setCompletionPL =
                                                        _model.setPromptDataset!
                                                            .reference;
                                                  });
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_backend_call');

                                                  final plPromptsCreateData2 = {
                                                    ...createPlPromptsRecordData(
                                                      system: _model
                                                          .promptLabSystemModel
                                                          .textController
                                                          .text,
                                                      content: _model
                                                          .promptlablContentModel
                                                          .textController
                                                          .text,
                                                      prompt: _model
                                                          .promptlabPromptModel
                                                          .textController
                                                          .text,
                                                      timestamp:
                                                          getCurrentTimestamp,
                                                      plid: random_data
                                                          .randomString(
                                                        10,
                                                        10,
                                                        true,
                                                        true,
                                                        true,
                                                      ),
                                                      topK: int.tryParse(_model
                                                          .textController3
                                                          .text),
                                                      temp: valueOrDefault<
                                                          double>(
                                                        _model.sliderValue,
                                                        0.0,
                                                      ),
                                                    ),
                                                    'active_datasets':
                                                        FFAppState().emptyList,
                                                  };
                                                  var plPromptsRecordReference2 =
                                                      PlPromptsRecord.createDoc(
                                                          currentUserReference!);
                                                  await plPromptsRecordReference2
                                                      .set(
                                                          plPromptsCreateData2);
                                                  _model.setPromptNoDataset =
                                                      PlPromptsRecord
                                                          .getDocumentFromData(
                                                              plPromptsCreateData2,
                                                              plPromptsRecordReference2);
                                                  logFirebaseEvent(
                                                      'Button_backend_call');
                                                  _model.apiResulty85 =
                                                      await PromptLabCall.call(
                                                    plid: _model
                                                        .setPromptNoDataset!
                                                        .plid,
                                                    idToken: currentJwtToken,
                                                    datasetIdsList:
                                                        FFAppState().emptyList,
                                                  );
                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  setState(() {
                                                    FFAppState()
                                                            .setCompletionPL =
                                                        _model
                                                            .setPromptNoDataset!
                                                            .reference;
                                                  });
                                                }

                                                setState(() {});
                                              },
                                              text: 'OMP!',
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 32.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 1.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Stack(
                                                children: [
                                                  if (!_model.configView)
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
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
                                                                    'PROMPT_LAB_PAGE_Icon_64yn3urj_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_update_widget_state');
                                                                setState(() {
                                                                  _model.configView =
                                                                      true;
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .settings_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (_model.configView)
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Top K',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          50.0,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController3,
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        minLines:
                                                                            1,
                                                                        validator: _model
                                                                            .textController3Validator
                                                                            .asValidator(context),
                                                                        inputFormatters: [
                                                                          _model
                                                                              .textFieldMask
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Temperature',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Container(
                                                                  width: 100.0,
                                                                  child: Slider(
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    inactiveColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                    min: 0.0,
                                                                    max: 1.0,
                                                                    value: _model
                                                                            .sliderValue ??=
                                                                        0.0,
                                                                    divisions:
                                                                        10,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(() =>
                                                                          _model.sliderValue =
                                                                              newValue);
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    formatNumber(
                                                                      _model
                                                                          .sliderValue,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .periodDecimal,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
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
                                                                            'PROMPT_LAB_PAGE_Icon_7879j2wn_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Icon_update_widget_state');
                                                                        setState(
                                                                            () {
                                                                          _model.configView =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .settings_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
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
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20.0,
                                        thickness: 1.0,
                                        indent: 12.0,
                                        endIndent: 12.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState().setCompletionPL !=
                                                null)
                                              Expanded(
                                                child: wrapWithModel(
                                                  model:
                                                      _model.plCompletionModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: PlCompletionWidget(
                                                    plSetCompletion:
                                                        FFAppState()
                                                            .setCompletionPL,
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
