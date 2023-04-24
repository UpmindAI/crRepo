import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/error_message/error_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_a_p_i_model.dart';
export 'test_a_p_i_model.dart';

class TestAPIWidget extends StatefulWidget {
  const TestAPIWidget({Key? key}) : super(key: key);

  @override
  _TestAPIWidgetState createState() => _TestAPIWidgetState();
}

class _TestAPIWidgetState extends State<TestAPIWidget> {
  late TestAPIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestAPIModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'testAPI'});
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
                preferredSize: Size.fromHeight(50.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'API Test',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 22.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .headlineMediumFamily),
                            ),
                      ),
                    ),
                    centerTitle: false,
                    expandedTitleScale: 1.0,
                  ),
                  elevation: 0.0,
                ),
              )
            : null,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        'MIXGPTquery',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'TEST_A_P_I_PAGE_TEST_BTN_ON_TAP');
                                          var _shouldSetState = false;
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().update(() {
                                            FFAppState().setQid =
                                                random_data.randomString(
                                              7,
                                              7,
                                              true,
                                              true,
                                              true,
                                            );
                                          });
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          final userPromptsCreateData =
                                              createUserPromptsRecordData(
                                            qid: FFAppState().setQid,
                                            prompt: 'Test',
                                          );
                                          var userPromptsRecordReference =
                                              UserPromptsRecord.createDoc(
                                                  currentUserReference!);
                                          await userPromptsRecordReference
                                              .set(userPromptsCreateData);
                                          _model.setPrompttextMIX =
                                              UserPromptsRecord
                                                  .getDocumentFromData(
                                                      userPromptsCreateData,
                                                      userPromptsRecordReference);
                                          _shouldSetState = true;
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.apiResultMIXtest =
                                              await MixedQueryCall.call(
                                            qid: _model.setPrompttextMIX!.qid,
                                            idToken: currentJwtToken,
                                            topK: 5,
                                            guardrail: 'yes',
                                            datasetIdsList:
                                                FFAppState().selectedDataset,
                                          );
                                          _shouldSetState = true;
                                          if ((_model.apiResultMIXtest
                                                      ?.bodyText ??
                                                  '') ==
                                              FFAppState().testAPIbody) {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.apiResultMIXtest
                                                              ?.statusCode ??
                                                          200)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .green,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Button_wait__delay');
                                            await Future.delayed(const Duration(
                                                milliseconds: 3000));
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.apiResultMIXtest
                                                              ?.jsonBody ??
                                                          '')
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .green,
                                              ),
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.apiResultMIXtest
                                                              ?.statusCode ??
                                                          200)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0xFF980000),
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.apiResultMIXtest
                                                              ?.jsonBody ??
                                                          '')
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0xFF980000),
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x00000000),
                                              enableDrag: false,
                                              context: context,
                                              builder: (bottomSheetContext) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              _unfocusNode),
                                                  child: Padding(
                                                    padding: MediaQuery.of(
                                                            bottomSheetContext)
                                                        .viewInsets,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              1.0,
                                                      child:
                                                          ErrorMessageWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
                                        },
                                        text: 'Test',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        'scrapeServer',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Test',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        'datasetGPTserver',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Test',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        'multiUploadserver',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Test',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        'recursiveSummarizer',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Test',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        'chatServer',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'TEST_A_P_I_PAGE_TEST_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.chatAPItest =
                                              await MixedChatCall.call(
                                            idToken: currentJwtToken,
                                            qid: random_data.randomString(
                                              6,
                                              6,
                                              true,
                                              true,
                                              true,
                                            ),
                                            cid: FFAppState().setCid,
                                            datasetIdsList:
                                                FFAppState().selectedDataset,
                                            topK: FFAppState().setTopKplay,
                                          );
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                (_model.chatAPItest
                                                            ?.statusCode ??
                                                        200)
                                                    .toString(),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary400,
                                            ),
                                          );
                                          logFirebaseEvent(
                                              'Button_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 3000));
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                (_model.chatAPItest?.jsonBody ??
                                                        '')
                                                    .toString(),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .green,
                                            ),
                                          );
                                          if ((_model.chatAPItest?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.chatAPItest
                                                              ?.statusCode ??
                                                          200)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .green,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Button_wait__delay');
                                            await Future.delayed(const Duration(
                                                milliseconds: 3000));
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.chatAPItest
                                                              ?.jsonBody ??
                                                          '')
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .green,
                                              ),
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.chatAPItest
                                                              ?.statusCode ??
                                                          200)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0xFF980000),
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Color(0x3C000000),
                                              barrierColor: Color(0x3C000000),
                                              enableDrag: false,
                                              context: context,
                                              builder: (bottomSheetContext) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              _unfocusNode),
                                                  child: Padding(
                                                    padding: MediaQuery.of(
                                                            bottomSheetContext)
                                                        .viewInsets,
                                                    child: Container(
                                                      height: 700.0,
                                                      child:
                                                          ErrorMessageWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            logFirebaseEvent(
                                                'Button_wait__delay');
                                            await Future.delayed(const Duration(
                                                milliseconds: 3000));
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.chatAPItest
                                                              ?.jsonBody ??
                                                          '')
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0xFF980000),
                                              ),
                                            );
                                          }

                                          setState(() {});
                                        },
                                        text: 'Test',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        'testAPI',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Test',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Guardrail',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Switch(
                              value: _model.guardrailValue ??= true,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.guardrailValue = newValue!);
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                (_model.chatAPItest?.jsonBody ?? '').toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  (_model.chatAPItest?.statusCode ?? 200)
                                      .toString(),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  (_model.chatAPItest?.bodyText ?? ''),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
            ],
          ),
        ),
      ),
    );
  }
}
