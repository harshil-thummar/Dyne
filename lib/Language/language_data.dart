class AllTextData {
  List<AllText>? allText;

  AllTextData({this.allText});

  AllTextData.fromJson(Map<String, dynamic> json) {
    if (json['allText'] != null) {
      // ignore: deprecated_member_use
      allText = <AllText>[];
      json['allText'].forEach((v) {
        allText!.add(AllText.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allText != null) {
      data['allText'] = allText!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllText {
  String textId = '';
  String en = '';
  String zh = '';
  String ja = '';
  String de = '';
  String fr = '';
  String pt = '';
  String ar = '';
  String ko = '';
  String ru = '';
  String es = '';
  String hi = '';

  AllText({
    this.textId = '',
    this.en = '',
    this.zh = '',
    this.ja = '',
    this.de = '',
    this.fr = '',
    this.pt = '',
    this.ar = '',
    this.ko = '',
    this.ru = '',
    this.es = '',
    this.hi = '',
  });

  AllText.fromJson(Map<String, dynamic> json) {
    textId = json['textId'] ?? '';
    if (json['languageTextList'] != null) {
      json['languageTextList'].forEach((text) {
        if (text["en"] != null) {
          fr = text["en"] ?? textId;
        }
        if (text["zh"] != null) {
          fr = text["zh"] ?? textId;
        }
        if (text["ja"] != null) {
          fr = text["ja"] ?? textId;
        }
        if (text["de"] != null) {
          fr = text["de"] ?? textId;
        }
        if (text["fr"] != null) {
          fr = text["fr"] ?? textId;
        }
        if (text["pt"] != null) {
          fr = text["pt"] ?? textId;
        }
        if (text["ar"] != null) {
          fr = text["ar"] ?? textId;
        }
        if (text["ko"] != null) {
          fr = text["ko"] ?? textId;
        }
        if (text["ru"] != null) {
          ar = text["ru"] ?? textId;
        }
        if (text["es"] != null) {
          en = text["es"] ?? textId;
        }
        if (text["hi"] != null) {
          ja = text["hi"] ?? textId;
        }
      });
      if (en == '') {
        en = textId;
      }
      if (zh == '') {
        zh = textId;
      }
      if (ja == '') {
        ja = textId;
      }
      if (de == '') {
        de = textId;
      }
      if (fr == '') {
        fr = textId;
      }
      if (pt == '') {
        pt = textId;
      }
      if (ar == '') {
        ar = textId;
      }
      if (ko == '') {
        ko = textId;
      }
      if (ru == '') {
        ru = textId;
      }
      if (es == '') {
        es = textId;
      }
      if (hi == '') {
        hi = textId;
      }
    } else {
      en = textId;
      zh = textId;
      ja = textId;
      de = textId;
      fr = textId;
      pt = textId;
      ar = textId;
      ko = textId;
      ru = textId;
      es = textId;
      hi = textId;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['textId'] = textId;
    data['en'] = en;
    data['zh'] = zh;
    data['ja'] = ja;
    data['de'] = de;
    data['fr'] = fr;
    data['pt'] = pt;
    data['ar'] = ar;
    data['ko'] = ko;
    data['ru'] = ru;
    data['es'] = es;
    data['hi'] = hi;
    return data;
  }
}
