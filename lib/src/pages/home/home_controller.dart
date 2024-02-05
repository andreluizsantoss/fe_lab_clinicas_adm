import 'package:asyncstate/asyncstate.dart' as asyncstate;
import 'package:fe_lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

class HomeController with MessageStateMixin {
  final AttendantDeskAssignmentRepository _repository;

  HomeController({
    required AttendantDeskAssignmentRepository repository,
  }) : _repository = repository;

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();
    final result = await _repository.startService(deskNumber);
    switch (result) {
      case Left():
        asyncstate.AsyncState.hide();
        showError('Erro ao iniciar guichê');
      case Right():
        asyncstate.AsyncState.hide();
        // fazer chamada próximo paciente
        showInfo('Regisrou com sucesso');
    }
  }
}
