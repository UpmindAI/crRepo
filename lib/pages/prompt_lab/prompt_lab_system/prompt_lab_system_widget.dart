import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'prompt_lab_system_model.dart';
export 'prompt_lab_system_model.dart';

class PromptLabSystemWidget extends StatefulWidget {
  const PromptLabSystemWidget({
    Key? key,
    this.setSystem,
  }) : super(key: key);

  final String? setSystem;

  @override
  _PromptLabSystemWidgetState createState() => _PromptLabSystemWidgetState();
}

class _PromptLabSystemWidgetState extends State<PromptLabSystemWidget> {
  late PromptLabSystemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromptLabSystemModel());

    _model.textController ??= TextEditingController(text: widget.setSystem);
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
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
      child: TextFormField(
        controller: _model.textController,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'System Prompt',
          hintText: '[Set the instructions here...]',
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
