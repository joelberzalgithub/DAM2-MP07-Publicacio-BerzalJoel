import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class LayoutInfo extends StatefulWidget {
  const LayoutInfo({Key? key}) : super(key: key);

  @override
  LayoutInfoState createState() => LayoutInfoState();
}

class LayoutInfoState extends State<LayoutInfo> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  Future<void> initDatabase() async {
    String dbPath = join(await getDatabasesPath(), 'doom.db');

    // Connectar (crea la BBDD si no existeix)
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        // Esborrar la taula Characters (si existeix)
        await db.execute(
            'DROP TABLE IF EXISTS characters;');

        // Crear una nova taula Characters
        await db.execute(
            'CREATE TABLE IF NOT EXISTS characters (id INTEGER AUTO-INCREMENT, '
                                                    'race TEXT, '
                                                    'sex TEXT, '
                                                    'status TEXT, '
                                                    'voice_actor TEXT, '
                                                    'description TEXT, '
                                                    'PRIMARY KEY (id));');
        
        // Esborrar la taula Demons (si existeix)
        await db.execute(
            'DROP TABLE IF EXISTS demons;');

        // Crear una nova taula Demons
        await db.execute(
            'CREATE TABLE IF NOT EXISTS demons (id INTEGER AUTO-INCREMENT, '
                                                  'class TEXT, '
                                                  'rank TEXT, '
                                                  'health_points INTEGER, '
                                                  'damage INTEGER, '
                                                  'description TEXT, '
                                                  'PRIMARY KEY (id));');
        
        // Esborrar la taula Weapons (si existeix)
        await db.execute(
            'DROP TABLE IF EXISTS weapons;');

        // Crear una nova taula Weapons
        await db.execute(
            'CREATE TABLE IF NOT EXISTS weapons (id INTEGER AUTO-INCREMENT, '
                                                  'type TEXT, '
                                                  'fire_mode TEXT, '
                                                  'ammo_type TEXT, '
                                                  'damage INTEGER, '
                                                  'description TEXT, '
                                                  'PRIMARY KEY (id));');

        // Esborrar la taula Images (si existeix)
        await db.execute(
            'DROP TABLE IF EXISTS images;');

