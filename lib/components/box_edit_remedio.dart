import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxEditRemedio extends StatelessWidget {
  const BoxEditRemedio({Key? key}) : super(key: key);

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
          children: [
            const Align(
                alignment: AlignmentDirectional(-0.85, 0),
                child: Text("Sinvastatina")),
            Align(
              alignment: const AlignmentDirectional(0.9, 0),
              child: Container(
                  width: 28,
                  height: 28,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyTheme.defaultTheme.primaryColor),
                  child: const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: FaIcon(
                      FontAwesomeIcons.minus,
                      color: Colors.white,
                      size: 15,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
