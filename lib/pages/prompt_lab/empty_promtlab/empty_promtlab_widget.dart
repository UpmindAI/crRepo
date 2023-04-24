import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_promtlab_model.dart';
export 'empty_promtlab_model.dart';

class EmptyPromtlabWidget extends StatefulWidget {
  const EmptyPromtlabWidget({Key? key}) : super(key: key);

  @override
  _EmptyPromtlabWidgetState createState() => _EmptyPromtlabWidgetState();
}

class _EmptyPromtlabWidgetState extends State<EmptyPromtlabWidget> {
  late EmptyPromtlabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPromtlabModel());

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500.0,
              height: 500.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.flask,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 60.0,
                          ),
                        ),
                        Text(
                          'Prompt Lab',
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displayLargeFamily,
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .displayLargeFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: Text(
                          'You have no prompts yet,',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 16.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'EMPTY_PROMTLAB_COMP_Text_avk3x5hb_ON_TAP');
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData1 =
                              createPromptlabRecordData(
                            folderName: 'Articles',
                          );
                          var promptlabRecordReference1 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference1
                              .set(promptlabCreateData1);
                          _model.articlesFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData1,
                                  promptlabRecordReference1);
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData2 =
                              createPromptlabRecordData(
                            folderName: 'Blog Posts',
                          );
                          var promptlabRecordReference2 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference2
                              .set(promptlabCreateData2);
                          _model.blogFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData2,
                                  promptlabRecordReference2);
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData3 =
                              createPromptlabRecordData(
                            folderName: 'Text Summarization',
                          );
                          var promptlabRecordReference3 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference3
                              .set(promptlabCreateData3);
                          _model.summarizerFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData3,
                                  promptlabRecordReference3);
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData4 =
                              createPromptlabRecordData(
                            folderName: 'Sentiment Analysis',
                          );
                          var promptlabRecordReference4 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference4
                              .set(promptlabCreateData4);
                          _model.sentimentAnalysisFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData4,
                                  promptlabRecordReference4);
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData5 =
                              createPromptlabRecordData(
                            folderName: 'Chatbots and Conversational AI',
                          );
                          var promptlabRecordReference5 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference5
                              .set(promptlabCreateData5);
                          _model.chatbotsandConversationalAIFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData5,
                                  promptlabRecordReference5);
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData6 =
                              createPromptlabRecordData(
                            folderName: 'Machine Translation',
                          );
                          var promptlabRecordReference6 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference6
                              .set(promptlabCreateData6);
                          _model.machineTranslationFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData6,
                                  promptlabRecordReference6);
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData7 =
                              createPromptlabRecordData(
                            folderName: 'Named Entity Recognition',
                          );
                          var promptlabRecordReference7 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference7
                              .set(promptlabCreateData7);
                          _model.namedEntityRecognitionFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData7,
                                  promptlabRecordReference7);
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData8 =
                              createPromptlabRecordData(
                            folderName: 'Anomaly Detection',
                          );
                          var promptlabRecordReference8 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference8
                              .set(promptlabCreateData8);
                          _model.anomalyDetectionFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData8,
                                  promptlabRecordReference8);
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData9 =
                              createPromptlabRecordData(
                            folderName: 'Content-based Filtering',
                          );
                          var promptlabRecordReference9 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference9
                              .set(promptlabCreateData9);
                          _model.contentbasedFilteringFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData9,
                                  promptlabRecordReference9);
                          logFirebaseEvent('Text_backend_call');

                          final promptlabCreateData10 =
                              createPromptlabRecordData(
                            folderName: 'Data Augmentation',
                          );
                          var promptlabRecordReference10 =
                              PromptlabRecord.createDoc(currentUserReference!);
                          await promptlabRecordReference10
                              .set(promptlabCreateData10);
                          _model.dataAugmentationFolder =
                              PromptlabRecord.getDocumentFromData(
                                  promptlabCreateData10,
                                  promptlabRecordReference10);

                          setState(() {});
                        },
                        child: Text(
                          'add some examples!',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
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
      ],
    );
  }
}
