import 'package:chasqui_ya/data/models/usuario_model.dart';

class UsuarioState {
  final List<UsuarioApiModel> usuarios;
  final UsuarioApiModel? usuarioSeleccionado;

  UsuarioState({this.usuarios = const [], this.usuarioSeleccionado});

  UsuarioState copyWith({
    List<UsuarioApiModel>? usuarios,
    UsuarioApiModel? usuarioSeleccionado,
  }) {
    return UsuarioState(
      usuarios: usuarios ?? this.usuarios,
      usuarioSeleccionado: usuarioSeleccionado ?? this.usuarioSeleccionado,
    );
  }
}
