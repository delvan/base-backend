import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../core/web/controller.dart';
import '../../domain/models/categoria.dart';
import '../../domain/ports/inputs/categoria_service.dart';
import '../dtos/categoria_dto.dart';

class CategoriaController extends Controller {
  final CategoriaService _categoriaService;

  CategoriaController(this._categoriaService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();

    router.get('/categorias', (Request req) async {
      List<Categoria> categorias = await _categoriaService.getAllCategorias();

      List<Map> categoriasMap = categorias
          .map((Categoria categoria) => CategoriaDto.toMap(categoria))
          .toList();

      return Response.ok(jsonEncode(categoriasMap),
          headers: {'content-type': 'application/json'});
    });

    router.post('/categoria', (Request req) async {
      var body = await req.readAsString();

      if (body.isEmpty) return Response(400);

      CategoriaDto dto = CategoriaDto.fromRequest(jsonDecode(body));
      var result = await _categoriaService.save(dto);

      return Response(result ? 201 : 500);
    });

    return createHandler(
      router: router.call,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
