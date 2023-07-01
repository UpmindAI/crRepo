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
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.flask,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 50.0,
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
                                fontSize: 47.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .displayLargeFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: Text(
                            'You have no prompts yet,',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 14.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
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

                            var promptlabRecordReference1 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference1
                                .set(createPromptlabRecordData(
                              folderName: 'Articles',
                            ));
                            _model.articlesFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName: 'Articles',
                                    ),
                                    promptlabRecordReference1);
                            logFirebaseEvent('Text_backend_call');

                            var promptlabRecordReference2 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference2
                                .set(createPromptlabRecordData(
                              folderName: 'Blog Posts',
                            ));
                            _model.blogFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName: 'Blog Posts',
                                    ),
                                    promptlabRecordReference2);
                            logFirebaseEvent('Text_backend_call');

                            var promptlabRecordReference3 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference3
                                .set(createPromptlabRecordData(
                              folderName: 'Text Summarization',
                            ));
                            _model.summarizerFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName: 'Text Summarization',
                                    ),
                                    promptlabRecordReference3);
                            logFirebaseEvent('Text_backend_call');

                            var promptlabRecordReference4 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference4
                                .set(createPromptlabRecordData(
                              folderName: 'Sentiment Analysis',
                            ));
                            _model.sentimentAnalysisFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName: 'Sentiment Analysis',
                                    ),
                                    promptlabRecordReference4);
                            logFirebaseEvent('Text_backend_call');

                            var promptlabRecordReference5 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference5
                                .set(createPromptlabRecordData(
                              folderName: 'Chatbots and Conversational AI',
                            ));
                            _model.chatbotsandConversationalAIFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName:
                                          'Chatbots and Conversational AI',
                                    ),
                                    promptlabRecordReference5);
                            logFirebaseEvent('Text_backend_call');

                            var promptlabRecordReference6 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference6
                                .set(createPromptlabRecordData(
                              folderName: 'Machine Translation',
                            ));
                            _model.machineTranslationFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName: 'Machine Translation',
                                    ),
                                    promptlabRecordReference6);
                            logFirebaseEvent('Text_backend_call');

                            var promptlabRecordReference7 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference7
                                .set(createPromptlabRecordData(
                              folderName: 'Named Entity Recognition',
                            ));
                            _model.namedEntityRecognitionFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName: 'Named Entity Recognition',
                                    ),
                                    promptlabRecordReference7);
                            logFirebaseEvent('Text_backend_call');

                            var promptlabRecordReference8 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference8
                                .set(createPromptlabRecordData(
                              folderName: 'Anomaly Detection',
                            ));
                            _model.anomalyDetectionFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName: 'Anomaly Detection',
                                    ),
                                    promptlabRecordReference8);
                            logFirebaseEvent('Text_backend_call');

                            var promptlabRecordReference9 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference9
                                .set(createPromptlabRecordData(
                              folderName: 'Content-based Filtering',
                            ));
                            _model.contentbasedFilteringFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName: 'Content-based Filtering',
                                    ),
                                    promptlabRecordReference9);
                            logFirebaseEvent('Text_backend_call');

                            var promptlabRecordReference10 =
                                PromptlabRecord.createDoc(
                                    currentUserReference!);
                            await promptlabRecordReference10
                                .set(createPromptlabRecordData(
                              folderName: 'Data Augmentation',
                            ));
                            _model.dataAugmentationFolder =
                                PromptlabRecord.getDocumentFromData(
                                    createPromptlabRecordData(
                                      folderName: 'Data Augmentation',
                                    ),
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
                                  fontSize: 14.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
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
      ],
    );
  }
}
