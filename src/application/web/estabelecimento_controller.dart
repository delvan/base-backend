import '../../domain/port/input/estabelecimento_service.dart';

class EstabelecimentoController {
  final EstabelecimentoService _estabelecimentoService;

  EstabelecimentoController(this._estabelecimentoService);

  void getAll() {
    _estabelecimentoService.getLisEstabelecimentos().forEach(print);
  }
}
