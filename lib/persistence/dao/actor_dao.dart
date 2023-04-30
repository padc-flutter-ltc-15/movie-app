
import '../../data/vos/actor_vo.dart';

abstract class ActorDao {
  Stream<void> getAllActorsEventStream();
  Stream<List<ActorVO>> getActorsStream();
  void saveAllActors(List<ActorVO> actorList);
  List<ActorVO> getAllActors();
}