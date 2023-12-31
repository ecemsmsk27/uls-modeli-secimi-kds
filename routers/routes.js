const router = require("express").Router();
const {
  ekonomikMaliyetGrafik,
  ekonomikRekabetGrafik,
  ortalamaTasimaMesafesiGrafik,
  ekonoMaximumAracKapasitesi,
  ekonoMinimumAracKapasitesi,
  performansErisilebilirlikGrafik,
  performansEsneklikGrafik,
  performansHizGrafik,
  performansKayipHasarGrafik,
  performansTutarlilikGrafik,
  cevreEnerjiGrafik,
  cevreGurultuGrafik,
  cevreOzonGrafik,
  cevreSeraGrafik,
  cevreSuGrafik,
  cevreisiGrafik,
  sevkiyatSehirSayisi,
  toplamMilKarayolu,
  toplamMilDemiryolu,
  toplamMilDenizyolu,
  toplamMilHavayolu,
  istanbulKarayoluUzaklik,
  istanbulDenizYolu,
  istanbulDemiryolu,
  istanbulUcusMesafesi,
  tekirdagDemiryolu,
  tekirdagDenizyolu,
  tekirdagKarayolu,
  tekirdagUcusMesafesi,
  canakkaleDemirYolu,
  canakkaleDenizyolu,
  canakkaleUcusMesafesi,
  canakkaleKarayolu,
} = require("../controllers/controller");

router.get("/ekonomiMaliyet", ekonomikMaliyetGrafik);
router.get("/ekonomiRekabet", ekonomikRekabetGrafik);
router.get("/ortalamaTasimaMesafesi", ortalamaTasimaMesafesiGrafik);
router.get("/ekonoMinAracKapasite", ekonoMinimumAracKapasitesi);
router.get("/ekonoMaxAracKapasite", ekonoMaximumAracKapasitesi);
router.get("/performansErisilebilirlik", performansErisilebilirlikGrafik);
router.get("/performansEsneklik", performansEsneklikGrafik);
router.get("/performansHiz", performansHizGrafik);
router.get("/performansKayipHasar", performansKayipHasarGrafik);
router.get("/performansTutarlilik", performansTutarlilikGrafik);
router.get("/cevreEnerji", cevreEnerjiGrafik);
router.get("/cevreGurultu", cevreGurultuGrafik);
router.get("/cevreOzon", cevreOzonGrafik);
router.get("/cevreSeraGrafik", cevreSeraGrafik);
router.get("/cevreSu", cevreSuGrafik);
router.get("/cevreisi", cevreisiGrafik);
router.get("/sevkiyatSehirSayi", sevkiyatSehirSayisi);
router.get("/toplamMilKarayolu", toplamMilKarayolu);
router.get("/toplamMilHavayolu", toplamMilHavayolu);
router.get("/toplamMilDemiryolu", toplamMilDemiryolu);
router.get("/toplamMilDenizyolu", toplamMilDenizyolu);
router.get("/istanbulKarayolu", istanbulKarayoluUzaklik);
router.get("/istanbulDenizyolu", istanbulDenizYolu);
router.get("/istanbulDemiryolu", istanbulDemiryolu);
router.get("/istanbulUcusMesafesi", istanbulUcusMesafesi);
router.get("/tekirdagDemiryolu", tekirdagDemiryolu);
router.get("/tekirdagDenizyolu", tekirdagDenizyolu);
router.get("/tekirdagKarayolu", tekirdagKarayolu);
router.get("/tekirdagUcusMesafesi", tekirdagUcusMesafesi);
router.get("/canakkaleDemiryolu", canakkaleDemirYolu);
router.get("/canakkaleDenizYolu", canakkaleDenizyolu);
router.get("/canakkaleKaraYolu", canakkaleKarayolu);
router.get("/canakkaleUcusMesafesi", canakkaleUcusMesafesi);

module.exports = router;
