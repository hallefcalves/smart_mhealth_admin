import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class BoxRemedio extends StatelessWidget {
  const BoxRemedio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(38, 0, 38, 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border:
                Border.all(color: MyTheme.defaultTheme.primaryColor, width: 2)),
        child: Stack(
          children: const [
            Align(
                alignment: AlignmentDirectional(-0.85, 0),
                child: Text("Sinvastatina")),
          ],
        ),
      ),
    );
  }
}
