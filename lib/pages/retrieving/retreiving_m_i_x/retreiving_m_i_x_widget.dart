import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/error_message/error_message_widget.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'retreiving_m_i_x_model.dart';
export 'retreiving_m_i_x_model.dart';

class RetreivingMIXWidget extends StatefulWidget {
  const RetreivingMIXWidget({
    Key? key,
    this.gr,
  }) : super(key: key);

  final String? gr;

  @override
  _RetreivingMIXWidgetState createState() => _RetreivingMIXWidgetState();
}

class _RetreivingMIXWidgetState extends State<RetreivingMIXWidget>
    with TickerProviderStateMixin {
  late RetreivingMIXModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1550.ms,
          begin: Offset(0.0, 900.0),
          end: Offset(0.0, -900.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RetreivingMIXModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'retreivingMIX'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('RETREIVING_M_I_X_retreivingMIX_ON_INIT_S');
      logFirebaseEvent('retreivingMIX_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please hold on while we are retreiving your results.',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          duration: Duration(milliseconds: 7000),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        ),
      );
      if (FFAppState().selectedDataset.length <= 0) {
        logFirebaseEvent('retreivingMIX_backend_call');
        _model.apiResultGPT2 = await GPTqueryCall.call(
          qid: FFAppState().setQid,
          idToken: currentJwtToken,
        );
        if ((_model.apiResultGPT2?.statusCode ?? 200) == 200) {
          logFirebaseEvent('retreivingMIX_navigate_to');

          context.pushNamed('ResultGPTonly');

          return;
        } else {
          logFirebaseEvent('retreivingMIX_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Color(0x65000000),
            barrierColor: Color(0x00000000),
            enableDrag: false,
            context: context,
            builder: (bottomSheetContext) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Padding(
                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1.0,
                    child: ErrorMessageWidget(),
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));

          logFirebaseEvent('retreivingMIX_wait__delay');
          await Future.delayed(const Duration(milliseconds: 5000));
          logFirebaseEvent('retreivingMIX_navigate_back');
          context.pop();
          return;
        }
      }
      logFirebaseEvent('retreivingMIX_backend_call');
      _model.apiResultMIX = await MixedQueryCall.call(
        qid: FFAppState().setQid,
        idToken: currentJwtToken,
        topK: FFAppState().setTopKplay,
        guardrail: widget.gr,
        datasetIdsList: FFAppState().selectedDataset,
      );
      if ((_model.apiResultMIX?.statusCode ?? 200) == 200) {
        logFirebaseEvent('retreivingMIX_navigate_to');

        context.pushNamed('Result');

        return;
      } else {
        logFirebaseEvent('retreivingMIX_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Color(0x65000000),
          barrierColor: Color(0x00000000),
          enableDrag: false,
          context: context,
          builder: (bottomSheetContext) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Padding(
                padding: MediaQuery.of(bottomSheetContext).viewInsets,
                child: Container(
                  height: MediaQuery.of(context).size.height * 1.0,
                  child: ErrorMessageWidget(),
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));

        logFirebaseEvent('retreivingMIX_wait__delay');
        await Future.delayed(const Duration(milliseconds: 5000));
        logFirebaseEvent('retreivingMIX_navigate_back');
        context.pop();
        return;
      }
    });

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
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                                    height: MediaQuery.of(context).size.height *
                                        1.0,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.98,
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
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1.0,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: ClipRect(
                                                  child: ImageFiltered(
                                                    imageFilter:
                                                        ImageFilter.blur(
                                                      sigmaX: 220.0,
                                                      sigmaY: 150.0,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.15, 0.0),
                                                      child: Transform.rotate(
                                                        angle: 2.1118,
                                                        child: Image.asset(
                                                          'assets/images/Rectangle_1.jpg',
                                                          width: 1000.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'imageOnPageLoadAnimation']!),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    width: 220.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    width: 220.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Container(
                                                      width: 220.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.98,
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
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
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
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Generating completion...',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
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
      ),
    );
  }
}
