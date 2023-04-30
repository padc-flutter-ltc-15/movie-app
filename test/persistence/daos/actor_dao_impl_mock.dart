
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/persistence/dao/actor_dao.dart';

class ActorDaoImplMock extends ActorDao {
  Map<int?, ActorVO> actorListFromDatabaseMock = {};

  @override
  List<ActorVO> getAllActors() {
    return actorListFromDatabaseMock.values.toList();
  }

  @override
  void saveAllActors(List<ActorVO> actorList) {
    actorList.forEach((actor) {
      actorListFromDatabaseMock[actor.id] = actor;
    });
  }

  @override
  Stream<List<ActorVO>> getActorsStream() {
    return Stream.value(actorListFromDatabaseMock.values.toList());
  }

  @override
  Stream<void> getAllActorsEventStream() {
    return Stream<void>.value(null);
  }
}
