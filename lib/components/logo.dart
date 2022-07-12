import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class LogoDeles extends StatelessWidget {
  const LogoDeles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 18),
        Image.asset(
          'lib/assets/images/O despertador.png',
          scale: 2.0,
        ),
        const SizedBox(height: 8),
        Image.asset(
          'lib/assets/images/Logo.png',
          scale: 2.0,
        ),
        const SizedBox(height: 12),
        Image.asset('lib/assets/images/Deles.png', scale: 2.0),
      ],
    );
  }
}
