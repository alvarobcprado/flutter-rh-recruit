import 'package:flutter/material.dart';
import 'package:rhrecruit/core/core.dart';

Widget buildCandidateInfo() {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: CircleAvatar(
      child: Icon(Icons.person),
    ),
    title: Text(
      "Candidato XX",
      style: AppTextStyles.heading15,
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          color: Colors.green,
          size: 40,
        ),
        SizedBox(width: 20),
        Text(
          '0 Pontos',
          style: AppTextStyles.heading15,
        ),
      ],
    ),
  );
}

Widget buildCandidatePresentation() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Descrição',
        style: AppTextStyles.heading17,
      ),
      SizedBox(height: 10),
      Text(
        'XX Anos  • Formado em X',
        style: AppTextStyles.bodyLightGrey,
      ),
      SizedBox(height: 10),
      Text(
        "'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        style: AppTextStyles.body,
      ),
    ],
  );
}

Widget buildFaultText() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      'Faltas',
      style: AppTextStyles.heading22,
    ),
  );
}

Widget buildChip(BuildContext context, int point, String label) {
  return ActionChip(
    onPressed: () {},
    avatar: CircleAvatar(
      child: Text(
        '-$point',
        style: AppTextStyles.faultsNumber,
      ),
      backgroundColor: Colors.white,
    ),
    label: Text(
      label,
      style: AppTextStyles.faults,
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 30),
    padding: EdgeInsets.all(0.2),
    backgroundColor: Theme.of(context).primaryColor,
  );
}

Widget buildFaultsBtn(BuildContext context) {
  return Wrap(
    spacing: 10,
    alignment: WrapAlignment.center,
    children: [
      buildChip(context, 1, 'Leve'),
      buildChip(context, 2, 'Média'),
      buildChip(context, 3, 'Grave'),
      buildChip(context, 4, 'Eliminatória'),
    ],
  );
}

Widget buildFinishBtn(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 45,
    // decoration: BoxDecoration(
    //   color: Theme.of(context).primaryColor,
    //   borderRadius: BorderRadius.circular(30),
    // ),
    child: TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(AppColors.primaryLight),
        backgroundColor: MaterialStateProperty.all(
          AppColors.primary,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'Finalizar entrevista',
        style: AppTextStyles.buttom,
      ),
    ),
  );
}
