import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kMainColor = Color(0xFFFF8400);
const kGreyTextColor = Color(0xFF959595);
const kBorderColorTextField = Color(0xFFC2C2C2);
const kDarkWhite = Color(0xFFF1F7F7);
const kTitleColor = Color(0xFF040404);
const kAlertColor = Color(0xFFFF8919);
const kBgColor = Color(0xFFF7F7F8);
const kRedColor = Color(0xFFFF3232);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;
const kTransparent = Colors.transparent;

//Paypal Settings
const String paypalClientId =
    'ATKxCBB49G3rPw4DG_0vDmygbZeFKubzub7jGWpeUW5jzfElK9qOzqJOfrBTYvS7RuIhoPdWHB4DIdLJ';
const String paypalClientSecret =
    'EIDqVfraXlxDBMnswmhqP2qYv6rr_KPDgK269T-q1K9tB455OpPL_fc65irFiPBpiVXcoOQwpKqU3PAu';
const bool sandbox = true;
const String currency = 'INR';
const String currencyIcon = '\u{20B9}';

//Onesignal Settings
const String oneSignalAppId = 'c031bb73-7033-4ca9-bf1e-06c56e2e462c';

//Razorpay Settings
const String companyName = 'Event Cart';
const String razorPayApiKey = 'rzp_test_077r51eVK4wDK7';
const String companyDescription = 'Event Company';

final kTextStyle = GoogleFonts.manrope(
  color: kTitleColor,
);

const kButtonDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
);

const kInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: kBorderColorTextField),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: Color(0xFFE8E7E5),
    ),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

