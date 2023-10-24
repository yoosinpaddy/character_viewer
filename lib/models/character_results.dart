class CharacterResults {
  String? abstract;
  String? abstractSource;
  String? abstractText;
  String? abstractURL;
  String? answer;
  String? answerType;
  String? definition;
  String? definitionSource;
  String? definitionURL;
  String? entity;
  String? heading;
  String? image;
  int? imageHeight;
  int? imageIsLogo;
  int? imageWidth;
  String? infobox;
  String? redirect;
  List<RelatedTopics>? relatedTopics;
  String? type;
  Meta? meta;

  CharacterResults(
      {this.abstract,
        this.abstractSource,
        this.abstractText,
        this.abstractURL,
        this.answer,
        this.answerType,
        this.definition,
        this.definitionSource,
        this.definitionURL,
        this.entity,
        this.heading,
        this.image,
        this.imageHeight,
        this.imageIsLogo,
        this.imageWidth,
        this.infobox,
        this.redirect,
        this.relatedTopics,
        this.type,
        this.meta});

  CharacterResults.fromJson(Map<String, dynamic> json) {
    abstract = json['Abstract'];
    abstractSource = json['AbstractSource'];
    abstractText = json['AbstractText'];
    abstractURL = json['AbstractURL'];
    answer = json['Answer'];
    answerType = json['AnswerType'];
    definition = json['Definition'];
    definitionSource = json['DefinitionSource'];
    definitionURL = json['DefinitionURL'];
    entity = json['Entity'];
    heading = json['Heading'];
    image = json['Image'];
    imageHeight = json['ImageHeight'];
    imageIsLogo = json['ImageIsLogo'];
    imageWidth = json['ImageWidth'];
    infobox = json['Infobox'];
    redirect = json['Redirect'];
    if (json['RelatedTopics'] != null) {
      relatedTopics = <RelatedTopics>[];
      json['RelatedTopics'].forEach((v) {
        relatedTopics!.add(new RelatedTopics.fromJson(v));
      });
    }

    type = json['Type'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Abstract'] = this.abstract;
    data['AbstractSource'] = this.abstractSource;
    data['AbstractText'] = this.abstractText;
    data['AbstractURL'] = this.abstractURL;
    data['Answer'] = this.answer;
    data['AnswerType'] = this.answerType;
    data['Definition'] = this.definition;
    data['DefinitionSource'] = this.definitionSource;
    data['DefinitionURL'] = this.definitionURL;
    data['Entity'] = this.entity;
    data['Heading'] = this.heading;
    data['Image'] = this.image;
    data['ImageHeight'] = this.imageHeight;
    data['ImageIsLogo'] = this.imageIsLogo;
    data['ImageWidth'] = this.imageWidth;
    data['Infobox'] = this.infobox;
    data['Redirect'] = this.redirect;
    if (this.relatedTopics != null) {
      data['RelatedTopics'] =
          this.relatedTopics!.map((v) => v.toJson()).toList();
    }

    data['Type'] = this.type;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class RelatedTopics {
  String? firstURL;
  CharacterIcon? icon;
  String? result;
  String? text;

  RelatedTopics({this.firstURL, this.icon, this.result, this.text});

  RelatedTopics.fromJson(Map<String, dynamic> json) {
    firstURL = json['FirstURL'];
    icon = json['Icon'] != null ? new CharacterIcon.fromJson(json['Icon']) : null;
    result = json['Result'];
    text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FirstURL'] = this.firstURL;
    if (this.icon != null) {
      data['Icon'] = this.icon!.toJson();
    }
    data['Result'] = this.result;
    data['Text'] = this.text;
    return data;
  }

  String getName() {
    if (text == null || text?.isEmpty == true) {
      return '';
    }else if (text?.contains('-') == false) {
      return text??'';
    }else{
      return text?.split('-')[0].trim()??"";
    }
  }

  bool contains(String searchTerm) {
    if (text == null || text?.isEmpty == true) {
      return false;
    }
    return (text?.toLowerCase().contains(searchTerm.toLowerCase()) == true || result?.toLowerCase().contains(searchTerm.toLowerCase()) == true);
  }
}

class CharacterIcon {
  String? height;
  String? uRL;
  String? width;

  CharacterIcon({this.height, this.uRL, this.width});

  CharacterIcon.fromJson(Map<String, dynamic> json) {
    height = json['Height'];
    uRL = json['URL'];
    width = json['Width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Height'] = this.height;
    data['URL'] = this.uRL;
    data['Width'] = this.width;
    return data;
  }
}

class Meta {
  Null? attribution;
  Null? blockgroup;
  Null? createdDate;
  String? description;
  Null? designer;
  Null? devDate;
  String? devMilestone;
  List<Developer>? developer;
  String? exampleQuery;
  String? id;
  Null? isStackexchange;
  String? jsCallbackName;
  Null? liveDate;
  Maintainer? maintainer;
  String? name;
  String? perlModule;
  Null? producer;
  String? productionState;
  String? repo;
  String? signalFrom;
  String? srcDomain;
  int? srcId;
  String? srcName;
  SrcOptions? srcOptions;
  Null? srcUrl;
  String? status;
  String? tab;
  List<String>? topic;
  int? unsafe;

  Meta(
      {this.attribution,
        this.blockgroup,
        this.createdDate,
        this.description,
        this.designer,
        this.devDate,
        this.devMilestone,
        this.developer,
        this.exampleQuery,
        this.id,
        this.isStackexchange,
        this.jsCallbackName,
        this.liveDate,
        this.maintainer,
        this.name,
        this.perlModule,
        this.producer,
        this.productionState,
        this.repo,
        this.signalFrom,
        this.srcDomain,
        this.srcId,
        this.srcName,
        this.srcOptions,
        this.srcUrl,
        this.status,
        this.tab,
        this.topic,
        this.unsafe});

  Meta.fromJson(Map<String, dynamic> json) {
    attribution = json['attribution'];
    blockgroup = json['blockgroup'];
    createdDate = json['created_date'];
    description = json['description'];
    designer = json['designer'];
    devDate = json['dev_date'];
    devMilestone = json['dev_milestone'];
    if (json['developer'] != null) {
      developer = <Developer>[];
      json['developer'].forEach((v) {
        developer!.add(new Developer.fromJson(v));
      });
    }
    exampleQuery = json['example_query'];
    id = json['id'];
    isStackexchange = json['is_stackexchange'];
    jsCallbackName = json['js_callback_name'];
    liveDate = json['live_date'];
    maintainer = json['maintainer'] != null
        ? new Maintainer.fromJson(json['maintainer'])
        : null;
    name = json['name'];
    perlModule = json['perl_module'];
    producer = json['producer'];
    productionState = json['production_state'];
    repo = json['repo'];
    signalFrom = json['signal_from'];
    srcDomain = json['src_domain'];
    srcId = json['src_id'];
    srcName = json['src_name'];
    srcOptions = json['src_options'] != null
        ? new SrcOptions.fromJson(json['src_options'])
        : null;
    srcUrl = json['src_url'];
    status = json['status'];
    tab = json['tab'];
    topic = json['topic'].cast<String>();
    unsafe = json['unsafe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribution'] = this.attribution;
    data['blockgroup'] = this.blockgroup;
    data['created_date'] = this.createdDate;
    data['description'] = this.description;
    data['designer'] = this.designer;
    data['dev_date'] = this.devDate;
    data['dev_milestone'] = this.devMilestone;
    if (this.developer != null) {
      data['developer'] = this.developer!.map((v) => v.toJson()).toList();
    }
    data['example_query'] = this.exampleQuery;
    data['id'] = this.id;
    data['is_stackexchange'] = this.isStackexchange;
    data['js_callback_name'] = this.jsCallbackName;
    data['live_date'] = this.liveDate;
    if (this.maintainer != null) {
      data['maintainer'] = this.maintainer!.toJson();
    }
    data['name'] = this.name;
    data['perl_module'] = this.perlModule;
    data['producer'] = this.producer;
    data['production_state'] = this.productionState;
    data['repo'] = this.repo;
    data['signal_from'] = this.signalFrom;
    data['src_domain'] = this.srcDomain;
    data['src_id'] = this.srcId;
    data['src_name'] = this.srcName;
    if (this.srcOptions != null) {
      data['src_options'] = this.srcOptions!.toJson();
    }
    data['src_url'] = this.srcUrl;
    data['status'] = this.status;
    data['tab'] = this.tab;
    data['topic'] = this.topic;
    data['unsafe'] = this.unsafe;
    return data;
  }
}

class Developer {
  String? name;
  String? type;
  String? url;

  Developer({this.name, this.type, this.url});

  Developer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class Maintainer {
  String? github;

  Maintainer({this.github});

  Maintainer.fromJson(Map<String, dynamic> json) {
    github = json['github'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['github'] = this.github;
    return data;
  }
}

class SrcOptions {
  String? directory;
  int? isFanon;
  int? isMediawiki;
  int? isWikipedia;
  String? language;
  String? minAbstractLength;
  int? skipAbstract;
  int? skipAbstractParen;
  String? skipEnd;
  int? skipIcon;
  int? skipImageName;
  String? skipQr;
  String? sourceSkip;
  String? srcInfo;

  SrcOptions(
      {this.directory,
        this.isFanon,
        this.isMediawiki,
        this.isWikipedia,
        this.language,
        this.minAbstractLength,
        this.skipAbstract,
        this.skipAbstractParen,
        this.skipEnd,
        this.skipIcon,
        this.skipImageName,
        this.skipQr,
        this.sourceSkip,
        this.srcInfo});

  SrcOptions.fromJson(Map<String, dynamic> json) {
    directory = json['directory'];
    isFanon = json['is_fanon'];
    isMediawiki = json['is_mediawiki'];
    isWikipedia = json['is_wikipedia'];
    language = json['language'];
    minAbstractLength = json['min_abstract_length'];
    skipAbstract = json['skip_abstract'];
    skipAbstractParen = json['skip_abstract_paren'];
    skipEnd = json['skip_end'];
    skipIcon = json['skip_icon'];
    skipImageName = json['skip_image_name'];
    skipQr = json['skip_qr'];
    sourceSkip = json['source_skip'];
    srcInfo = json['src_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['directory'] = this.directory;
    data['is_fanon'] = this.isFanon;
    data['is_mediawiki'] = this.isMediawiki;
    data['is_wikipedia'] = this.isWikipedia;
    data['language'] = this.language;
    data['min_abstract_length'] = this.minAbstractLength;
    data['skip_abstract'] = this.skipAbstract;
    data['skip_abstract_paren'] = this.skipAbstractParen;
    data['skip_end'] = this.skipEnd;
    data['skip_icon'] = this.skipIcon;
    data['skip_image_name'] = this.skipImageName;
    data['skip_qr'] = this.skipQr;
    data['source_skip'] = this.sourceSkip;
    data['src_info'] = this.srcInfo;
    return data;
  }
}
