import 'package:flutter/material.dart';
import 'package:rhrecruit/core/core.dart';
import 'package:rhrecruit/data/candidate-data.dart';

List<Color> colorPoint = [
  Colors.green,
  Colors.yellow[200],
  Colors.orange[300],
  Colors.orange[600],
  Colors.red
];

Widget buildCandidateInfo(Candidate candidate) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: candidate.avatar,
    title: Text(
      candidate.name,
      style: AppTextStyles.heading15,
    ),
  );
}

Widget buildCandidatePresentation(Candidate candidate) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Descrição',
        style: AppTextStyles.heading17,
      ),
      SizedBox(height: 10),
      Text(
        '${candidate.age} Anos  • ${candidate.qualification}',
        style: AppTextStyles.bodyLightGrey,
      ),
      SizedBox(height: 10),
      Text(
        '${candidate.presentation}',
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

Widget buildFinishBtn(BuildContext context, Candidate candidate) {
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
        candidate.changeInterviewed = true;
        Navigator.pop(context, true);
      },
      child: Text(
        'Finalizar entrevista',
        style: AppTextStyles.buttom,
      ),
    ),
  );
}