List<String> countries = [
  'AFGHANISTAN',
  'ALAND ISLANDS',
  'ALBANIA',
  'ALGERIA',
  'AMERICAN SAMOA',
  'ANDORRA',
  'ANGOLA',
  'ANGUILLA',
  'ANTARCTICA',
  'ANTIGUA AND BARBUDA',
  'ARGENTINA',
  'ARMENIA',
  'ARUBA',
  'ASIA PACIFIC REGION',
  'AUSTRALIA',
  'AUSTRIA',
  'AZERBAIJAN',
  'BAHAMAS',
  'BAHRAIN',
  'BANGLADESH',
  'BARBADOS',
  'BELARUS',
  'BELGIUM',
  'BELIZE',
  'BENIN',
  'BERMUDA',
  'BHUTAN',
  'BOLIVIA',
  'BONAIRE, SINT EUSTATIUS AND SABA',
  'BOSNIA AND HERZEGOVINA',
  'BOTSWANA',
  'BOUVET ISLAND',
  'BRAZIL',
  'BRITISH INDIAN OCEAN TERRITORY',
  'BRUNEI DARUSSALAM',
  'BULGARIA',
  'BURKINA FASO',
  'BURUNDI',
  'CAMBODIA',
  'CAMEROON',
  'CANADA',
  'CAPE VERDE',
  'CAYMAN ISLANDS',
  'CENTRAL AFRICAN REPUBLIC',
  'CHAD',
  'CHILE',
  'CHINA',
  'CHRISTMAS ISLAND',
  'COCOS (KEELING) ISLANDS',
  'COLOMBIA',
  'COMOROS',
  'CONGO',
  'CONGO, THE DEMOCRATIC REPUBLIC OF THE',
  'COOK ISLANDS',
  'COSTA RICA',
  'COTE D\'IVOIRE',
  'CROATIA',
  'CUBA',
  'CURACAO',
  'CYPRUS',
  'CZECH REPUBLIC',
  'DENMARK',
  'DJIBOUTI',
  'DOMINICA',
  'DOMINICAN REPUBLIC',
  'ECUADOR',
  'EGYPT',
  'EL SALVADOR',
  'EQUATORIAL GUINEA',
  'ERITREA',
  'ESTONIA',
  'ETHIOPIA',
  'FALKLAND ISLANDS (MALVINAS)',
  'FAROE ISLANDS',
  'FIJI',
  'FINLAND',
  'FRANCE',
  'FRENCH GUIANA',
  'FRENCH POLYNESIA',
  'FRENCH SOUTHERN TERRITORIES',
  'GABON',
  'GAMBIA',
  'GEORGIA',
  'GERMANY',
  'GHANA',
  'GIBRALTAR',
  'GREECE',
  'GREENLAND',
  'GRENADA',
  'GUADELOUPE',
  'GUAM',
  'GUATEMALA',
  'GUERNSEY',
  'GUINEA',
  'GUINEA-BISSAU',
  'GUYANA',
  'HAITI',
  'HEARD ISLAND AND MCDONALD ISLANDS',
  'HOLY SEE (VATICAN CITY STATE)',
  'HONDURAS',
  'HONG KONG',
  'HUNGARY',
  'ICELAND',
  'INDIA',
  'INDONESIA',
  'IRAN, ISLAMIC REPUBLIC OF',
  'IRAQ',
  'IRELAND',
  'ISLE OF MAN',
  'ISRAEL',
  'ITALY',
  'JAMAICA',
  'JAPAN',
  'JERSEY',
  'JORDAN',
  'KAZAKHSTAN',
  'KENYA',
  'KIRIBATI',
  'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF',
  'KOREA, REPUBLIC OF',
  'KOSOVO',
  'KUWAIT',
  'KYRGYZSTAN',
  'LAO PEOPLE\'S DEMOCRATIC REPUBLIC',
  'LATVIA',
  'LEBANON',
  'LESOTHO',
  'LIBERIA',
  'LIBYAN ARAB JAMAHIRIYA',
  'LIECHTENSTEIN',
  'LITHUANIA',
  'LUXEMBOURG',
  'MACAO',
  'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF',
  'MADAGASCAR',
  'MALAWI',
  'MALAYSIA',
  'MALDIVES',
  'MALI',
  'MALTA',
  'MARSHALL ISLANDS',
  'MARTINIQUE',
  'MAURITANIA',
  'MAURITIUS',
  'MAYOTTE',
  'MEXICO',
  'MICRONESIA, FEDERATED STATES OF',
  'MOLDOVA, REPUBLIC OF',
  'MONACO',
  'MONGOLIA',
  'MONTENEGRO',
  'MONTSERRAT',
  'MOROCCO',
  'MOZAMBIQUE',
  'MYANMAR',
  'NAMIBIA',
  'NAURU',
  'NEPAL',
  'NETHERLANDS',
  'NETHERLANDS ANTILLES',
  'NEW CALEDONIA',
  'NEW ZEALAND',
  'NICARAGUA',
  'NIGER',
  'NIGERIA',
  'NIUE',
  'NORFOLK ISLAND',
  'NORTHERN MARIANA ISLANDS',
  'NORWAY',
  'OMAN',
  'PAKISTAN',
  'PALAU',
  'PALESTINIAN TERRITORY, OCCUPIED',
  'PANAMA',
  'PAPUA NEW GUINEA',
  'PARAGUAY',
  'PERU',
  'PHILIPPINES',
  'PITCAIRN',
  'POLAND',
  'PORTUGAL',
  'PUERTO RICO',
  'QATAR',
  'REUNION',
  'ROMANIA',
  'RUSSIAN FEDERATION',
  'RWANDA',
  'SAINT BARTHELEMY',
  'SAINT HELENA',
  'SAINT KITTS AND NEVIS',
  'SAINT LUCIA',
  'SAINT MARTIN',
  'SAINT PIERRE AND MIQUELON',
  'SAINT VINCENT AND THE GRENADINES',
  'SAMOA',
  'SAN MARINO',
  'SAO TOME AND PRINCIPE',
  'SAUDI ARABIA',
  'SENEGAL',
  'SERBIA',
  'SERBIA AND MONTENEGRO',
  'SEYCHELLES',
  'SIERRA LEONE',
  'SINGAPORE',
  'SINT MAARTEN',
  'SLOVAKIA',
  'SLOVENIA',
  'SOLOMON ISLANDS',
  'SOMALIA',
  'SOUTH AFRICA',
  'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS',
  'SOUTH SUDAN',
  'SPAIN',
  'SRI LANKA',
  'SUDAN',
  'SURINAME',
  'SVALBARD AND JAN MAYEN',
  'SWAZILAND',
  'SWEDEN',
  'SWITZERLAND',
  'SYRIAN ARAB REPUBLIC',
  'TAIWAN, PROVINCE OF CHINA',
  'TAJIKISTAN',
  'TANZANIA, UNITED REPUBLIC OF',
  'THAILAND',
  'TIMOR-LESTE',
  'TOGO',
  'TOKELAU',
  'TONGA',
  'TRINIDAD AND TOBAGO',
  'TUNISIA',
  'TURKEY',
  'TURKMENISTAN',
  'TURKS AND CAICOS ISLANDS',
  'TUVALU',
  'UGANDA',
  'UKRAINE',
  'UNITED ARAB EMIRATES',
  'UNITED KINGDOM',
  'UNITED STATES',
  'UNITED STATES MINOR OUTLYING ISLANDS',
  'URUGUAY',
  'UZBEKISTAN',
  'VANUATU',
  'VENEZUELA',
  'VIET NAM',
  'VIRGIN ISLANDS, BRITISH',
  'VIRGIN ISLANDS, U.S.',
  'WALLIS AND FUTUNA',
  'WESTERN SAHARA',
  'YEMEN',
  'ZAMBIA',
  'ZIMBABWE',
];
