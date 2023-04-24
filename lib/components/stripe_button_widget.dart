import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stripe_button_model.dart';
export 'stripe_button_model.dart';

class StripeButtonWidget extends StatefulWidget {
  const StripeButtonWidget({Key? key}) : super(key: key);

  @override
  _StripeButtonWidgetState createState() => _StripeButtonWidgetState();
}

class _StripeButtonWidgetState extends State<StripeButtonWidget> {
  late StripeButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StripeButtonModel());

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

    return Visibility(
      visible:
          (valueOrDefault(currentUserDocument?.totalCredits, 0.0) <= 0.0) ||
              (valueOrDefault(currentUserDocument?.totalCredits, 0.0) == null),
      child: AuthUserStreamWidget(
        builder: (context) => FFButtonWidget(
          onPressed: () async {
            logFirebaseEvent('STRIPE_BUTTON_COMP_BUY_NOW_BTN_ON_TAP');
            logFirebaseEvent('Button_show_snack_bar');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Processing your payment. One moment please.',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
              ),
            );
            logFirebaseEvent('Button_wait__delay');
            await Future.delayed(const Duration(milliseconds: 6000));
            if (valueOrDefault(currentUserDocument?.totalCredits, 0.0) >= 1.0) {
              logFirebaseEvent('Button_show_snack_bar');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'You´ve succesfully gained access to our beta for 30 days!',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  duration: Duration(milliseconds: 7000),
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                ),
              );
              logFirebaseEvent('Button_navigate_to');

              context.pushNamed('Home');
            }
          },
          text: 'Buy Now',
          options: FFButtonOptions(
            width: 130.0,
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
      ),
    );
  }
}
