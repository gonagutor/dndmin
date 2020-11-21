import "package:http/http.dart" as http;

class PlayerCreator {
  static String clase;
  static String race;
  static String nombre;
  static String subNombre;
  static int fuerza;
  static int destreza;
  static int constitucion;
  static int inteligencia;
  static int sabiduria;
  static int carisma;
  static int iniciativa;
  static int vida;
  static int ca;
  static int velocidad;
  static String proficiencias;
  static List<bool> proficienciasSalv;
  static List<bool> proficienciasHab;
  static String apariencia;
  static String personalidad;
  static String ideales;
  static String vinculos;
  static String defectos;
  static String historia;

  static Future<bool> createCharacter(String uToken) async {
    var url = "https://api.dndmin.me/characters/create-new-character/";
    var request = "?token=" +
        uToken +
        "&clase=" +
        clase +
        "&raza=" +
        race +
        "&nombre=" +
        nombre +
        "&subNombre=" +
        subNombre +
        "&fuerza=" +
        fuerza.toString() +
        "&destreza=" +
        destreza.toString() +
        "&constitucion=" +
        constitucion.toString() +
        "&inteligencia=" +
        inteligencia.toString() +
        "&sabiduria=" +
        sabiduria.toString() +
        "&carisma=" +
        carisma.toString() +
        "&velocidad=" +
        velocidad.toString() +
        "&iniciativa=" +
        iniciativa.toString() +
        "&CA=" +
        ca.toString() +
        "&PV=" +
        vida.toString() +
        "&oProficiencias=" +
        proficiencias.toString() +
        "&salvModFuerza=" +
        proficienciasSalv[0].toString() +
        "&salvModDestreza=" +
        proficienciasSalv[1].toString() +
        "&salvModConstitucion=" +
        proficienciasSalv[2].toString() +
        "&salvModInteligencia=" +
        proficienciasSalv[3].toString() +
        "&salvModSabiduria=" +
        proficienciasSalv[4].toString() +
        "&salvModCarisma=" +
        proficienciasSalv[5].toString() +
        "&profAcrobacias=" +
        proficienciasHab[0].toString() +
        "&profConArcano=" +
        proficienciasHab[1].toString() +
        "&profAtletismo=" +
        proficienciasHab[2].toString() +
        "&profEngano=" +
        proficienciasHab[3].toString() +
        "&profHistoria=" +
        proficienciasHab[4].toString() +
        "&profInterpretacion=" +
        proficienciasHab[5].toString() +
        "&profIntimidacion=" +
        proficienciasHab[6].toString() +
        "&profInvestigacion=" +
        proficienciasHab[7].toString() +
        "&profJuegoDeManos=" +
        proficienciasHab[8].toString() +
        "&profMedicina=" +
        proficienciasHab[9].toString() +
        "&profNaturaleza=" +
        proficienciasHab[10].toString() +
        "&profPercepcion=" +
        proficienciasHab[11].toString() +
        "&profPerspicacia=" +
        proficienciasHab[12].toString() +
        "&profPersuasion=" +
        proficienciasHab[13].toString() +
        "&profReligion=" +
        proficienciasHab[14].toString() +
        "&profSigilo=" +
        proficienciasHab[15].toString() +
        "&profSupervivencia=" +
        proficienciasHab[16].toString() +
        "&profTratoConAnimales=" +
        proficienciasHab[17].toString() +
        "&apariencia=" +
        apariencia +
        "&personalidad=" +
        personalidad +
        "&ideales=" +
        ideales +
        "&vinculos=" +
        vinculos +
        "&defectos=" +
        defectos +
        "&historia=" +
        historia;
    var completeUrl = url + request;
    var response = await http.get(completeUrl);
    if (response.statusCode == 200) {
      if (response.body == "Successful.")
        return true;
      else
        return false;
    }
    return false;
  }
}
