import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:smart_mhealth_admin/components/logo.dart';
import 'package:smart_mhealth_admin/components/notification.dart';
import 'package:smart_mhealth_admin/screens/agendas.dart';
import 'package:smart_mhealth_admin/screens/cadastro_admin.dart';
import 'package:smart_mhealth_admin/screens/colaboradores.dart';
import 'package:smart_mhealth_admin/screens/listagem_remedios.dart';
import 'package:smart_mhealth_admin/screens/meus_cuidados.dart';
import 'package:smart_mhealth_admin/screens/perfil_cuidador.dart';
import 'package:smart_mhealth_admin/screens/relatorios.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:smart_mhealth_admin/util/sessao.dart';

import '../http/cuidador/cuidador.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  void initState() {
    super.initState();
    obtemLogado();
  }

  final String image = 'lib/assets/images/Logo_Verde.png';

  String userLogado = "";

  //todo: other icons
  final String userIcon =
      '<svg width="34" height="45" viewBox="0 0 34 45" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0.430176 6.16113C0.430176 4.71073 1.00635 3.31973 2.03194 2.29414C3.05753 1.26855 4.44852 0.692383 5.89893 0.692383L27.7739 0.692383C29.2243 0.692383 30.6153 1.26855 31.6409 2.29414C32.6665 3.31973 33.2427 4.71073 33.2427 6.16113V38.9736C33.2427 40.424 32.6665 41.815 31.6409 42.8406C30.6153 43.8662 29.2243 44.4424 27.7739 44.4424H5.89893C4.44852 44.4424 3.05753 43.8662 2.03194 42.8406C1.00635 41.815 0.430176 40.424 0.430176 38.9736V6.16113ZM12.7349 6.16113C12.3723 6.16113 12.0245 6.30518 11.7681 6.56157C11.5117 6.81797 11.3677 7.16572 11.3677 7.52832C11.3677 7.89092 11.5117 8.23867 11.7681 8.49507C12.0245 8.75147 12.3723 8.89551 12.7349 8.89551H20.938C21.3006 8.89551 21.6483 8.75147 21.9047 8.49507C22.1611 8.23867 22.3052 7.89092 22.3052 7.52832C22.3052 7.16572 22.1611 6.81797 21.9047 6.56157C21.6483 6.30518 21.3006 6.16113 20.938 6.16113H12.7349ZM16.8364 30.7705C19.012 30.7705 21.0985 29.9063 22.6369 28.3679C24.1753 26.8295 25.0396 24.743 25.0396 22.5674C25.0396 20.3918 24.1753 18.3053 22.6369 16.7669C21.0985 15.2285 19.012 14.3643 16.8364 14.3643C14.6608 14.3643 12.5743 15.2285 11.0359 16.7669C9.49756 18.3053 8.6333 20.3918 8.6333 22.5674C8.6333 24.743 9.49756 26.8295 11.0359 28.3679C12.5743 29.9063 14.6608 30.7705 16.8364 30.7705ZM30.5083 38.3037C28.1731 35.7607 24.0087 33.5049 16.8364 33.5049C9.66416 33.5049 5.49971 35.7635 3.16455 38.3037V38.9736C3.16455 39.6988 3.45264 40.3943 3.96543 40.9071C4.47823 41.4199 5.17372 41.708 5.89893 41.708H27.7739C28.4991 41.708 29.1946 41.4199 29.7074 40.9071C30.2202 40.3943 30.5083 39.6988 30.5083 38.9736V38.3037Z" fill="#82C5BB"/></svg>';
  final String cuidadoIcon =
      '<svg width="115" height="98" viewBox="0 0 115 98" fill="none" xmlns="http://www.w3.org/2000/svg"> <g clip-path="url(#clip0_267_23674)"><g clip-path="url(#clip1_267_23674)"><path d="M46.8243 40.5195C48.9803 40.5195 51.0479 39.663 52.5725 38.1385C54.097 36.614 54.9534 34.5463 54.9534 32.3903C54.9534 30.2343 54.097 28.1666 52.5725 26.6421C51.0479 25.1176 48.9803 24.2611 46.8243 24.2611C44.6683 24.2611 42.6006 25.1176 41.0761 26.6421C39.5516 28.1666 38.6951 30.2343 38.6951 32.3903C38.6951 34.5463 39.5516 36.614 41.0761 38.1385C42.6006 39.663 44.6683 40.5195 46.8243 40.5195ZM35.6792 52.5811C35.9923 52.2057 36.3205 51.8429 36.6628 51.4938V87.2622C36.6622 88.3019 37.0599 89.3023 37.7743 90.0576C38.4887 90.813 39.4654 91.2659 40.5035 91.3232C41.5416 91.3804 42.5622 91.0377 43.3553 90.3655C44.1485 89.6933 44.6539 88.7428 44.7676 87.7093L46.3975 73.0362H47.251L48.8809 87.7093C48.9947 88.7428 49.5001 89.6933 50.2932 90.3655C51.0864 91.0377 52.1069 91.3804 53.145 91.3232C54.1831 91.2659 55.1598 90.813 55.8742 90.0576C56.5886 89.3023 56.9864 88.3019 56.9857 87.2622V59.5417C57.2906 57.924 58.4307 55.5808 60.2293 53.3798C61.8409 55.3613 62.9241 57.4566 63.3428 59.0377C63.3001 62.393 60.5992 74.9506 59.4895 79.9886C59.4284 80.259 59.424 80.5392 59.4766 80.8113C59.5293 81.0835 59.6378 81.3417 59.7954 81.5698C59.953 81.7979 60.1562 81.9908 60.3921 82.1363C60.6281 82.2818 60.8916 82.3768 61.1662 82.4152C68.6714 83.4456 75.1565 83.4435 82.5987 82.4965C83.9868 82.3197 84.7977 80.7812 84.2937 79.4745C82.7959 75.5867 80.3571 67.5124 80.3571 56.1234V50.1769C81.1497 50.7866 81.9829 51.5873 82.8121 52.5811C84.9603 55.156 86.2934 58.1049 86.4682 59.938C86.5577 60.7326 86.9557 61.4602 87.5765 61.964C88.1973 62.4679 88.9912 62.7077 89.7872 62.6317C90.5831 62.5557 91.3173 62.1701 91.8316 61.5579C92.3459 60.9457 92.5991 60.1559 92.5367 59.3588C92.2054 55.8714 90.0979 51.7967 87.4945 48.6771C84.9664 45.6449 81.1558 42.5518 76.8819 42.5518H67.4764C64.869 42.5518 62.3937 43.5984 60.2374 45.0881C58.0893 43.5984 55.62 42.5518 53.0187 42.5518H41.6094C37.3355 42.5518 33.527 45.6449 30.9968 48.6771C28.3954 51.7967 26.2859 55.8714 25.9546 59.3588C25.8922 60.1559 26.1453 60.9457 26.6596 61.5579C27.1739 62.1701 27.9082 62.5557 28.7041 62.6317C29.5001 62.7077 30.294 62.4679 30.9148 61.964C31.5356 61.4602 31.9336 60.7326 32.0231 59.938C32.1978 58.1049 33.531 55.156 35.6812 52.5811H35.6792Z" fill="#82C5BB"/><path d="M22.4365 67.9554C22.4365 66.6079 22.9718 65.3156 23.9246 64.3628C24.8775 63.41 26.1698 62.8747 27.5173 62.8747C28.8648 62.8747 30.1571 63.41 31.1099 64.3628C32.0627 65.3156 32.598 66.6079 32.598 67.9554V89.2945C32.598 89.8335 32.3839 90.3504 32.0027 90.7316C31.6216 91.1127 31.1047 91.3268 30.5657 91.3268C30.0267 91.3268 29.5098 91.1127 29.1287 90.7316C28.7475 90.3504 28.5334 89.8335 28.5334 89.2945V67.9554C28.5334 67.6859 28.4263 67.4275 28.2358 67.2369C28.0452 67.0463 27.7868 66.9393 27.5173 66.9393C27.2478 66.9393 26.9893 67.0463 26.7987 67.2369C26.6082 67.4275 26.5011 67.6859 26.5011 67.9554V70.0141C26.5011 70.5531 26.287 71.0701 25.9059 71.4512C25.5247 71.8323 25.0078 72.0464 24.4688 72.0464C23.9298 72.0464 23.4129 71.8323 23.0318 71.4512C22.6506 71.0701 22.4365 70.5531 22.4365 70.0141V67.9554ZM72.2277 40.5195C74.3837 40.5195 76.4514 39.663 77.9759 38.1385C79.5004 36.614 80.3569 34.5463 80.3569 32.3903C80.3569 30.2343 79.5004 28.1666 77.9759 26.6421C76.4514 25.1176 74.3837 24.2611 72.2277 24.2611C70.0717 24.2611 68.0041 25.1176 66.4795 26.6421C64.955 28.1666 64.0986 30.2343 64.0986 32.3903C64.0986 34.5463 64.955 36.614 66.4795 38.1385C68.0041 39.663 70.0717 40.5195 72.2277 40.5195ZM90.5184 62.8747C89.1709 62.8747 87.8786 63.41 86.9258 64.3628C85.9729 65.3156 85.4376 66.6079 85.4376 67.9554V70.0141C85.4376 70.5531 85.6518 71.0701 86.0329 71.4512C86.414 71.8323 86.9309 72.0464 87.4699 72.0464C88.0089 72.0464 88.5259 71.8323 88.907 71.4512C89.2881 71.0701 89.5022 70.5531 89.5022 70.0141V67.9554C89.5022 67.6859 89.6093 67.4275 89.7999 67.2369C89.9904 67.0463 90.2489 66.9393 90.5184 66.9393C90.7879 66.9393 91.0463 67.0463 91.2369 67.2369C91.4275 67.4275 91.5345 67.6859 91.5345 67.9554V89.2945C91.5345 89.8335 91.7486 90.3504 92.1298 90.7316C92.5109 91.1127 93.0278 91.3268 93.5668 91.3268C94.1058 91.3268 94.6227 91.1127 95.0039 90.7316C95.385 90.3504 95.5991 89.8335 95.5991 89.2945V67.9554C95.5991 66.6079 95.0638 65.3156 94.111 64.3628C93.1582 63.41 91.8659 62.8747 90.5184 62.8747ZM62.0663 90.083V85.5388C64.4858 85.8516 66.9195 86.0429 69.3581 86.1119L68.0575 90.8838C67.8645 91.5976 67.4186 92.2169 66.8029 92.6264C66.1873 93.0359 65.4438 93.2076 64.7109 93.1097C63.978 93.0117 63.3057 92.6507 62.8191 92.0939C62.3326 91.5371 62.065 90.8225 62.0663 90.083ZM76.4 90.8838L75.0709 86.0124C77.5205 85.8578 79.9623 85.5967 82.3892 85.2299V90.083C82.3886 90.8212 82.1202 91.534 81.6339 92.0892C81.1476 92.6444 80.4763 93.0043 79.7447 93.1021C79.0131 93.2 78.2709 93.029 77.6558 92.621C77.0407 92.2131 76.5945 91.5958 76.4 90.8838Z" fill="#82C5BB"/></g></g><defs><clipPath id="clip0_267_23674"><rect width="114.134" height="97.5501" fill="white"/></clipPath><clipPath id="clip1_267_23674"><rect width="97.5501" height="97.5501" fill="white" transform="translate(22.4365 9.755)"/></clipPath></defs></svg>';
  final String pillIcon =
      '<svg width="49" height="49" viewBox="0 0 49 49" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M27.6473 4.03316C29.9667 1.71374 33.1125 0.410706 36.3927 0.410706C39.6728 0.410706 42.8186 1.71374 45.138 4.03316C47.4574 6.35257 48.7605 9.49838 48.7605 12.7785C48.7605 16.0587 47.4574 19.2045 45.138 21.5239L21.2919 45.37C18.9725 47.6894 15.8267 48.9925 12.5465 48.9925C9.26638 48.9925 6.12058 47.6894 3.80116 45.37C1.48175 43.0506 0.178711 39.9048 0.178711 36.6247C0.178711 33.3445 1.48175 30.1987 3.80116 27.8793L27.6473 4.03316ZM42.5505 6.62067C40.9173 4.98758 38.7023 4.07012 36.3927 4.07012C34.083 4.07012 31.868 4.98758 30.2348 6.62067L19.6043 17.2512L31.92 29.5669L42.5529 18.9364C44.186 17.3032 45.1035 15.0881 45.1035 12.7785C45.1035 10.4689 44.186 8.25387 42.5529 6.62067H42.5505ZM21.5626 40.0096C21.8857 39.6629 22.0616 39.2043 22.0532 38.7305C22.0449 38.2566 21.8529 37.8045 21.5178 37.4694C21.1827 37.1343 20.7306 36.9423 20.2567 36.9339C19.7829 36.9256 19.3243 37.1015 18.9775 37.4246L15.4633 40.9364C14.7865 41.6138 13.8711 41.9989 12.9135 42.009C11.956 42.019 11.0327 41.6532 10.3419 40.99L10.3004 40.951C10.1272 40.7846 9.92284 40.654 9.6991 40.5666C9.47536 40.4792 9.23659 40.4367 8.99643 40.4416C8.75627 40.4464 8.51942 40.4986 8.29941 40.595C8.07939 40.6914 7.88052 40.8302 7.71414 41.0034C7.54776 41.1767 7.41714 41.381 7.32974 41.6048C7.24233 41.8285 7.19985 42.0673 7.20472 42.3074C7.20959 42.5476 7.26171 42.7845 7.35811 43.0045C7.45452 43.2245 7.59331 43.4234 7.76657 43.5897L7.80803 43.6287C9.18933 44.9554 11.0357 45.6875 12.9508 45.6679C14.8659 45.6483 16.6969 44.8785 18.0508 43.5239L21.5626 40.0121V40.0096Z" fill="#82C5BB"/> </svg>';
  final String viewIcon =
      '<svg width="40" height="50" viewBox="0 0 40 50" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M39.0889 15.3497L24.4564 0.717224H4.94635C3.65276 0.717224 2.41215 1.2311 1.49744 2.14581C0.582726 3.06052 0.0688477 4.30113 0.0688477 5.59473V44.6148C0.0688477 45.9084 0.582726 47.149 1.49744 48.0637C2.41215 48.9784 3.65276 49.4923 4.94635 49.4923H34.2114C35.505 49.4923 36.7456 48.9784 37.6603 48.0637C38.575 47.149 39.0889 45.9084 39.0889 44.6148V15.3497ZM12.2626 42.176H7.38511V20.2272H12.2626V42.176ZM22.0176 42.176H17.1401V27.5435H22.0176V42.176ZM31.7726 42.176H26.8951V34.8598H31.7726V42.176ZM24.4564 17.7885H22.0176V5.59473L34.2114 17.7885H24.4564Z" fill="#82C5BB"/> </svg>';
  final String agendaIcon =
      '<svg width="59" height="60" viewBox="0 0 59 60" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M22.1467 2.57076C22.1467 2.08567 22.3394 1.62044 22.6824 1.27742C23.0255 0.934404 23.4907 0.741699 23.9758 0.741699L34.9502 0.741699C35.4353 0.741699 35.9005 0.934404 36.2435 1.27742C36.5865 1.62044 36.7792 2.08567 36.7792 2.57076C36.7792 3.05586 36.5865 3.52109 36.2435 3.86411C35.9005 4.20712 35.4353 4.39983 34.9502 4.39983H33.1211V8.31403C38.1028 9.03313 42.7621 11.2042 46.517 14.556C50.2719 17.9078 52.9559 22.2918 54.2337 27.1602C55.5115 32.0286 55.3264 37.1656 53.7016 41.9294C52.0767 46.6932 49.0842 50.8726 45.0978 53.9455L47.2964 56.1477C47.6398 56.4907 47.8329 56.956 47.8333 57.4414C47.8336 57.9268 47.6411 58.3924 47.2982 58.7359C46.9552 59.0793 46.4899 59.2724 46.0045 59.2728C45.5191 59.2731 45.0535 59.0806 44.7101 58.7377L41.9811 56.0087C38.1583 58.1545 33.8468 59.2783 29.463 59.2718C25.0791 59.2783 20.7677 58.1545 16.9449 56.0087L14.2159 58.7377C14.0458 58.9075 13.844 59.0422 13.6219 59.134C13.3998 59.2258 13.1618 59.273 12.9215 59.2728C12.6811 59.2726 12.4432 59.2251 12.2212 59.133C11.9992 59.0409 11.7976 58.9059 11.6278 58.7359C11.4579 58.5658 11.3233 58.3639 11.2315 58.1418C11.1397 57.9197 11.0925 57.6817 11.0927 57.4414C11.093 56.956 11.2861 56.4907 11.6296 56.1477L13.8318 53.9455C9.84548 50.8729 6.8529 46.6937 5.22789 41.9302C3.60288 37.1667 3.41748 32.0299 4.69485 27.1616C5.97222 22.2933 8.65573 17.9093 12.4102 14.5573C16.1646 11.2052 20.8235 9.0337 25.8048 8.31403V4.39983H23.9758C23.4907 4.39983 23.0255 4.20712 22.6824 3.86411C22.3394 3.52109 22.1467 3.05586 22.1467 2.57076ZM31.292 20.8614C31.292 20.3763 31.0993 19.9111 30.7563 19.5681C30.4133 19.225 29.9481 19.0323 29.463 19.0323C28.9779 19.0323 28.5126 19.225 28.1696 19.5681C27.8266 19.9111 27.6339 20.3763 27.6339 20.8614V33.16L22.4064 41.8664C22.1566 42.2826 22.0824 42.781 22.2 43.252C22.3177 43.7229 22.6176 44.1279 23.0338 44.3777C23.45 44.6275 23.9484 44.7018 24.4194 44.5841C24.8904 44.4665 25.2953 44.1665 25.5451 43.7503L31.0323 34.605C31.2024 34.3209 31.2922 33.996 31.292 33.6649V20.8614ZM3.34393 20.448C2.39743 19.6247 1.63043 18.6155 1.09063 17.4831C0.550835 16.3507 0.249785 15.1193 0.206204 13.8656C0.162623 12.6119 0.377443 11.3626 0.837305 10.1954C1.29717 9.02829 1.99224 7.96822 2.87929 7.08117C3.76634 6.19412 4.8264 5.49905 5.99356 5.03919C7.16071 4.57933 8.40999 4.36451 9.66372 4.40809C10.9174 4.45167 12.1488 4.75272 13.2812 5.29252C14.4136 5.83231 15.4228 6.59931 16.2462 7.54582C10.6856 10.369 6.16708 14.8875 3.34393 20.448ZM42.6798 7.54582C43.5031 6.59931 44.5124 5.83231 45.6448 5.29252C46.7772 4.75272 48.0085 4.45167 49.2622 4.40809C50.516 4.36451 51.7652 4.57933 52.9324 5.03919C54.0995 5.49905 55.1596 6.19412 56.0467 7.08117C56.9337 7.96822 57.6288 9.02829 58.0886 10.1954C58.5485 11.3626 58.7633 12.6119 58.7197 13.8656C58.6762 15.1193 58.3751 16.3507 57.8353 17.4831C57.2955 18.6155 56.5285 19.6247 55.582 20.448C52.7589 14.8875 48.2403 10.369 42.6798 7.54582Z" fill="#82C5BB"/> </svg>';
  final String colaboradorIcon =
      '<svg width="115" height="98" viewBox="0 0 115 98" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M76.7083 18.375H38.6667C32.9466 18.375 28.2917 23.0299 28.2917 28.75V32.2083H24.8333C23.9161 32.2083 23.0365 32.5727 22.3879 33.2213C21.7394 33.8698 21.375 34.7495 21.375 35.6667C21.375 36.5839 21.7394 37.4635 22.3879 38.1121C23.0365 38.7606 23.9161 39.125 24.8333 39.125H28.2917V46.0417H24.8333C23.9161 46.0417 23.0365 46.406 22.3879 47.0546C21.7394 47.7032 21.375 48.5828 21.375 49.5C21.375 50.4172 21.7394 51.2968 22.3879 51.9454C23.0365 52.594 23.9161 52.9583 24.8333 52.9583H28.2917V59.875H24.8333C23.9161 59.875 23.0365 60.2394 22.3879 60.8879C21.7394 61.5365 21.375 62.4161 21.375 63.3333C21.375 64.2505 21.7394 65.1302 22.3879 65.7787C23.0365 66.4273 23.9161 66.7917 24.8333 66.7917H28.2917V70.25C28.2917 75.9701 32.9466 80.625 38.6667 80.625H76.7083C82.4284 80.625 87.0833 75.9701 87.0833 70.25V28.75C87.0833 23.0299 82.4284 18.375 76.7083 18.375ZM35.2083 28.75C35.2083 26.8445 36.7611 25.2917 38.6667 25.2917V32.2083H35.2083V28.75ZM35.2083 39.125H38.6667V46.0417H35.2083V39.125ZM35.2083 52.9583H38.6667V59.875H35.2083V52.9583ZM35.2083 70.25V66.7917H38.6667V73.7083C36.7611 73.7083 35.2083 72.1555 35.2083 70.25ZM80.1667 70.25C80.1667 72.1555 78.6139 73.7083 76.7083 73.7083H42.125V25.2917H76.7083C78.6139 25.2917 80.1667 26.8445 80.1667 28.75V70.25Z" fill="#82C5BB"/> <path d="M59.4167 51.2291C63.2366 51.2291 66.3333 48.1324 66.3333 44.3125C66.3333 40.4925 63.2366 37.3958 59.4167 37.3958C55.5967 37.3958 52.5 40.4925 52.5 44.3125C52.5 48.1324 55.5967 51.2291 59.4167 51.2291Z" fill="#82C5BB"/> <path d="M59.4168 54.1895C54.0149 54.1895 50.771 56.6622 50.771 59.1314C50.771 60.366 54.0149 61.6041 59.4168 61.6041C64.4867 61.6041 68.0627 60.3695 68.0627 59.1314C68.0627 56.6622 64.6735 54.1895 59.4168 54.1895Z" fill="#82C5BB"/> </svg>';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      endDrawer: const DrawerCustom(),
      body: ListView(
        children: <Widget>[
          Transform.scale(
            scale: 1.05,
            child: const LogoDeles(),
          ),
          const SizedBox(height: 45),
          SizedBox(
            height: 250,
            child: ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 26, right: 15),
                  child: CustomNotification(
                      errorSurface,
                      errorDefault,
                      "Remédio Atrasado",
                      "Advil às 15h30 ainda não foi tomado"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 26, right: 15),
                  child: CustomNotification(
                      infoSurface,
                      infoDefault,
                      "Próximo Alarme em Breve",
                      "Tome seu Zetia 100mg em 30 minutos"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 26, right: 15),
                  child: CustomNotification(
                      infoSurface,
                      infoDefault,
                      "Próximo Alarme em Breve",
                      "Tome seu Atorvastatina 10mg em 15 minutos"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 26, right: 15),
                  child: CustomNotification(
                      succesfulSurface,
                      succesfulDefault,
                      "Próximo Alarme em Breve",
                      "Tome seu Atorvastatina 10mg em 15 minutos"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 55),
          Transform.scale(
            scale: 1.75,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Iconify(
                        cuidadoIcon,
                        size: 75,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const MeusCuidados())));
                      },
                    ),
                    IconButton(
                      icon: Iconify(
                        userIcon,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const PerfilCuidador())));
                      },
                    ),
                    IconButton(
                      icon: Iconify(
                        pillIcon,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const ListagemRemedios())));
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Iconify(
                        viewIcon,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Relatorios())));
                      },
                    ),
                    IconButton(
                      icon: Iconify(
                        agendaIcon,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Agendas())));
                      },
                    ),
                    IconButton(
                      icon: Iconify(
                        colaboradorIcon,
                        size: 75,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Colaboradores())));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const CadastroAdmin())));
              },
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: MyTheme.defaultTheme.backgroundColor,
                  padding: const EdgeInsets.all(20) // <-- Splash color
                  ),
              child: FaIcon(
                FontAwesomeIcons.gear,
                color: MyTheme.defaultTheme.primaryColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  obtemLogado() async {
    Cuidador user = await Sessao.obterUser();
    //print(user.id);
    userLogado = user.name ?? "Nome";

    //SessionManager().get("user").then((valor) => );
  }

  setLogado(valor) {
    debugPrint("Valor:");
    debugPrint(valor);
    userLogado = Cuidador.obtemIdSession(valor);
    debugPrint("Id user:");
    debugPrint(userLogado);
  }
}
