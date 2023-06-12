import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/datasets/add_dataset/add_dataset_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_dataset_button_model.dart';
export 'new_dataset_button_model.dart';

class NewDatasetButtonWidget extends StatefulWidget {
  const NewDatasetButtonWidget({Key? key}) : super(key: key);

  @override
  _NewDatasetButtonWidgetState createState() => _NewDatasetButtonWidgetState();
}

class _NewDatasetButtonWidgetState extends State<NewDatasetButtonWidget> {
  late NewDatasetButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewDatasetButtonModel());

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

    return Container(
      width: MediaQuery.of(context).size.width * 4.0,
      height: MediaQuery.of(context).size.height * 4.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.folderOpen,
            color: FlutterFlowTheme.of(context).primary,
            size: 46.0,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
            child: Text(
              'No Datasets yet.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 14.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('NEW_DATASET_BUTTON_NEW_DATASET_BTN_ON_TA');
              logFirebaseEvent('Button_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: FlutterFlowTheme.of(context).overlay,
                barrierColor: FlutterFlowTheme.of(context).overlay,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.0,
                      child: AddDatasetWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            text: 'New Dataset',
            icon: Icon(
              Icons.create_new_folder_outlined,
              size: 15.0,
            ),
            options: FFButtonOptions(
              width: 180.0,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ],
      ),
    );
  }
}
