import 'package:expense_tracker_fiap/models/tipo_transacao.dart';
import 'package:expense_tracker_fiap/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage();

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final categorias = CategoriaRepository().obterCategoria();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categoria'),
      ),
      body: ListView.builder(
          itemCount: categorias.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(
                  categorias[index].icone,
                  color: categorias[index].cor,
                ),
                title: Text(categorias[index].nome),
                trailing: Text(
                  'valor',
                  style: TextStyle(
                    color:
                        categorias[index].tipoTransacao == TipoTransacao.receita
                            ? Colors.green
                            : Colors.red,
                  ),
                ));
          }),
    );
  }
}
