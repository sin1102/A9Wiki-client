class OperatorDetail {
  String? opId;
  String? name;
  int? rarity;
  String? alter;
  String? va;
  String? biography;
  String? description;
  String? quote;
  Voicelines? voicelines;
  Lore? lore;
  List<String>? affiliation;
  List<String>? classes;
  List<String>? tags;
  List<Range>? range;
  Statistics? statistics;
  String? trait;
  List<Costs>? costs;
  List<Potential>? potential;
  Potential? trust;
  List<Talents>? talents;
  List<Skills>? skills;
  List<Module>? module;
  bool? headhunting;
  bool? recruitable;
  bool? limited;
  List<Art>? art;
  String? availability;
  String? url;
  String? createdAt;
  String? updatedAt;
  String? icon;
  String? attackType;
  String? classIcon;
  String? faction;
  List<BaseSkill>? baseskill;

  OperatorDetail(
      {this.opId,
      this.name,
      this.rarity,
      this.alter,
      this.va,
      this.biography,
      this.description,
      this.quote,
      this.voicelines,
      this.lore,
      this.affiliation,
      this.classes,
      this.tags,
      this.range,
      this.statistics,
      this.trait,
      this.costs,
      this.potential,
      this.trust,
      this.talents,
      this.skills,
      this.module,
      this.headhunting,
      this.recruitable,
      this.limited,
      this.art,
      this.availability,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.icon,
      this.attackType,
      this.classIcon,
      this.faction,
      this.baseskill});

  OperatorDetail.fromJson(dynamic json) {
    opId = json['opId'];
    name = json['name'];
    rarity = json['rarity'];
    alter = json['alter'];
    va = json['va'];
    biography = json['biography'];
    description = json['description'];
    quote = json['quote'];
    voicelines = json['voicelines'] != null
        ? new Voicelines.fromJson(json['voicelines'])
        : null;
    lore = json['lore'] != null ? new Lore.fromJson(json['lore']) : null;
    affiliation = json['affiliation'].cast<String>();
    classes = json['class'].cast<String>();
    tags = json['tags'].cast<String>();
    if (json['range'] != null) {
      range = <Range>[];
      json['range'].forEach((v) {
        range!.add(new Range.fromJson(v));
      });
    }
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
    trait = json['trait'];
    if (json['costs'] != null) {
      costs = <Costs>[];
      json['costs'].forEach((v) {
        costs!.add(new Costs.fromJson(v));
      });
    }
    if (json['potential'] != null) {
      potential = <Potential>[];
      json['potential'].forEach((v) {
        potential!.add(new Potential.fromJson(v));
      });
    }
    trust =
        json['trust'] != null ? new Potential.fromJson(json['trust']) : null;
    if (json['talents'] != null) {
      talents = <Talents>[];
      json['talents'].forEach((v) {
        talents!.add(new Talents.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['module'] != null) {
      module = <Module>[];
      json['module'].forEach((v) {
        module!.add(new Module.fromJson(v));
      });
    }
    headhunting = json['headhunting'];
    recruitable = json['recruitable'];
    limited = json['Limited'];
    if (json['art'] != null) {
      art = <Art>[];
      json['art'].forEach((v) {
        art!.add(new Art.fromJson(v));
      });
    }
    availability = json['availability'];
    url = json['url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    icon = json['icon'];
    attackType = json['attack_type'];
    classIcon = json['classIcon'];
    faction = json['faction'];
    if (json['baseskill'] != null) {
      baseskill = <BaseSkill>[];
      json['baseskill'].forEach((v) {
        baseskill!.add(new BaseSkill.fromJson(v));
      });
    }
  }
}

class Voicelines {
  String? appointedAsAssistant;
  String? talk1;
  String? talk2;
  String? talk3;
  String? talkAfterPromotion1;
  String? talkAfterPromotion2;
  String? talkAfterTrustIncrease1;
  String? talkAfterTrustIncrease2;
  String? talkAfterTrustIncrease3;
  String? idle;
  String? onboard;
  String? watchingBattleRecord;
  String? promotion1;
  String? promotion2;
  String? addedToSquad;
  String? appointedAsSquadLeader;
  String? depart;
  String? beginOperation;
  String? selectingOperator1;
  String? selectingOperator2;
  String? deployment1;
  String? deployment2;
  String? inBattle1;
  String? inBattle2;
  String? inBattle3;
  String? inBattle4;
  String? s4StarResult;
  String? s3StarResult;
  String? sub3StarResult;
  String? operationFailure;
  String? assignedToFacility;
  String? tap;
  String? trustTap;
  String? title;
  String? greeting;

  Voicelines(
      {this.appointedAsAssistant,
      this.talk1,
      this.talk2,
      this.talk3,
      this.talkAfterPromotion1,
      this.talkAfterPromotion2,
      this.talkAfterTrustIncrease1,
      this.talkAfterTrustIncrease2,
      this.talkAfterTrustIncrease3,
      this.idle,
      this.onboard,
      this.watchingBattleRecord,
      this.promotion1,
      this.promotion2,
      this.addedToSquad,
      this.appointedAsSquadLeader,
      this.depart,
      this.beginOperation,
      this.selectingOperator1,
      this.selectingOperator2,
      this.deployment1,
      this.deployment2,
      this.inBattle1,
      this.inBattle2,
      this.inBattle3,
      this.inBattle4,
      this.s4StarResult,
      this.s3StarResult,
      this.sub3StarResult,
      this.operationFailure,
      this.assignedToFacility,
      this.tap,
      this.trustTap,
      this.title,
      this.greeting});

  Voicelines.fromJson(json) {
    appointedAsAssistant = json['appointed_as_assistant'];
    talk1 = json['talk_1'];
    talk2 = json['talk_2'];
    talk3 = json['talk_3'];
    talkAfterPromotion1 = json['talk_after_promotion_1'];
    talkAfterPromotion2 = json['talk_after_promotion_2'];
    talkAfterTrustIncrease1 = json['talk_after_trust_increase_1'];
    talkAfterTrustIncrease2 = json['talk_after_trust_increase_2'];
    talkAfterTrustIncrease3 = json['talk_after_trust_increase_3'];
    idle = json['idle'];
    onboard = json['onboard'];
    watchingBattleRecord = json['watching_battle_record'];
    promotion1 = json['promotion_1'];
    promotion2 = json['promotion_2'];
    addedToSquad = json['added_to_squad'];
    appointedAsSquadLeader = json['appointed_as_squad_leader'];
    depart = json['depart'];
    beginOperation = json['begin_operation'];
    selectingOperator1 = json['selecting_operator_1'];
    selectingOperator2 = json['selecting_operator_2'];
    deployment1 = json['deployment_1'];
    deployment2 = json['deployment_2'];
    inBattle1 = json['in_battle_1'];
    inBattle2 = json['in_battle_2'];
    inBattle3 = json['in_battle_3'];
    inBattle4 = json['in_battle_4'];
    s4StarResult = json['4-star_result'];
    s3StarResult = json['3-star_result'];
    sub3StarResult = json['sub_3-star_result'];
    operationFailure = json['operation_failure'];
    assignedToFacility = json['assigned_to_facility'];
    tap = json['tap'];
    trustTap = json['trust_tap'];
    title = json['title'];
    greeting = json['greeting'];
  }
}

class Lore {
  String? gender;
  String? placeOfBirth;
  String? birthday;
  String? race;
  String? height;
  String? combatExperience;
  String? infectionStatus;
  String? physicalStrength;
  String? mobility;
  String? physiologicalEndurance;
  String? tacticalPlanning;
  String? combatSkill;
  String? originiumAdaptability;

  Lore(
      {this.gender,
      this.placeOfBirth,
      this.birthday,
      this.race,
      this.height,
      this.combatExperience,
      this.infectionStatus,
      this.physicalStrength,
      this.mobility,
      this.physiologicalEndurance,
      this.tacticalPlanning,
      this.combatSkill,
      this.originiumAdaptability});

  Lore.fromJson(json) {
    gender = json['gender'];
    placeOfBirth = json['place_of_birth'];
    birthday = json['birthday'];
    race = json['race'];
    height = json['height'];
    combatExperience = json['combat_experience'];
    infectionStatus = json['infection_status'];
    physicalStrength = json['physical_strength'];
    mobility = json['mobility'];
    physiologicalEndurance = json['physiological_endurance'];
    tacticalPlanning = json['tactical_planning'];
    combatSkill = json['combat_skill'];
    originiumAdaptability = json['originium_adaptability'];
  }
}

class Range {
  String? elite;
  List<List>? range;

  Range({this.elite, this.range});

  Range.fromJson(json) {
    elite = json['elite'];
    if (json['range'] != null) {
      range = <List>[];
      json['range'].forEach((v) {
        range!.add(v);
      });
    }
  }
}

class Statistics {
  Base? base;
  E0max? e0max;
  E0max? e1max;
  E0max? e2max;

  Statistics({this.base, this.e0max, this.e1max, this.e2max});

  Statistics.fromJson(json) {
    base = json['base'] != null ? new Base.fromJson(json['base']) : null;
    e0max = json['e0max'] != null ? new E0max.fromJson(json['e0max']) : null;
    e1max = json['e1max'] != null ? new E0max.fromJson(json['e1max']) : null;
    e2max = json['e2max'] != null ? new E0max.fromJson(json['e2max']) : null;
  }
}

class Base {
  String? hp;
  String? atk;
  String? def;
  String? resist;
  String? deploy;
  String? cost;
  String? interval;
  String? block;

  Base(
      {this.hp,
      this.atk,
      this.def,
      this.resist,
      this.deploy,
      this.cost,
      this.interval,
      this.block});

  Base.fromJson(json) {
    hp = json['hp'];
    atk = json['atk'];
    def = json['def'];
    resist = json['resist'];
    deploy = json['deploy'];
    cost = json['cost'];
    interval = json['interval'];
    block = json['block'];
  }
}

class E0max {
  String? hp;
  String? atk;
  String? def;
  String? block;

  E0max({this.hp, this.atk, this.def, this.block});

  E0max.fromJson(json) {
    hp = json['hp'];
    atk = json['atk'];
    def = json['def'];
    block = json['block'];
  }
}

class Costs {
  String? icon;
  String? name;
  int? amount;

  Costs({this.icon, this.name, this.amount});

  Costs.fromJson(json) {
    icon = json['icon'];
    name = json['name'];
    amount = json['amount'];
  }
}

class Potential {
  String? name;
  String? value;

  Potential({this.name, this.value});

  Potential.fromJson(json) {
    name = json['name'];
    value = json['value'];
  }
}

class Talents {
  String? elite;
  String? potential;
  String? talentName;
  String? description;

  Talents({this.elite, this.potential, this.talentName, this.description});

  Talents.fromJson(json) {
    elite = json['elite'];
    potential = json['potential'];
    talentName = json['talentName'];
    description = json['description'];
  }
}

class Skills {
  String? name;
  List<Variations>? variations;
  String? skillCharge;
  String? skillActivation;

  Skills({this.name, this.variations, this.skillCharge, this.skillActivation});

  Skills.fromJson(json) {
    name = json['name'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    skillCharge = json['skill_charge'];
    skillActivation = json['skill_activation'];
  }
}

class Variations {
  dynamic level;
  String? description;
  String? spCost;
  String? initialSp;
  String? duration;
  dynamic range;

  Variations(
      {this.level,
      this.description,
      this.spCost,
      this.initialSp,
      this.duration,
      this.range});

  Variations.fromJson(json) {
    level = json['level'];
    description = json['description'];
    spCost = json['sp_cost'];
    initialSp = json['initial_sp'];
    duration = json['duration'];
    range = json['range'];
  }
}

class Module {
  String? name;
  String? trust;
  String? availability;
  List<Levels>? levels;

  Module({this.name, this.trust, this.availability, this.levels});

  Module.fromJson(json) {
    name = json['name'];
    trust = json['trust'];
    availability = json['availability'];
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(new Levels.fromJson(v));
      });
    }
  }
}

class Levels {
  int? level;
  String? trait;
  List<TalentChanges>? talentChanges;
  List<String>? unlock;
  Attributes? attributes;

  Levels(
      {this.level,
      this.trait,
      this.talentChanges,
      this.unlock,
      this.attributes});

  Levels.fromJson(json) {
    level = json['level'];
    trait = json['trait'];
    if (json['talent_changes'] != null) {
      talentChanges = <TalentChanges>[];
      json['talent_changes'].forEach((v) {
        talentChanges!.add(new TalentChanges.fromJson(v));
      });
    }
    unlock = json['unlock'].cast<String>();
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }
}

class TalentChanges {
  String? name;
  String? value;
  String? elite;
  String? potential;
  int? moduleLevel;

  TalentChanges(
      {this.name, this.value, this.elite, this.potential, this.moduleLevel});

  TalentChanges.fromJson(json) {
    name = json['name'];
    value = json['value'];
    elite = json['elite'];
    potential = json['potential'];
    moduleLevel = json['module_level'];
  }
}

class Attributes {
  String? maxHp;
  String? atk;
  String? def;

  Attributes({this.maxHp, this.atk, this.def});

  Attributes.fromJson(json) {
    maxHp = json['max_hp'];
    atk = json['atk'];
    def = json['def'];
  }
}

class BaseSkill {
  String? name;
  String? level;
  String? effects;
  String? building;

  BaseSkill({this.name, this.level, this.effects, this.building});

  BaseSkill.fromJson(json) {
    name = json['name'];
    level = json['level'];
    effects = json['effects'];
    building = json['building'];
  }
}

class Art {
  String? name;
  String? link;

  Art({this.name, this.link});

  Art.fromJson(json) {
    name = json['name'];
    link = json['link'];
  }
}
