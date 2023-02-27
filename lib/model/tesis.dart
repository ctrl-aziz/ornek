class Tesis {
  String? markerType;
  bool? available;
  bool? public;
  String? tesisTipi;
  bool? active;
  String? tesisId;
  String? tesisAdres;
  String? tesisAdi;
  String? tesisIl;
  String? tesisIlce;
  String? tesisResmi;
  String? tesisLokasyonLat;
  String? tesisLokasyonLong;
  bool? karayollariIcindeMi;
  int? whichSite;

  Tesis(
      {this.markerType,
        this.available,
        this.public,
        this.tesisTipi,
        this.active,
        this.tesisId,
        this.tesisAdres,
        this.tesisAdi,
        this.tesisIl,
        this.tesisIlce,
        this.tesisResmi,
        this.tesisLokasyonLat,
        this.tesisLokasyonLong,
        this.karayollariIcindeMi,
        this.whichSite});

  Tesis.fromJson(Map<String, dynamic> json) {
    markerType = json['marker_type'];
    available = json['available'];
    public = json['public'];
    tesisTipi = json['tesis_tipi'];
    active = json['active'];
    tesisId = json['tesis_id'];
    tesisAdres = json['tesis_adres'];
    tesisAdi = json['tesis_adi'];
    tesisIl = json['tesis_il'];
    tesisIlce = json['tesis_ilce'];
    tesisResmi = json['tesis_resmi'];
    tesisLokasyonLat = json['tesis_lokasyon_lat'];
    tesisLokasyonLong = json['tesis_lokasyon_long'];
    karayollariIcindeMi = json['karayollari_icinde_mi'];
    whichSite = json['which_site'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['marker_type'] = markerType;
    data['available'] = available;
    data['public'] = public;
    data['tesis_tipi'] = tesisTipi;
    data['active'] = active;
    data['tesis_id'] = tesisId;
    data['tesis_adres'] = tesisAdres;
    data['tesis_adi'] = tesisAdi;
    data['tesis_il'] = tesisIl;
    data['tesis_ilce'] = tesisIlce;
    data['tesis_resmi'] = tesisResmi;
    data['tesis_lokasyon_lat'] = tesisLokasyonLat;
    data['tesis_lokasyon_long'] = tesisLokasyonLong;
    data['karayollari_icinde_mi'] = karayollariIcindeMi;
    data['which_site'] = whichSite;
    return data;
  }
}