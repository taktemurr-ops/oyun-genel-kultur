import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_genel_kultur/oyun_genel_kultur.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(genelKulturConfig.title.length, 33);
    expect(genelKulturConfig.tagline.length, 33);
    for (final s in genelKulturConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(genelKulturConfig.gameId, genelKulturId);
    expect(genelKulturRules.gameId, genelKulturId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(genelKulturRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: genelKulturId, optionalMechanics: genelKulturRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(genelKulturRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