        // Crear una nova taula Images
        await db.execute(
            'CREATE TABLE IF NOT EXISTS images (id INTEGER AUTO-INCREMENT, '
                                                'id_character INTEGER, '
                                                'id_demon INTEGER, '
                                                'id_weapon INTEGER, '
                                                'name TEXT, '
                                                'content TEXT, '
                                                'PRIMARY KEY (id), '
                                                'FOREIGN KEY (id_character) REFERENCES characters (id), '
                                                'FOREIGN KEY (id_demon) REFERENCES demons (id), '
                                                'FOREIGN KEY (id_weapon) REFERENCES weapons (id));');
      },
    );

    // Inserir personatges
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO characters (race, sex, status, voice_actor, description) VALUES (?, ?, ?, ?, ?)',
          ['Human (Empowered)', 'Male', 'Ally', 'Matthew Waterson', 'The Doom Slayer is the main protagonist of the Doom franchise, serving as the main protagonist of the original trilogy and it spin-off, Doom 64. He returns as the protagonist of Doom (2016) and Doom Eternal.']);
      await txn.rawInsert(
          'INSERT INTO characters (race, sex, status, voice_actor, description) VALUES (?, ?, ?, ?, ?)',
          ['Maykr/Cyborg (Temporarily)', 'Male', 'Ally', 'Darin De Paul', 'Samuel Hayden is the Chairman of the UAC who oversaw the Argent energy research projects at the UAC Argent Facility. A supporting character in Doom (2016) and Doom Eternal, he helps guide the Doom Slayer. It is later revealed in The Ancient Gods that Samuel Hayden is an alias adopted by the Seraphim.']);
      await txn.rawInsert(
          'INSERT INTO characters (race, sex, status, voice_actor, description) VALUES (?, ?, ?, ?, ?)',
          ['Artificial Intelligence', 'Male', 'Ally', 'Kevin Schon', 'VEGA is an Artificial Intelligence who helps the Doom Slayer and appears in Doom (2016) and Doom Eternal. In Doom it is first heard after completing the first level and is also the announcer for the Doom Multiplayer Mode. Near the end of Doom Eternal, and confirmed in The Ancient Gods - Part One, it is revealed that VEGA is The Father.']);
      await txn.rawInsert(
          'INSERT INTO characters (race, sex, status, voice_actor, description) VALUES (?, ?, ?, ?, ?)',
          ['Human/Cyborg (Formerly)', 'Female', 'Enemy', 'Abby Craden', 'Olivia Pierce is a high-ranking researcher of the UAC and the main antagonist of Doom (2016). She was the Head of Biochemical Research at the Argent Facility on Mars and a fanatical researcher of Hell. After coming into contact with Hell''s Dark Lord, Pierce made a pact with Hell to aid in their invasion.']);
      await txn.rawInsert(
          'INSERT INTO characters (race, sex, status, voice_actor, description) VALUES (?, ?, ?, ?, ?)',
          ['Maykr', 'Female', 'Enemy', 'Nika Futterman', 'The Khan Maykr or the Supreme Maykr, is the supreme ruler of the realm of Urdak and the leader of the Maykrs, a highly advanced ancient race of alien beings. She serves as the main antagonist of Doom Eternal.']);
      await txn.rawInsert(
          'INSERT INTO characters (race, sex, status, voice_actor, description) VALUES (?, ?, ?, ?, ?)',
          ['Primeval', 'Male', 'Enemy', 'Piotr Michael', 'Davoth, also known as the Dark Lord, is the title of the supreme ruler of the realm of Hell. The title appears to refer to any entity which claims dominion over Hell, with the realm''s past being divided into "ages" based on the reign of these Lords. The first Dark Lord, Davoth, serves as the main antagonist of Doom Eternal: The Ancient Gods and by extension, the entire Doom series. Though there were other dark lords, willing to take his place.']);
    });

    // Inserir dimonis
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Former Human Soldier', 'Fodder', 400, 30, 'Soldiers, aka Hell Soldiers or Zombie Soldiers, are a common Fodder enemy in Doom Eternal, replacing the Possessed Soldiers and Possessed Security in DOOM. Though similar in behavior and role to their direct predecessors, they have been equipped with jump-jets and redesigned to closely resemble their classic counterparts.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Scavenger', 'Fodder', 200, 23, 'The Imps return in DOOM Eternal. They are first seen from the very start of the game and remain a constant adversary to the player throughout the campaign. Imps still maintain their hunched over design from DOOM, but have undergone some slight design changes to more closely resemble their appearance in the original series.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Armored Charger', 'Heavy', 1000, 40, 'The Pinky is a returning enemy to Doom Eternal. They make their first appearance early in the game, at the Doom Hunter Base. The Pinky is basically unchanged from DOOM, with an armored front that is able to endure a very high amount of damage, but with a soft rear end vulnerable to damage. However, the tail is explicitly made into a Weak Spot in the sequel.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Devourer', 'Heavy', 2500, 70, 'Cacodemons are common demons encountered in all classic and modern Doom games. They are one of the most common monsters the player will encounter, behind the Imp and the Pinky Demon.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Argent/Cybernetically Enhanced Former Human', 'Heavy', 2000, 40, 'Revenants are monsters introduced in Doom II that are easily recognized by their high-pitched shriek. They take the form of very tall animated skeletons with golden-brown bones, in metallic silver body armor equipped with shoulder-mounted missile launchers, and blood and gore running down their ribcage and legs. Their running movements are akin to a stringed puppet.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Enhanced (possibly former human)', 'Heavy', 3750, 80, 'The Mancubus is a Heavy Tank-like demon in Doom Eternal. While serving the same role as in DOOM, it has undergone notable design changes to closely resemble its original appearance. Similar to Doom (2016), a stronger variant in the form of the Cyber Mancubus also makes a reappearance.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Synthetic (Cybernetic Clone of Spider Mastermind)', 'Heavy', 3000, 40, 'The Arachnotron is a spider-like cyborg monster introduced in Doom II. It is similar in appearance to the Spiderdemon, but smaller and with large eyes that change color depending on the monster''s current state (moving, hurt, or attacking). It is supported by a metal chassis and a body that consists primarily of a large brain, along with two small arms. Instead of a chaingun, it wields a powerful plasma gun that fires bursts of yellow and green energy.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Warrior', 'Heavy', 2500, 80, 'The Hell Knight is a demon that appears in DOOM. They are first encountered in the Foundry. Hell Knights are also part of an order of demons known among fans as "Hell Nobles" that also includes the Baron of Hell at the top.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Infernal Servant', 'Super Heavy', 7000, 120, 'Barons of Hell are one of the most powerful demonic creatures encountered in every Doom game. A pair of Barons, referred to internally by id Software as the "Bruiser Brothers," start as the bosses at the end of Knee-Deep in the Dead, the first episode of Doom. In the second game, Barons first appear as regular enemies, three levels after the introduction of it''s weaker cousin, the Hell Knight.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Synthetic (Cybernetic Clone of Harbinger of Doom)', 'Boss', 10000, 288, 'Cyberdemons are a recurring powerful enemy that has appeared in every Doom title. The Doom II manual of the PC version describes the monster in the following way: A missile-launching skyscraper with goat legs. The Doom manual, on the other hand, does not list it, presumably to make its climactic appearance in E2M8 a surprise. The PlayStation, Doom 64, and SNES manual for Doom, however, does make mention of the Cyberdemon: Half unfeeling machine, half raging horned devil. This walking nightmare has a rocket launcher for an arm and will definitely reach out and touch you. Make sure you''re loaded for bear before you take on this guy.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Spider Mastermind', 'Boss', 30000, 315, 'The Spiderdemon or Spider Mastermind is a recurring high-level monster found in classic Doom, The Ultimate Doom, Doom II, and Final Doom. A reworked version appears as the final boss of the 2016 Doom.']);
      await txn.rawInsert(
          'INSERT INTO demons (class, rank, health_points, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Unpowered Marionette (Betrayer''s Son Base)', 'Boss', 45000, 1000, 'The Icon of Sin (aka Baphomet and Gatekeeper or Demonspitter) is a monster which first appears in Doom II. It appears two more times in Final Doom, and a similar creature is found in Doom II RPG, which appears in two forms VIOS (Virtual Icon of Sin), and a physical Icon of Doom (that spawned the VIOS virus). It makes yet another appearance in Doom (2016) where it is given a backstory. Its latest appearance is in Doom Eternal, where its full form is seen.']);
    });

    // Inserir armes
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO weapons (type, fire_mode, ammo_type, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Melee', null, null, 20, 'The chainsaw (uncommonly referred to as "The Great Communicator") is a melee-based weapon that has appeared in every Doom title in the series. This weapon mutilates enemies close enough to contact. At 525 hits per minute, it''s roughly a quadruple-speed fist. It is often used because it conserves ammo, while its "rapid fire" works well on enemies with high pain chance, which minimizes damage in melee situations. The Classic Doom chainsaws brand name is from Beartooth/Eagle Beaver(McCulloch), while the Doom 3 chainsaw is by Mixom, and the 2016''s brand name is Painsaw, an unknown brand name.']);
      await txn.rawInsert(
          'INSERT INTO weapons (type, fire_mode, ammo_type, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Handgun', 'Semi-Automatic', 'Bullets', 15, 'The pistol is the player''s default weapon, and fires bullets. Each player enters the game with a pistol, fifty bullets, and their fists, with the pistol selected as the active weapon. It uses the same ammunition as the chaingun. None of the monsters carry a pistol, though the Zombieman appears to be armed with a rifle that fires pistol bullets.']);
      await txn.rawInsert(
          'INSERT INTO weapons (type, fire_mode, ammo_type, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Shotgun', 'Pump-Action', 'Shells', 105, 'The shotgun (aka Pump Shotgun) is one of the most versatile and useful weapons in the Doom player''s arsenal, equipped in every classic Doom game. It''s a pump-action shotgun with a wooden stock. It has an old-fashioned look and is first found in a secret area of E1M1: Hangar (or possibly taken from a Shotgun Guy on the upper two skill levels), then in a non-secret area on E1M2: Nuclear Plant. A shotgun contains 8 shells when picked up. Shotguns looted from the corpses of shotgun wielding zombies contain 4 shells and, unlike pre-existing shotguns, disappear when crushed beneath doors or moving ceilings.']);
      await txn.rawInsert(
          'INSERT INTO weapons (type, fire_mode, ammo_type, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Shotgun', 'Double', 'Shells', 310, 'The super shotgun is a sawed-off, break-action, double-barreled shotgun in contrast to the original shotgun which is pump-action and single-barreled. In Doom Eternal this weapon has an additional feature in the form of the Meat Hook. This functions as a grappling hook, allowing the Doom Slayer to grapple onto enemies and drag himself towards them for a devastating close-range blast.']);
      await txn.rawInsert(
          'INSERT INTO weapons (type, fire_mode, ammo_type, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Assault Rifle', 'Automatic', 'Bullets', 40, 'Based on the description and characteristics, the Heavy Assault Rifle is more like a heavy machine gun than an assault rifle by early 21st century standards. It fires from a closed bolt, but is belt fed. Additionally, it''s stated that it fires a .50 caliber FMJ round. Judging by the cartridge''s appearance, it is roughly equivalent to the .50 BMG round, which has historically only been used for heavy machine guns and sniper/anti-material rifles.']);
      await txn.rawInsert(
          'INSERT INTO weapons (type, fire_mode, ammo_type, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Machine Gun', 'Automatic', 'Bullets', 80, 'The chaingun (also known as "gatling gun") is a rapid-firing, multi-barrelled automatic weapon. It uses the same ammunition as the pistol, and is fed from the player''s shared stock of bullets. The Doom chaingun is very resemblant to the Gryazev-Shipunov GSh-6-23 rotary cannon.']);
      await txn.rawInsert(
          'INSERT INTO weapons (type, fire_mode, ammo_type, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Shoulder-Launched Weapon', 'Semi-Automatic', 'Rockets', 350, 'The rocket launcher is used to fire rockets, missiles that fly in a straight line and explode when they hit anything solid. When picked up, the launcher contains two rockets. The Doom 3 Rocket Launcher is based on the Carl Gustaf recoilless rifle, as the Classic Doom rocket launcher has more of a late RPG design to it.']);
      await txn.rawInsert(
          'INSERT INTO weapons (type, fire_mode, ammo_type, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Energy Weapon', 'Automatic', 'Argent-type Plasma', 50, 'The Plasma Gun (also known as the Plasma Rifle in the game manuals and help screen) is a futuristic weapon with a barrel that roughly resembles an accordion, which fires blue and white bursts of plasma. It shares the player''s stock of cells with the BFG9000 as a source of ammo.']);
      await txn.rawInsert(
          'INSERT INTO weapons (type, fire_mode, ammo_type, damage, description) VALUES (?, ?, ?, ?, ?)',
          ['Energy Weapon', 'Semi-Automatic', 'Argent-type Plasma', 275, 'The BFG 9000 makes a powerful comeback in Doom Eternal, found on the Phobos Base as the main power source of the BFG 10000 superweapon, which is part of the anti-demonic defense grid and is used by the Doom Slayer to shoot a hole into the surface of Mars. In gameplay, it''s observed that the reticle will also feature a counter for the amount of enemies killed by the oncoming blast.']);
    });

    // Desconnectar
    await database.close();
  }
}
