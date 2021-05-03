import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rhrecruit/core/core.dart';
import 'package:rhrecruit/data/candidate-data.dart';
//import 'package:rh_recruitment/pages/signature-page.dart';
//import 'package:signature/signature.dart';

class CandidatesPage extends StatefulWidget {
  @override
  _CandidatesPageState createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<CandidatesPage> {
  /// Gera uma lista de instâncias da classe [Candidate]
  final candidates = List<Candidate>.generate(
    20,
    (index) {
      int randomAge = Random().nextInt(47) + 18;
      return Candidate(
        name: 'Canditado ${index + 1}',
        age: randomAge,
        qualification: 'Engenheiro',
        id: index + 1,
        presence: false,
        interviewed: false,
      );
    },
  );

  /// Navega para página de assinatura e aguarda o retorno da página
  /// para verificar se o candidato não deixou a tela em branco
  Future<void> _buildSignature(context, Candidate candidate) async {
    var result = await Navigator.pushNamed(context, '/signature');
    if (result != null) {
      setState(() {
        candidate.changePresence = true;
      });
    }
  }

  /// Navega para a página de entrevista
  void _doInterview(context) {
    Navigator.pushNamed(context, '/interview');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Candidatos',
            style: AppTextStyles.title,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ]),
      body: SafeArea(
        /// Constrói uma visualização da lista de candidatos
        child: ListView.builder(
          itemCount: candidates.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              height: 75,
              child: ListTile(
                  title: Text(
                    candidates[index].name,
                    style: AppTextStyles.listItens,
                  ),
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.border_color,
                        color: candidates[index].presence
                            ? Colors.green
                            : Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.assignment),
                    ],
                  ),
                  onTap: () {
                    if (candidates[index].presence) {
                      _doInterview(context);
                    } else {
                      _buildSignature(context, candidates[index]);
                    }
                  }),
            );
          },
        ),
      ),
    );
  }
}
