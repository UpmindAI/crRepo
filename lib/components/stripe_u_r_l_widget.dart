import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stripe_u_r_l_model.dart';
export 'stripe_u_r_l_model.dart';

class StripeURLWidget extends StatefulWidget {
  const StripeURLWidget({Key? key}) : super(key: key);

  @override
  _StripeURLWidgetState createState() => _StripeURLWidgetState();
}

class _StripeURLWidgetState extends State<StripeURLWidget> {
  late StripeURLModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StripeURLModel());

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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1000.0,
              height: 800.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FlutterFlowWebView(
                content: 'https://buy.stripe.com/fZe7vGdT6eBu4Zq144',
                bypass: false,
                width: 1000.0,
                height: 800.0,
                verticalScroll: false,
                horizontalScroll: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
