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
    var result =
        await Navigator.pushNamed(context, '/signature', arguments: candidate);
    if (result != null) {
      setState(() {
        candidate.signatureImage = result;
        candidate.changePresence = true;
      });
    }
  }

  /// Navega para a página de entrevista e aguarda
  /// o resultado da entrevista, se true, a entrevista
  /// foi finalizada e a tela é atualizada.
  void _doInterview(context, Candidate candidate) async {
    var result = await Navigator.pushNamed(
      context,
      '/interview',
      arguments: candidate,
    );
    if (result == true) {
      setState(() {});
    }
  }

  Future<void> _showSignature(context, Candidate candidate) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Assinatura de ${candidate.name}',
              style: AppTextStyles.heading17),
          content: Container(
            child: Image.memory(candidate.signature),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Constrói uma visualização da lista de candidatos
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
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemCount: candidates.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              height: 75,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  candidates[index].name,
                  style: AppTextStyles.listItens,
                ),
                leading: candidates[index].avatar,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.border_color,
                      size: 20,
                      color: candidates[index].presence
                          ? Colors.green
                          : Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.assignment,
                      size: 20,
                      color: candidates[index].interviewed
                          ? candidates[index].result
                          : Colors.grey,
                    ),
                  ],
                ),
                onTap: () {
                  if (candidates[index].presence) {
                    _doInterview(context, candidates[index]);
                  } else {
                    _buildSignature(context, candidates[index]);
                  }
                },
                onLongPress: () {
                  if (candidates[index].presence) {
                    _showSignature(context, candidates[index]);
                  } else {
                    _buildSignature(context, candidates[index]);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
