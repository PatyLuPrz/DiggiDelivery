import 'package:bloc/bloc.dart';
import 'mapa_registro_events.dart';
import 'mapa_registro_state.dart';

class MapaRegistroBloc extends Bloc<MapaRegistroEvents, MapaRegistroState> {
  MapaRegistroBloc(MapaRegistroState initialState) : super(initialState);

  @override
  Stream<MapaRegistroState> mapEventToState(MapaRegistroEvents event) async* {
    if (event is OnMyLocationUpdate) {
      yield this.state.copyWith(
            loading: false,
            myLocation: event.location,
          );
    }
  }
}
