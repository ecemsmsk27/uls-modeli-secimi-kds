const dbConn = require("../db/mysql_connect");
const bcrypt = require("bcrypt");
const util = require("util");

const ekonomikMaliyetGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
       ekonomik_ozellikler.maliyet as "Maliyet(Likert Ölçeği)"
       FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler 
       ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id
       `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const ekonomikRekabetGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      ekonomik_ozellikler.rekabet_derecesi as "Rekabet"
      FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler 
      ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id
      `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const ortalamaTasimaMesafesiGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      ekonomik_ozellikler.ort_tasima_mesafesi_mil as "Ortalama Tasima Mesafesi(mil)"
      FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler 
      ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id
        `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const ekonoMinimumAracKapasitesi = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      ekonomik_ozellikler.arac_kapasitesi_min_ton as "Minimum Araç Kapasitesi(ton)"
      FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler 
      ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id
          `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const ekonoMaximumAracKapasitesi = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      ekonomik_ozellikler.arac_kapasitesi_max_ton as "Maksimum Araç Kapasitesi"
      FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler 
      ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id
            `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const performansErisilebilirlikGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      performans_ozellikleri.erisebilirlik as "Erişilebilirlik"
      FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri 
      ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id
              `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const performansEsneklikGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      performans_ozellikleri.esneklik as "Esneklik"
      FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri 
      ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id
                `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const performansHizGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      performans_ozellikleri.hiz as "Hız"
      FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri 
      ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id
                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const performansKayipHasarGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      performans_ozellikleri.kayip_hasar_ihtimali as "Kayıp ve Hasar İhtimali"
      FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri 
      ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id
                    `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const performansTutarlilikGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      performans_ozellikleri.tutarlilik as "Tutarlılık"
      FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri 
      ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id
                      `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const cevreEnerjiGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      cevresel_ozellikler.enerji_tuketimi_yuzde as "Enerji Tüketimi(%)"
      FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler 
      ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id
                        `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const cevreGurultuGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      cevresel_ozellikler.gurultu_kirliligi_yuzde as "Gürültü Kirliliği(%)"
      FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler 
      ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id
                          `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const cevreisiGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      cevresel_ozellikler.isi_kirliligi_yuzde as "Isı Kirliliği(%)"
      FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler 
      ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id
                            `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const cevreOzonGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      cevresel_ozellikler.ozn_tbk_zararli_gaz_emisyonu as "Ozon Tabakasına Zararlı Gazların Emisyonu(%)"
      FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler 
      ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id
                              `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const cevreSeraGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      cevresel_ozellikler.sera_gazi_emisyonu as "Sera Gazı Emisyonu(%)"
      FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler 
      ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id
                                `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const cevreSuGrafik = (req, res) => {
  dbConn.query(
    `SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", 
      cevresel_ozellikler.su_kirliligi_yuzde as "Su Kirliliği(%)"
      FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler 
      ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const sevkiyatSehirSayisi = (req, res) => {
  dbConn.query(
    `SELECT COUNT(sevkiyat_yapilan_iller.plaka) AS "Sevkiyat Yapılan Toplam İl"
    FROM sevkiyat_yapilan_iller
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const toplamMilKarayolu = (req, res) => {
  dbConn.query(
    `SELECT SUM(sevkiyat_yapilan_iller.izmire_uzaklik_kara_yolu) as "toplam karayolu uzaklik"
    FROM sevkiyat_yapilan_iller
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const toplamMilDemiryolu = (req, res) => {
  dbConn.query(
    `SELECT SUM(sevkiyat_yapilan_iller.izmire_uzaklik_demir_yolu) as "demir yolu toplam mil"
    FROM sevkiyat_yapilan_iller
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const toplamMilHavayolu = (req, res) => {
  dbConn.query(
    `SELECT SUM(sevkiyat_yapilan_iller.izmire_uzaklik_ucus_mesafesi) AS "Toplam Ucus Mesafesi"
    FROM sevkiyat_yapilan_iller
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const toplamMilDenizyolu = (req, res) => {
  dbConn.query(
    `SELECT SUM(sevkiyat_yapilan_iller.izmire_uzaklik_deniz_yolu) as "Toplam Mil Deniz Yolu"
    FROM sevkiyat_yapilan_iller
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const istanbulKarayoluUzaklik = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_kara_yolu as "İstanbul-İzmir arası kara yolu mesafesi."
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 34
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const istanbulUcusMesafesi = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_ucus_mesafesi as "İstanbul-İzmir arası uçuş mesafesi."
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 34
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const istanbulDemiryolu = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_demir_yolu as "İstanbul-İzmir demir yolu mesafesi"
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 34
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const istanbulDenizYolu = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_deniz_yolu as "İstanbul-İzmir deniz yolu mesafesi"
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 34
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const tekirdagKarayolu = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_kara_yolu as "tekirdağ-izmir kara yolu uzaklık"
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 59
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const tekirdagUcusMesafesi = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_ucus_mesafesi as "tekirdağ-izmir arası ucus mesafesi."
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 59
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const tekirdagDenizyolu = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_deniz_yolu as "tekirdağ-izmir arası deniz mesafesi."
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 59
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const tekirdagDemiryolu = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_demir_yolu as "tekirdağ-izmir arası demir yolu mesafesi."
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 59
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const canakkaleKarayolu = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_kara_yolu as "canakkale-izmir arası kara yolu mesafesi."
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 17
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const canakkaleUcusMesafesi = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_ucus_mesafesi as "canakkale-izmir arası ucus mesafesi."
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 17
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const canakkaleDemirYolu = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_demir_yolu as "canakkale-izmir arası demir yolu mesafesi."
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 17
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

const canakkaleDenizyolu = (req, res) => {
  dbConn.query(
    `SELECT sevkiyat_yapilan_iller.izmire_uzaklik_deniz_yolu as "canakkale-izmir arası deniz yolu mesafesi."
    FROM sevkiyat_yapilan_iller
    WHERE sevkiyat_yapilan_iller.plaka = 17
                                  `,

    (err, result) => {
      if (err) {
        res.status(500).send({ success: false, message: err.message });
      } else {
        res.send({ success: true, data: result });
      }
    }
  );
};

module.exports = {
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
};
