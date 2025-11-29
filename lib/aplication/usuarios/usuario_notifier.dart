import 'package:chasqui_ya/aplication/usuarios/usuario_state.dart';
import 'package:chasqui_ya/data/repositories/usuario_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsuarioNotifier extends StateNotifier<UsuarioState> {
  final UsuarioRepository _repository;

  UsuarioNotifier(this._repository) : super(UsuarioState());

  Future<void> loadAll() async {
    try {
      final usuarios = await _repository.getAll();

      state = state.copyWith(usuarios: usuarios);
    } catch (e) {
      //mostrar error
    }
  }
}

final usuarioNotifierProvider =
    StateNotifierProvider<UsuarioNotifier, UsuarioState>((ref) {
      return UsuarioNotifier(UsuarioRepository());
    });
