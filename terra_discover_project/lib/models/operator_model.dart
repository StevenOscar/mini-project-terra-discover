import 'dart:convert';

List<OperatorModel> operatorFromJson(String str) => List<OperatorModel>.from(json.decode(str).map((x) => OperatorModel.fromJson(x)));

class OperatorModel {
    String name;
    int rarity;
    String alter;
    String? artist;
    String va;
    String biography;
    String? description;
    String? quote;
    Voicelines? voicelines;
    Map<String,dynamic> lore;
    List<String>? affiliation;
    List<String>? operatorClass;
    List<String>? tags;
    List<RangeClass>? range;
    Map<String,dynamic> statistics;
    String? trait;
    List<Cost> costs;
    List<Potential> potential;
    List<Potential>? trust;
    List<Talent> talents;
    List<Skill> skills;
    String headhunting;
    String recruitable;
    List<Art> art;
    String availability;
    ReleaseDates releaseDates;
    String url;

    OperatorModel({
        required this.name,
        required this.rarity,
        required this.alter,
        required this.artist,
        required this.va,
        required this.biography,
        this.description,
        this.quote,
        this.voicelines,
        required this.lore,
        required this.affiliation,
        required this.operatorClass,
        required this.tags,
        required this.range,
        required this.statistics,
        required this.trait,
        required this.costs,
        required this.potential,
        required this.trust,
        required this.talents,
        required this.skills,
        required this.headhunting,
        required this.recruitable,
        required this.art,
        required this.availability,
        required this.releaseDates,
        required this.url,
    });

