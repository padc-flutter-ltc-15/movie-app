

import 'package:hive/hive.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/persistence/dao/actor_dao.dart';
import 'package:themovieapp/persistence/hive_constants.dart';

class ActorDaoImpl implements ActorDao {

  static final ActorDaoImpl _singleton = ActorDaoImpl._internal();

  factory ActorDaoImpl() {
    return _singleton;
  }

  ActorDaoImpl._internal() {

  }

  /// Reactive Programming

  Stream<void> getAllActorsEventStream() {
    return getActorBox().watch();
  }

  Stream<List<ActorVO>> getActorsStream() {
    return Stream.value(
        getAllActors()
            .toList()
    );
  }

  /// Reactive Programming

  void saveAllActors(List<ActorVO> list) async {
    Map<int, ActorVO> map = Map.fromIterable(list,
        key: (actor) => actor.id,
        value: (actor) => actor
    );

    await getActorBox().putAll(map);
  }

  List<ActorVO> getAllActors() {
    return getActorBox().values.toList();
  }

  Box<ActorVO> getActorBox() {
    return Hive.box<ActorVO>(BOX_NAME_ACTOR_VO);
  }
}