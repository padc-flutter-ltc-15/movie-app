

import 'package:hive/hive.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/persistence/hive_constants.dart';

class ActorDao {

  static final ActorDao _singleton = ActorDao._internal();

  factory ActorDao() {
    return _singleton;
  }

  ActorDao._internal() {

  }

  Stream<void> getAllActorsEventStream() {
    return getActorBox().watch();
  }

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