import 'package:flutter/material.dart';

// const Color Theme.of(context).primaryColor = Color(0xFFDB3022);
const Color ehpPrimaryColor = Color(0xFF184E77);
const Color ehpLightPrimaryColor = Color(0xFF1E6091);
const Color ehpLightPrimaryColor2 = Color(0xFF1A759F);
const Color ehpLightPrimaryColor3 = Color(0xFF168AAD);
const Color ehpLightPrimaryColor4 = Color(0xFF34A0A4);
const Color ehpLightPrimaryColor5 = Color(0xFF52B69A);
const Color ehpLightPrimaryColor6 = Color(0xFF76C893);
const Color ehpLightPrimaryColor7 = Color(0xFF99D98C);
const Color ehpLightPrimaryColor8 = Color(0xFFB5E48C);
const Color ehpLightPrimaryColor9 = Color(0xFFD9ED92);

const Color ehpSecondaryColor = Color(0xFFFFFFFF);
const Color ehpGray = Color(0xFF9B9B9B);
const Color ehpBlack = Color.fromARGB(255, 0, 0, 0);
const Color ehpBackground = Color(0xFFF9F9F9);
const Color ehpYellow = Color(0xFFFFBA49);

class EhpPadding {
  static const h16 = EdgeInsets.symmetric(horizontal: 16);
  static const v16 = EdgeInsets.symmetric(vertical: 16);
  static const a16 = EdgeInsets.all(16);

  static const h8 = EdgeInsets.symmetric(horizontal: 8);
  static const v8 = EdgeInsets.symmetric(vertical: 8);
  static const v12 = EdgeInsets.symmetric(vertical: 12);
  static const a8 = EdgeInsets.all(8);

  static const a24 = EdgeInsets.all(24);

  static const v4 = EdgeInsets.symmetric(vertical: 4);
  static const a4 = EdgeInsets.all(4);
  static const h4 = EdgeInsets.symmetric(horizontal: 4);

  static const t16 = EdgeInsets.only(top: 16);
  static const b16 = EdgeInsets.only(bottom: 16);
  static const l16 = EdgeInsets.only(left: 16);
  static const r16 = EdgeInsets.only(right: 16);

  static const v2 = EdgeInsets.symmetric(vertical: 2);
  static const a2 = EdgeInsets.all(2);

  static const t8 = EdgeInsets.only(top: 8);
  static const b8 = EdgeInsets.only(bottom: 8);
  static const l8 = EdgeInsets.only(left: 8);
  static const r8 = EdgeInsets.only(right: 8);

  static const t4 = EdgeInsets.only(top: 4);
  static const b4 = EdgeInsets.only(bottom: 4);
  static const r4 = EdgeInsets.only(right: 4);
  static const l4 = EdgeInsets.only(left: 4);

  static const containerCenter = EdgeInsets.fromLTRB(16, 8, 16, 8);
  static const containerCenter2 = EdgeInsets.fromLTRB(8, 4, 8, 4);
  static const containerCenter3 = EdgeInsets.fromLTRB(16, 0, 16, 8);
  static const containerCenter4 = EdgeInsets.fromLTRB(16, 8, 16, 0);
  static const containerCenter5 = EdgeInsets.fromLTRB(16, 4, 4, 16);
  static const containerCenter6 = EdgeInsets.fromLTRB(16, 8, 24, 0);
  static const containerCenter7 = EdgeInsets.fromLTRB(16, 4, 16, 4);
  static const containerCenter8 = EdgeInsets.fromLTRB(4, 2, 4, 2);
  static const containerCenter9 = EdgeInsets.fromLTRB(16, 16, 16, 4);
  static const containerCenter10 = EdgeInsets.fromLTRB(16, 8, 16, 4);

  static const zero = EdgeInsets.zero;
}

class EhpSizedBox {
  static const shrink = SizedBox.shrink();

  static const h16 = SizedBox(height: 16);
  static const h20 = SizedBox(height: 20);
  static const h24 = SizedBox(height: 24);
  static const h28 = SizedBox(height: 28);
  static const h32 = SizedBox(height: 32);
  static const h48 = SizedBox(height: 48);
  static const h8 = SizedBox(height: 8);
  static const h4 = SizedBox(height: 4);

  static const w16 = SizedBox(width: 16);
  static const w28 = SizedBox(width: 28);
  static const w8 = SizedBox(width: 8);
  static const w4 = SizedBox(width: 4);
}

class EhpTextStyle {
  static const title = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const labelText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ehpGray,
  );

  static const labelTextBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const h3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const h4 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const h5 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const h6 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

  static const b1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );
  static const b2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const b3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const b4 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const b5 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  static const b6 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );
}

List<BoxShadow> customShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.2),
      spreadRadius: -2,
      offset: const Offset(-2, -2),
      blurRadius: 30),
  BoxShadow(
      color: Colors.blue[900]!.withOpacity(.2),
      spreadRadius: 2,
      offset: const Offset(7, 7),
      blurRadius: 20)
];

List<BoxShadow> customShadow2 = [
  BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: -2,
      offset: const Offset(-2, -2),
      blurRadius: 30),
  BoxShadow(
      color: Colors.blue[900]!.withOpacity(.2),
      spreadRadius: 2,
      offset: const Offset(7, 7),
      blurRadius: 20)
];
