import 'package:flutter/material.dart';
import 'package:rhrecruit/core/app-text-styles.dart';
import 'package:rhrecruit/data/candidate-data.dart';
import 'package:rhrecruit/pages/interview/widgets/interview-widgets.dart';

class InterviewPage extends StatefulWidget {
  @override
  _InterviewPageState createState() => _InterviewPageState();
}

///Captura os dados do candidato escolhido e
///constrói a tela de entrevista
class _InterviewPageState extends State<InterviewPage> {
  @override
  Widget build(BuildContext context) {
    Candidate candidate =
        ModalRoute.of(context).settings.arguments as Candidate;

    ///Adiciona os pontos da falta cometida e atualiza a tela
    void changePointColor(int point) {
      setState(() {
        candidate.addPoint(point);
      });
    }

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
            buildCandidateInfo(candidate),
            SizedBox(height: 20),
            buildCandidatePresentation(candidate),
            SizedBox(height: 20),
            buildFaultText(),
            SizedBox(height: 20),
            buildFaultsBtn(context, changePointColor),
            SizedBox(height: 20),
            buildFinishBtn(context, candidate)
          ],
        ),
      ),
    );
  }
}
