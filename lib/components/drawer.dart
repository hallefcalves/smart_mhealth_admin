import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:smart_mhealth_admin/screens/agendas.dart';
import 'package:smart_mhealth_admin/screens/colaboradores.dart';
import 'package:smart_mhealth_admin/screens/listagem_remedios.dart';
import 'package:smart_mhealth_admin/screens/meus_cuidados.dart';
import 'package:smart_mhealth_admin/screens/perfil_cuidador.dart';
import 'package:smart_mhealth_admin/screens/relatorios.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);
  final String userIcon =
      '<svg width="34" height="45" viewBox="0 0 34 45" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0.430176 6.16113C0.430176 4.71073 1.00635 3.31973 2.03194 2.29414C3.05753 1.26855 4.44852 0.692383 5.89893 0.692383L27.7739 0.692383C29.2243 0.692383 30.6153 1.26855 31.6409 2.29414C32.6665 3.31973 33.2427 4.71073 33.2427 6.16113V38.9736C33.2427 40.424 32.6665 41.815 31.6409 42.8406C30.6153 43.8662 29.2243 44.4424 27.7739 44.4424H5.89893C4.44852 44.4424 3.05753 43.8662 2.03194 42.8406C1.00635 41.815 0.430176 40.424 0.430176 38.9736V6.16113ZM12.7349 6.16113C12.3723 6.16113 12.0245 6.30518 11.7681 6.56157C11.5117 6.81797 11.3677 7.16572 11.3677 7.52832C11.3677 7.89092 11.5117 8.23867 11.7681 8.49507C12.0245 8.75147 12.3723 8.89551 12.7349 8.89551H20.938C21.3006 8.89551 21.6483 8.75147 21.9047 8.49507C22.1611 8.23867 22.3052 7.89092 22.3052 7.52832C22.3052 7.16572 22.1611 6.81797 21.9047 6.56157C21.6483 6.30518 21.3006 6.16113 20.938 6.16113H12.7349ZM16.8364 30.7705C19.012 30.7705 21.0985 29.9063 22.6369 28.3679C24.1753 26.8295 25.0396 24.743 25.0396 22.5674C25.0396 20.3918 24.1753 18.3053 22.6369 16.7669C21.0985 15.2285 19.012 14.3643 16.8364 14.3643C14.6608 14.3643 12.5743 15.2285 11.0359 16.7669C9.49756 18.3053 8.6333 20.3918 8.6333 22.5674C8.6333 24.743 9.49756 26.8295 11.0359 28.3679C12.5743 29.9063 14.6608 30.7705 16.8364 30.7705ZM30.5083 38.3037C28.1731 35.7607 24.0087 33.5049 16.8364 33.5049C9.66416 33.5049 5.49971 35.7635 3.16455 38.3037V38.9736C3.16455 39.6988 3.45264 40.3943 3.96543 40.9071C4.47823 41.4199 5.17372 41.708 5.89893 41.708H27.7739C28.4991 41.708 29.1946 41.4199 29.7074 40.9071C30.2202 40.3943 30.5083 39.6988 30.5083 38.9736V38.3037Z" fill="#82C5BB"/></svg>';
  final String gearIcon =
      '<svg width="31" height="32" viewBox="0 0 31 32" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M20.6032 29.9213C20.4491 30.9696 19.4932 31.8021 18.3524 31.8021H12.6482C11.5074 31.8021 10.5516 30.9696 10.4128 29.8442L9.99657 26.9304C9.58032 26.7146 9.17949 26.4833 8.77865 26.2213L6.00365 27.3313C4.92449 27.7321 3.7374 27.285 3.21324 26.3292L0.391987 21.4421C-0.147596 20.4246 0.0836539 19.2221 0.946987 18.5438L3.30574 16.7092C3.29032 16.4779 3.2749 16.2467 3.2749 16C3.2749 15.7688 3.29032 15.5221 3.30574 15.2908L0.962404 13.4563C0.0528206 12.7625 -0.178429 11.5138 0.391987 10.5579L3.24407 5.64001C3.76824 4.68418 4.95532 4.25252 6.00365 4.66877L8.79407 5.79418C9.1949 5.5321 9.59574 5.30085 9.99657 5.08502L10.4128 2.14043C10.5516 1.06127 11.5074 0.213348 12.6328 0.213348H18.337C19.4778 0.213348 20.4337 1.04585 20.5724 2.17127L20.9887 5.08502C21.4049 5.30085 21.8057 5.5321 22.2066 5.79418L24.9816 4.68418C26.0762 4.28335 27.2632 4.73043 27.7874 5.68626L30.6241 10.5888C31.1791 11.6063 30.9324 12.8088 30.0691 13.4871L27.7257 15.3217C27.7412 15.5529 27.7566 15.7842 27.7566 16.0308C27.7566 16.2775 27.7412 16.5088 27.7257 16.74L30.0691 18.5746C30.9324 19.2683 31.1791 20.4708 30.6395 21.4421L27.772 26.4063C27.2478 27.3621 26.0607 27.7938 24.997 27.3775L22.222 26.2675C21.8212 26.5296 21.4203 26.7608 21.0195 26.9767L20.6032 29.9213ZM13.3728 28.7188H17.6278L18.1982 24.7875L19.0153 24.4483C19.6937 24.1708 20.372 23.77 21.0812 23.2458L21.7749 22.7217L25.4441 24.2017L27.5716 20.5017L24.442 18.0658L24.5499 17.2025L24.5547 17.161C24.5993 16.775 24.6424 16.4019 24.6424 16C24.6424 15.5838 24.5962 15.1829 24.5499 14.7975L24.442 13.9342L27.5716 11.4983L25.4287 7.79835L21.7441 9.27835L21.0503 8.73876C20.4028 8.24543 19.7091 7.8446 18.9999 7.55168L18.1982 7.21251L17.6278 3.28127H13.3728L12.8024 7.21251L11.9853 7.53626C11.307 7.82918 10.6287 8.2146 9.91949 8.75418L9.22574 9.26293L5.55657 7.79835L3.41365 11.4829L6.54324 13.9188L6.43532 14.7821C6.38907 15.1829 6.34282 15.5992 6.34282 16C6.34282 16.4008 6.37365 16.8171 6.43532 17.2025L6.54324 18.0658L3.41365 20.5017L5.54115 24.2017L9.22574 22.7217L9.91949 23.2613C10.5824 23.77 11.2453 24.1554 11.9699 24.4483L12.787 24.7875L13.3728 28.7188ZM20.8962 16C20.8962 18.9801 18.4804 21.3958 15.5003 21.3958C12.5203 21.3958 10.1045 18.9801 10.1045 16C10.1045 13.02 12.5203 10.6042 15.5003 10.6042C18.4804 10.6042 20.8962 13.02 20.8962 16Z" fill="#6CB1A6"/></svg>';

  final double _spaceBetween = 7.5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: kToolbarHeight * 0.95,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: MyTheme.defaultTheme.appBarTheme.backgroundColor,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 2,
                      child: Icon(
                        Icons.person,
                        color: MyTheme.defaultTheme.primaryColor,
                        size: 20,
                      ),
                    ),
                    const Positioned(
                      top: 0,
                      left: 30,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 12,
                      left: 35,
                      child: Text(
                        'Title',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -15,
                      left: 100,
                      right: 80,
                      child: IconButton(
                        onPressed: () => {
                          Navigator.pop(context),
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: MyTheme.defaultTheme.primaryColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(bottom: _spaceBetween),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MeusCuidados(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: MyTheme.defaultTheme.primaryColor,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: MyTheme.defaultTheme.primaryColor,
                      ),
                    ),
                  ),
                  child: const Text('Meus Cuidados'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: _spaceBetween),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListagemRemedios(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: MyTheme.defaultTheme.primaryColor,
                    primary: Colors.white,
                    textStyle: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: MyTheme.defaultTheme.primaryColor,
                      ),
                    ),
                  ),
                  child: const Text('Remédios'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: _spaceBetween),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Agendas(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: MyTheme.defaultTheme.primaryColor,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: MyTheme.defaultTheme.primaryColor,
                      ),
                    ),
                  ),
                  child: const Text('Agendas'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: _spaceBetween),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Relatorios(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: MyTheme.defaultTheme.primaryColor,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: MyTheme.defaultTheme.primaryColor,
                      ),
                    ),
                  ),
                  child: const Text('Relatórios'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: _spaceBetween),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Colaboradores(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: MyTheme.defaultTheme.primaryColor,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: MyTheme.defaultTheme.primaryColor,
                      ),
                    ),
                  ),
                  child: const Text('Colaboradores'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: _spaceBetween),
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: MyTheme.defaultTheme.primaryColor,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: MyTheme.defaultTheme.primaryColor,
                      ),
                    ),
                  ),
                  child: const Text('Notificações'),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: _spaceBetween),
              child: Center(
                child: TextButton.icon(
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PerfilCuidador(),
                    ))
                  },
                  icon: Iconify(
                    userIcon,
                  ),
                  label: const Text('Meu Perfil'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    primary: MyTheme.defaultTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: MyTheme.defaultTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: _spaceBetween),
              child: Center(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Iconify(
                    gearIcon,
                  ),
                  label: const Text('Configurações'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    primary: MyTheme.defaultTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: MyTheme.defaultTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 120,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: MyTheme.defaultTheme.appBarTheme.backgroundColor),
                child: ListView(children: const [
                  Text("Dúvidas"),
                  Text("Link"),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}