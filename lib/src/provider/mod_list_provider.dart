import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modmopet/src/entity/game.dart';
import 'package:modmopet/src/entity/git_source.dart';
import 'package:modmopet/src/entity/mod.dart';
import 'package:modmopet/src/repository/mods.dart';

final gameProvider = StateProvider<Game?>((ref) => null);
final sourceProvider = StateProvider<GitSource?>((ref) => null);

final modsProvider = FutureProvider<List<Mod>>((ref) async {
  final game = ref.watch(gameProvider);
  final source = ref.watch(sourceProvider);
  if (game != null && source != null) {
    return await ModsRepository().getAvailableMods(game, source);
  }

  return [];
});