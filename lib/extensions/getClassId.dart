import 'package:dndmin/backend/stats.dart';

extension GetClassId on Stats {
  int getClassId() {
    if (this.stats[0].clase == 'Monje') return 1;
    if (this.stats[0].clase == 'Explorador') return 2;
    if (this.stats[0].clase == 'Bardo') return 3;
    if (this.stats[0].clase == 'Guerrero') return 4;
    if (this.stats[0].clase == 'Mago') return 5;
    if (this.stats[0].clase == 'Paladín') return 6;
    if (this.stats[0].clase == 'Druida') return 7;
    if (this.stats[0].clase == 'Pícaro') return 8;
    if (this.stats[0].clase == 'Bárbara') return 9;
    if (this.stats[0].clase == 'Clérigo') return 10;
    if (this.stats[0].clase == 'Hechicero') return 11;
    return 0;
  }
}
