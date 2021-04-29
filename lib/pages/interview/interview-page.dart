import 'package:flutter/material.dart';
import 'package:rhrecruit/core/app-text-styles.dart';
import 'package:rhrecruit/pages/interview/widgets/interview-widgets.dart';

class InterviewPage extends StatefulWidget {
  @override
  _InterviewPageState createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entrevista",
          style: AppTextStyles.title,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: <Widget>[
            SizedBox(height: 10),
            buildCandidateInfo(),
            SizedBox(height: 20),
            buildCandidatePresentation(),
            SizedBox(height: 20),
            buildFaultText(),
            SizedBox(height: 20),
            buildFaultsBtn(context),
            SizedBox(height: 20),
            buildFinishBtn(context)
          ],
        ),
      ),
    );
  }
}
