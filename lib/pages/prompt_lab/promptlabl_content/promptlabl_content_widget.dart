import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'promptlabl_content_model.dart';
export 'promptlabl_content_model.dart';

class PromptlablContentWidget extends StatefulWidget {
  const PromptlablContentWidget({
    Key? key,
    this.setContent,
  }) : super(key: key);

  final String? setContent;

  @override
  _PromptlablContentWidgetState createState() =>
      _PromptlablContentWidgetState();
}

class _PromptlablContentWidgetState extends State<PromptlablContentWidget> {
  late PromptlablContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromptlablContentModel());

    _model.textController ??=
        TextEditingController(text: FFAppState().setContentPL);
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 4.0),
      child: TextFormField(
        controller: _model.textController,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Context',
          hintText: '[Add context here...]',
          hintStyle: FlutterFlowTheme.of(context).bodySmall,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).secondary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              fontWeight: FontWeight.normal,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
        maxLines: 8,
        minLines: 4,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
