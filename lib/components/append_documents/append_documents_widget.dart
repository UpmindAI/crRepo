import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'append_documents_model.dart';
export 'append_documents_model.dart';

class AppendDocumentsWidget extends StatefulWidget {
  const AppendDocumentsWidget({Key? key}) : super(key: key);

  @override
  _AppendDocumentsWidgetState createState() => _AppendDocumentsWidgetState();
}

class _AppendDocumentsWidgetState extends State<AppendDocumentsWidget> {
  late AppendDocumentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppendDocumentsModel());

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

    return Container();
  }
}
