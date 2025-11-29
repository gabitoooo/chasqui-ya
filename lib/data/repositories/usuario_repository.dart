import 'package:chasqui_ya/data/http_service.dart';
import 'package:chasqui_ya/data/models/api_response_model.dart';
import 'package:chasqui_ya/data/models/usuario_model.dart';
import 'package:flutter/widgets.dart';

class UsuarioRepository {
  final HttpService _httpService = HttpService();

  Future<List<UsuarioApiModel>> getAll() async {
    try {
      final response = await _httpService.get('/api/usuarios');

      if (_httpService.isSuccessful(response)) {
        final jsonData = _httpService.parseResponse(response);
        final apiResponse = ApiResponse.fromJson(
          jsonData,
          (data) =>
              (data as List)
                  .map(
                    (json) =>
                        UsuarioApiModel.fromJson(json as Map<String, dynamic>),
                  )
                  .toList(),
        );

        return apiResponse.data ?? [];
      }
      return [];
    } catch (e) {
      print('Error getting usuarios: $e');
      return [];
    }
  }

  Future<UsuarioApiModel?> getById(String id) async {
    try {
      final response = await _httpService.get('/api/usuarios/$id');

      if (_httpService.isSuccessful(response)) {
        final jsonData = _httpService.parseResponse(response);
        final apiResponse = ApiResponse.fromJson(
          jsonData,
          (data) => UsuarioApiModel.fromJson(data as Map<String, dynamic>),
        );

        return apiResponse.data;
      }

      return null;
    } catch (e) {
      print('Error getting usuario: $e');
      return null;
    }
  }

  Future<UsuarioApiModel?> create(Map<String, dynamic> usuarioData) async {
    try {
      print(usuarioData);
      final response = await _httpService.post(
        '/api/usuarios',
        body: usuarioData,
      );
      print(response.body);
      if (_httpService.isSuccessful(response)) {
        final jsonData = _httpService.parseResponse(response);
        final apiResponse = ApiResponse.fromJson(
          jsonData,
          (data) => UsuarioApiModel.fromJson(data as Map<String, dynamic>),
        );

        return apiResponse.data;
      }

      return null;
    } catch (e) {
      print('Error creating usuario: $e');
      return null;
    }
  }

  Future<UsuarioApiModel?> update(
    String id,
    Map<String, dynamic> usuarioData,
  ) async {
    try {
      debugPrint('${usuarioData}');
      final response = await _httpService.put(
        '/api/usuarios/$id',
        body: usuarioData,
      );
      debugPrint(response.body);

      if (_httpService.isSuccessful(response)) {
        final jsonData = _httpService.parseResponse(response);
        final apiResponse = ApiResponse.fromJson(
          jsonData,
          (data) => UsuarioApiModel.fromJson(data as Map<String, dynamic>),
        );

        return apiResponse.data;
      }

      return null;
    } catch (e) {
      print('Error updating usuario: $e');
      return null;
    }
  }

  Future<bool> delete(String id) async {
    try {
      final response = await _httpService.delete('/api/usuarios/$id');
      return _httpService.isSuccessful(response);
    } catch (e) {
      print('Error deleting usuario: $e');
      return false;
    }
  }
}