    factory OperatorModel.fromJson(Map<String, dynamic> json) => OperatorModel(
        name: json["name"],
        rarity: json["rarity"],
        alter: json["alter"],
        artist: json["artist"],
        va: json["va"],
        biography: json["biography"],
        description: json["description"],
        quote: json["quote"],
        voicelines: json["voicelines"] == null ? null : Voicelines.fromJson(json["voicelines"]),
        lore: json["lore"],
        affiliation: List<String>.from(json["affiliation"].map((x) => x)),
        operatorClass: List<String>.from(json["class"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        range: List<RangeClass>.from(json["range"].map((x) => RangeClass.fromJson(x))),
        statistics: json["statistics"],
        trait: json["trait"],
        costs: List<Cost>.from(json["costs"].map((x) => Cost.fromJson(x))),
        potential: List<Potential>.from(json["potential"].map((x) => Potential.fromJson(x))),
        trust: List<Potential>.from(json["trust"].map((x) => Potential.fromJson(x))),
        talents: List<Talent>.from(json["talents"].map((x) => Talent.fromJson(x))),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        headhunting: json["headhunting"],
        recruitable: json["recruitable"],
        art: List<Art>.from(json["art"].map((x) => Art.fromJson(x))),
        availability:json["availability"],
        releaseDates: ReleaseDates.fromJson(json["release_dates"]),
        url: json["url"],
    );
}

class Art {
    String name;
    String link;
    String? line;

    Art({
        required this.name,
        required this.link,
        this.line,
    });

    factory Art.fromJson(Map<String, dynamic> json) => Art(
        name: json["name"],
        link: json["link"],
        line: json["line"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "line": line,
    };
}

class Cost {
    String name;
    int amount;

    Cost({
        required this.name,
        required this.amount,
    });

    factory Cost.fromJson(Map<String, dynamic> json) => Cost(
        name: json["name"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
    };
}

class Potential {
    String name;
    String value;

    Potential({
        required this.name,
        required this.value,
    });

    factory Potential.fromJson(Map<String, dynamic> json) => Potential(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}

class RangeClass {
    String elite;
    List<List<String>> range;

    RangeClass({
        required this.elite,
        required this.range,
    });

    factory RangeClass.fromJson(Map<String, dynamic> json) => RangeClass(
        elite: json["elite"],
        range: List<List<String>>.from(json["range"].map((x) => List<String>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toJson() => {
        "elite": elite,
        "range": List<dynamic>.from(range.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}

class ReleaseDates {
    String cn;
    String global;

    ReleaseDates({
        required this.cn,
        required this.global,
    });

    factory ReleaseDates.fromJson(Map<String, dynamic> json) => ReleaseDates(
        cn: json["cn"],
        global: json["global"],
    );

    Map<String, dynamic> toJson() => {
        "cn": cn,
        "global": global,
    };
}

class Skill {
    String name;
    List<SkillVariation> variations;
    String skillCharge;
    String skillActivation;

    Skill({
        required this.name,
        required this.variations,
        required this.skillCharge,
        required this.skillActivation,
    });

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        name: json["name"],
        variations: List<SkillVariation>.from(json["variations"].map((x) => SkillVariation.fromJson(x))),
        skillCharge: json["skill_charge"],
        skillActivation: json["skill_activation"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
        "skill_charge": skillCharge,
        "skill_activation": skillActivation,
    };
}

class SkillVariation {
    dynamic level;
    String description;
    String spCost;
    String initialSp;
    String duration;
    dynamic range;

    SkillVariation({
        required this.level,
        required this.description,
        required this.spCost,
        required this.initialSp,
        required this.duration,
        required this.range,
    });

    factory SkillVariation.fromJson(Map<String, dynamic> json) => SkillVariation(
        level: json["level"],
        description: json["description"],
        spCost: json["sp_cost"],
        initialSp: json["initial_sp"],
        duration: json["duration"],
        range: json["range"],
    );

    Map<String, dynamic> toJson() => {
        "level": level,
        "description": description,
        "sp_cost": spCost,
        "initial_sp": initialSp,
        "duration": duration,
        "range": range,
    };
}

class Talent {
    String name;
    List<TalentVariation> variation;

    Talent({
        required this.name,
        required this.variation,
    });

    factory Talent.fromJson(Map<String, dynamic> json) => Talent(
        name: json["name"],
        variation: List<TalentVariation>.from(json["variation"].map((x) => TalentVariation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "variation": List<dynamic>.from(variation.map((x) => x.toJson())),
    };
}

class TalentVariation {
    String description;
    String elite;
    String potential;

    TalentVariation({
        required this.description,
        required this.elite,
        required this.potential,
    });

    factory TalentVariation.fromJson(Map<String, dynamic> json) => TalentVariation(
        description: json["description"],
        elite: json["elite"],
        potential: json["potential"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "elite": elite,
        "potential": potential,
    };
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
    String addedToSquad;
    String appointedAsSquadLeader;
    String depart;
    String beginOperation;
    String selectingOperator1;
    String selectingOperator2;
    String deployment1;
    String deployment2;
    String inBattle1;
    String inBattle2;
    String? inBattle3;
    String? inBattle4;
    String? empty;
    String the3StarResult;
    String? sub3StarResult;
    String? operationFailure;
    String? assignedToFacility;
    String? tap;
    String? trustTap;
    String? greeting;
    String? the4StarResult;

    Voicelines({
        this.appointedAsAssistant,
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
        required this.addedToSquad,
        required this.appointedAsSquadLeader,
        required this.depart,
        required this.beginOperation,
        required this.selectingOperator1,
        required this.selectingOperator2,
        required this.deployment1,
        required this.deployment2,
        required this.inBattle1,
        required this.inBattle2,
        this.inBattle3,
        this.inBattle4,
        this.empty,
        required this.the3StarResult,
        this.sub3StarResult,
        this.operationFailure,
        this.assignedToFacility,
        this.tap,
        this.trustTap,
        this.greeting,
        this.the4StarResult,
    });

    factory Voicelines.fromJson(Map<String, dynamic> json) => Voicelines(
        appointedAsAssistant: json["appointed_as_assistant"],
        talk1: json["talk_1"],
        talk2: json["talk_2"],
        talk3: json["talk_3"],
        talkAfterPromotion1: json["talk_after_promotion_1"],
        talkAfterPromotion2: json["talk_after_promotion_2"],
        talkAfterTrustIncrease1: json["talk_after_trust_increase_1"],
        talkAfterTrustIncrease2: json["talk_after_trust_increase_2"],
        talkAfterTrustIncrease3: json["talk_after_trust_increase_3"],
        idle: json["idle"],
        onboard: json["onboard"],
        watchingBattleRecord: json["watching_battle_record"],
        promotion1: json["promotion_1"],
        promotion2: json["promotion_2"],
        addedToSquad: json["added_to_squad"],
        appointedAsSquadLeader: json["appointed_as_squad_leader"],
        depart: json["depart"],
        beginOperation: json["begin_operation"],
        selectingOperator1: json["selecting_operator_1"],
        selectingOperator2: json["selecting_operator_2"],
        deployment1: json["deployment_1"],
        deployment2: json["deployment_2"],
        inBattle1: json["in_battle_1"],
        inBattle2: json["in_battle_2"],
        inBattle3: json["in_battle_3"],
        inBattle4: json["in_battle_4"],
        empty: json["完成高难行动"],
        the3StarResult: json["3-star_result"],
        sub3StarResult: json["sub_3-star_result"],
        operationFailure: json["operation_failure"],
        assignedToFacility: json["assigned_to_facility"],
        tap: json["tap"],
        trustTap: json["trust_tap"],
        greeting: json["greeting"],
        the4StarResult: json["4-star_result"],
    );

    Map<String, dynamic> toJson() => {
        "appointed_as_assistant": appointedAsAssistant,
        "talk_1": talk1,
        "talk_2": talk2,
        "talk_3": talk3,
        "talk_after_promotion_1": talkAfterPromotion1,
        "talk_after_promotion_2": talkAfterPromotion2,
        "talk_after_trust_increase_1": talkAfterTrustIncrease1,
        "talk_after_trust_increase_2": talkAfterTrustIncrease2,
        "talk_after_trust_increase_3": talkAfterTrustIncrease3,
        "idle": idle,
        "onboard": onboard,
        "watching_battle_record": watchingBattleRecord,
        "promotion_1": promotion1,
        "promotion_2": promotion2,
        "added_to_squad": addedToSquad,
        "appointed_as_squad_leader": appointedAsSquadLeader,
        "depart": depart,
        "begin_operation": beginOperation,
        "selecting_operator_1": selectingOperator1,
        "selecting_operator_2": selectingOperator2,
        "deployment_1": deployment1,
        "deployment_2": deployment2,
        "in_battle_1": inBattle1,
        "in_battle_2": inBattle2,
        "in_battle_3": inBattle3,
        "in_battle_4": inBattle4,
        "完成高难行动": empty,
        "3-star_result": the3StarResult,
        "sub_3-star_result": sub3StarResult,
        "operation_failure": operationFailure,
        "assigned_to_facility": assignedToFacility,
        "tap": tap,
        "trust_tap": trustTap,
        "greeting": greeting,
        "4-star_result": the4StarResult,
    };
}