-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema witcherdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `witcherdb` ;

-- -----------------------------------------------------
-- Schema witcherdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `witcherdb` DEFAULT CHARACTER SET utf8 ;
USE `witcherdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NULL,
  `password` VARCHAR(200) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `image_url` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `player` ;

CREATE TABLE IF NOT EXISTS `player` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `current_health` INT NOT NULL,
  `max_health` INT NOT NULL,
  `experience_level` INT NOT NULL,
  `image_url` TEXT NULL,
  `location_id` INT NULL DEFAULT 1,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_player_location1_idx` (`location_id` ASC),
  INDEX `fk_player_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_player_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weapon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weapon` ;

CREATE TABLE IF NOT EXISTS `weapon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `damage` INT UNSIGNED NOT NULL,
  `description` VARCHAR(2000) NOT NULL,
  `tier` INT NOT NULL,
  `player_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_weapon_player1_idx` (`player_id` ASC),
  CONSTRAINT `fk_weapon_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `armor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armor` ;

CREATE TABLE IF NOT EXISTS `armor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `defense` INT UNSIGNED NOT NULL,
  `description` VARCHAR(2000) NOT NULL,
  `tier` INT NOT NULL,
  `player_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_armor_player1_idx` (`player_id` ASC),
  CONSTRAINT `fk_armor_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `monster`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `monster` ;

CREATE TABLE IF NOT EXISTS `monster` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `health` INT NOT NULL,
  `damage` INT UNSIGNED NOT NULL,
  `experience_reward` INT NOT NULL,
  `image_url` TEXT NULL,
  `player_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_monster_player1_idx` (`player_id` ASC),
  CONSTRAINT `fk_monster_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `monster_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `monster_location` ;

CREATE TABLE IF NOT EXISTS `monster_location` (
  `monster_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`monster_id`, `location_id`),
  INDEX `fk_monster_has_location_location1_idx` (`location_id` ASC),
  INDEX `fk_monster_has_location_monster1_idx` (`monster_id` ASC),
  CONSTRAINT `fk_monster_has_location_monster1`
    FOREIGN KEY (`monster_id`)
    REFERENCES `monster` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_monster_has_location_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS witcheruser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'witcheruser'@'localhost' IDENTIFIED BY 'witcheruser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'witcheruser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `enabled`) VALUES (1, 'walkerjohnelle', 'johnellewalker@gmail.com', '9ol.)P:?', 'admin', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Kaer Seren', 'A secluded fortress nestled in the wilderness, Kaer Seren stands as a bastion against the encroaching dangers of the Northern Realms. Home to skilled Witchers, the stronghold is a training ground for monster slayers.', 'https://preview.redd.it/q7jujbxva7w21.jpg?width=1536&format=pjpg&auto=webp&s=469929c701dfd8fb17f2a8841945c635d9aa545f');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Hengfors', 'A bustling trade hub with a vibrant market, Hengfors attracts merchants and travelers from far and wide. Known for its skilled artisans and diverse population, the town is a melting pot of cultures and commerce.', 'https://preview.redd.it/iuwm3d5gesx01.jpg?width=960&crop=smart&auto=webp&s=f59ad92deb41b40fb9ce45527764ff7f7f0628ab');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Novigrad', 'The bustling city of Novigrad, a beacon of civilization, teems with life and intrigue. A hub of commerce, politics, and the arts, Novigrad is a place where fortunes are made and lost, and where secrets lurk in every shadow.', 'https://static1.thegamerimages.com/wordpress/wp-content/uploads/2020/11/the_witcher_novigrad.jpg?q=50&fit=contain&w=1140&h=570&dpr=1.5');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Cidaris', 'Nestled along the coast, Cidaris is a picturesque town known for its maritime trade and beautiful landscapes. Famous for its shipyards and seafaring tradition, Cidaris is a vital maritime center in the Witcher world.', 'https://wegotthiscovered.com/wp-content/uploads/2023/06/The_Witcher_locations.jpg');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (5, 'Cintra', 'Once a grand kingdom with a rich history, Cintra is now a land scarred by conflict. Known for its valiant warriors and resilient spirit, the town has faced adversity but remains a symbol of strength and determination.', 'https://cdna.artstation.com/p/assets/images/images/028/520/720/medium/simon-trushkin-final-result.jpg?1594722535');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (6, 'Kaer Morhen', 'Kaer Morhen, nestled in the mountains of Kaedwen, serves as the ancestral home and stronghold of the witchers. This ancient fortress, characterized by its imposing stone walls and rugged landscape, has stood for centuries as the training grounds for witchers from various schools. Despite its isolated and austere appearance, Kaer Morhen holds within its walls a rich history of trials, camaraderie, and the secrets of the witcher trade.', 'https://static1.srcdn.com/wordpress/wp-content/uploads/2022/12/kaer-morhen-in-witcher-3.jpg?q=50&fit=contain&w=1140&h=&dpr=1.5');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (7, 'Vizima', 'Vizima, the bustling capital city of Temeria, stands as a beacon of civilization amidst the tumultuous lands of the Northern Kingdoms. From its majestic royal palace to its vibrant marketplaces and winding streets, Vizima teems with life, intrigue, and political maneuvering. As the heart of Temerian culture and governance, Vizima attracts individuals from all walks of life, from merchants and nobles to spies and sorceresses, each with their own ambitions and secrets.', 'https://imgix.bustle.com/uploads/image/2022/12/16/cce4251b-ffaf-496e-9d2f-6651acaa9c3a-body-2.jpg?w=825&h=477&fit=crop&crop=faces&auto=format%2Ccompress');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (8, 'Ban Ard', 'Ban Ard, renowned for its prestigious academy of magic, is a picturesque town nestled in the verdant hills of Aedirn. Surrounded by lush forests and tranquil lakes, Ban Ard exudes an aura of wisdom and arcane knowledge. The academy stands as a beacon for aspiring mages seeking to hone their craft under the guidance of esteemed scholars. Yet, beneath its serene exterior, Ban Ard harbors deep mysteries and ancient powers waiting to be uncovered.', 'https://t3.ftcdn.net/jpg/05/58/12/14/240_F_558121487_IAcxg4FyPz4Ex3nopmPzcuO2gouGo4oQ.jpg');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (9, 'Vengerberg', 'Vengerberg, the jewel of Aedirn, is a city of contrasts, where tradition and modernity collide amidst the winding canals and towering spires. As the seat of elven culture and craftsmanship, Vengerberg boasts exquisite architecture, intricate gardens, and bustling marketplaces filled with exotic wares. Yet, beneath its elegant façade, the city grapples with social unrest, political intrigue, and the lingering scars of past conflicts between humans and elves.', 'https://t3.ftcdn.net/jpg/05/62/80/54/240_F_562805422_hX1C4hZCawcow3wlXHl4RXKNovhaqWPu.jpg');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (10, 'Haern Caduch', 'Haern Caduch, known as the \"Witcher\'s Rest,\" is a remote village nestled deep within the forests of Brokilon. Surrounded by towering trees and mist-shrouded glades, Haern Caduch offers sanctuary to weary travelers and witchers seeking respite from their perilous journeys. Despite its tranquil appearance, the village holds dark secrets and ancient guardians lurking within the depths of the forest, making it a place of both refuge and danger.', 'https://i.imgur.com/vNqXPE5.png');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (11, 'Beauclair', 'Beauclair, the dazzling capital of Toussaint, is a city of unparalleled beauty and grandeur, renowned for its vineyards, chivalry, and vibrant festivals. Nestled amidst rolling hills and azure seas, Beauclair exudes a sense of opulence and romance, with its opulent palaces, cobbled streets, and lavish gardens. Yet, beneath its idyllic surface, the city conceals intrigue, rivalries, and the shadows of past conflicts waiting to resurface.', 'https://assetsio.reedpopcdn.com/-1449591567340.jpg?width=690&quality=75&format=jpg&auto=webp');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (12, 'Glenmore', 'Glenmore, a remote village nestled in the shadow of the Blue Mountains, is a haven for those seeking solace amidst the untamed wilderness of Kaedwen. Surrounded by lush forests and rugged terrain, Glenmore offers a glimpse into a simpler way of life, where the bonds of community and kinship run deep. Yet, beyond its tranquil exterior, the village faces threats from monsters, bandits, and the ever-looming specter of war.', 'https://t3.ftcdn.net/jpg/05/64/26/20/240_F_564262041_cWgPZEhj5duRr1gbEH6ec2CzcI89Ssz2.jpg');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (13, 'Doldeth', 'Doldeth, a fortified outpost on the borders of Redania and Kaedwen, stands as a bulwark against the encroaching dangers of the Northern Realms. Perched atop a windswept cliff overlooking the valley below, Doldeth serves as a strategic stronghold, guarding vital trade routes and providing refuge to travelers and soldiers alike. Despite its rugged beauty, the outpost is no stranger to conflict, its walls bearing the scars of countless battles fought in the name of honor and survival.', 'https://t3.ftcdn.net/jpg/03/74/18/66/240_F_374186666_kzyAyZcikLhnND5Zkruwwjeu4V3xQoI0.jpg');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (14, 'Loc Ichaer', 'Loc Ichaer, known as the \"Lake of Echoes,\" is a mysterious and secluded oasis hidden amidst the desolate landscapes of Kaedwen. Surrounded by towering cliffs and ancient ruins, the lake exudes an eerie tranquility, its waters said to hold strange powers and whispered secrets. Legends speak of lost treasures and spectral guardians haunting its shores, drawing adventurers and seekers of forbidden knowledge to unravel its mysteries.', 'https://generations.krea.ai/images/d4b71a08-0937-4751-a598-b67cc0bb8622.webp');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (15, 'Gorthur Guaed', 'Gorthur Guaed, also known as the \"Valley of the Dead,\" is a foreboding and desolate region shrouded in myth and legend. Located deep within the wilderness of Skellige, the valley is said to be cursed, its barren landscape haunted by restless spirits and ancient curses. Only the bravest or most foolhardy dare to venture into its depths, drawn by tales of forgotten tombs, lost relics, and the promise of untold riches amidst the ruins of civilizations long gone.', 'https://i.imgur.com/xpQTA0x.png');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (16, 'Dhuwod', 'Dhuwod, a remote hamlet nestled in the shadow of the Mahakam Mountains, is a bastion of dwarven culture and craftsmanship. Surrounded by rugged peaks and winding rivers, Dhuwod serves as a hub for trade and commerce, its bustling forges and bustling marketplaces attracting merchants and travelers from far and wide. Yet, amidst the clang of hammers and the roar of furnaces, the village holds secrets of its own, from ancient tunnels and hidden treasures to long-standing grudges and rivalries.', 'https://t3.ftcdn.net/jpg/06/47/91/80/240_F_647918075_Dy9zabywMb7WPvqIIdfXoW3c3NhncI5s.jpg');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (17, 'Stygga', 'Stygga, the \"City of Shadows,\" is a sprawling metropolis shrouded in mystery and intrigue, located deep within the heart of Nilfgaard. Surrounded by towering walls and guarded by the Emperor\'s elite, Stygga serves as the seat of power for the Nilfgaardian Empire, its labyrinthine streets and opulent palaces hiding secrets known only to the highest echelons of society. Yet, beneath its veneer of grandeur, the city conceals a dark underbelly of crime, corruption, and political machinations, where loyalty is fleeting and betrayal lurks around every corner.', 'https://cdna.artstation.com/p/assets/images/images/044/480/146/medium/kris-teper-stygga-castle-final-large.jpg?1640123601');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (18, 'Ard Modron', 'Ard Modron, a remote fortress perched atop a windswept plateau in the foothills of the Blue Mountains, is a bastion of Nilfgaardian military might and imperial ambition. Surrounded by rugged terrain and fortified walls, Ard Modron stands as a symbol of Nilfgaard\'s expansionist aspirations, its formidable defenses deterring would-be invaders and dissenters alike. Yet, amidst the harsh landscape and martial discipline, the fortress harbors secrets and whispers of rebellion, waiting to be unearthed by those brave or foolish enough to defy the Empire\'s iron grip.', 'https://i.imgur.com/k0IE76U.png');
INSERT INTO `location` (`id`, `name`, `description`, `image_url`) VALUES (19, 'Behelt Nar', 'Behelt Nar, known as the \"Witch\'s Folly,\" is a remote island fortress shrouded in mist and legend, located off the coast of Cidaris. Surrounded by treacherous waters and jagged cliffs, Behelt Nar has long been rumored to be cursed, its crumbling ruins and forgotten halls haunted by vengeful spirits and ancient sorceries. Yet, despite its foreboding reputation, the fortress remains a tantalizing enigma, drawing adventurers and scholars alike to unravel its dark history and unlock the secrets hidden within its walls.', 'https://i.imgur.com/AS4d7EJ.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `player`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `player` (`id`, `name`, `description`, `current_health`, `max_health`, `experience_level`, `image_url`, `location_id`, `user_id`) VALUES (1, 'Isabella', 'Gryphon Academy graduate', 20, 20, 3, 'https://www.gamespot.com/a/uploads/original/1179/11799911/2758965-witcher3.jpg', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `weapon`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `weapon` (`id`, `name`, `damage`, `description`, `tier`, `player_id`) VALUES (1, 'silver sword', 5, 'sword for slicing through monster flesh', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `armor`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `armor` (`id`, `name`, `defense`, `description`, `tier`, `player_id`) VALUES (1, 'leather boots', 1, 'worn leather boots from witcher training', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `monster`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (1, 'Ekimmara', 'Deep in the heart of the dark and tangled forests, where the moonlight struggles to penetrate the dense canopy, lurks the Ekimmara. Once a proud and noble creature, cursed by a tragic past, it now roams the woods in search of blood to sustain its cursed existence. Legends speak of its ferocity and unmatched speed, preying upon unsuspecting travelers who dare to venture into its domain.', 12, 7, 1, 'https://64.media.tumblr.com/d42f61f2edc8ad906bc47e6d85c86c9f/tumblr_oxbl75ESDt1sn3ne4o1_500.jpg', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (2, 'Rotfiend', 'Amidst the decaying ruins of forgotten villages, where the stench of death hangs heavy in the air, the Rotfiend emerges from its putrid lair. A grotesque amalgamation of flesh and decay, fueled by an insatiable hunger for flesh, it roams the desolate landscape in search of prey. With its rancid breath and razor-sharp claws, it strikes fear into the hearts of even the most seasoned Witchers.', 11, 7, 1, 'https://thewitcher3.wiki.fextralife.com/file/The-Witcher-3/rotfiend.jpg', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (3, 'Harpy', 'Atop towering cliffs and rocky outcrops overlooking the restless sea, the Harpies make their nest. With their piercing cries and razor-sharp talons, they swoop down upon unsuspecting sailors and travelers who dare to pass too close to their domain. Legends speak of their hypnotic beauty, luring sailors to their doom with promises of forbidden treasures hidden within their nests.', 12, 7, 1, 'https://cdnb.artstation.com/p/assets/images/images/004/985/527/medium/bartlomiej-gawel-celaeno-harpy.jpg?1487675385', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (4, 'Manticore', 'In the arid deserts and barren wastelands, where the scorching sun beats down relentlessly, the Manticore reigns supreme. With its lion-like body, bat-like wings, and venomous tail, it is the apex predator of the desert. Tales are told of its cunning and intelligence, ambushing travelers and caravans with deadly precision before feasting upon their remains.', 14, 8, 2, 'https://as2.ftcdn.net/v2/jpg/06/42/23/57/1000_F_642235722_8trsP2SmXiigFX9pDZ9MzfewgTqP0HQN.jpg', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (5, 'Griffin', 'High above the rugged peaks and snow-capped mountains, the Griffin soars majestically through the crisp mountain air. With its keen eyesight and powerful talons, it commands the skies, preying upon mountain goats and other unsuspecting creatures that wander too close to its nest. Tales speak of its pride and nobility, challenging even the bravest of Witchers to face it in combat.', 15, 8, 2, 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b1dc4323-c323-44d3-88cb-57b17f63c48b/d7zm6ov-168b3404-4b9f-4a81-a237-ab24676f5d92.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2IxZGM0MzIzLWMzMjMtNDRkMy04OGNiLTU3YjE3ZjYzYzQ4YlwvZDd6bTZvdi0xNjhiMzQwNC00YjlmLTRhODEtYTIzNy1hYjI0Njc2ZjVkOTIuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.6Mx851_o34JYJWvpir_h3kCUcp2GQFwfVizDhlH9Jtc', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (6, 'Wyvern', 'A formidable creature with the body of a dragon and the wings of a bat, the Wyvern is a fearsome predator that terrorizes the skies and strikes fear into the hearts of all who encounter it. With its razor-sharp claws, venomous tail, and powerful jaws, the Wyvern is a relentless hunter, capable of swooping down from the heavens to snatch its prey with deadly precision. Its thick scales provide formidable protection against both weapons and magic, making it a challenging opponent for even the most seasoned witchers.', 15, 8, 2, 'https://cdna.artstation.com/p/assets/images/images/010/289/356/medium/tony-timperi-royalmoa-1080-def.jpg?1523623772', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (7, 'Fiend', 'The Fiend is a monstrous beast that roams the wilds with an insatiable hunger for flesh and blood. Towering over its prey with muscular limbs and a grotesque visage, the Fiend possesses incredible strength and endurance, capable of shrugging off even the most devastating blows. Its horns, tipped with deadly spikes, are used to impale its victims, while its deafening roar sends shivers down the spines of all who hear it. Only the bravest and most skilled witchers dare to face this fearsome creature in battle.', 16, 8, 2, 'https://images.nightcafe.studio/jobs/wl61VUjfyNd2ocvkwN2P/wl61VUjfyNd2ocvkwN2P--2--phjgt_6x.jpg?tr=w-1200,c-at_max', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (8, 'Weavess', 'The Weavess is a cunning and malevolent creature that lurks in the shadows, weaving its dark magic to ensnare unsuspecting victims in its web of deceit. With its twisted form and hypnotic gaze, the Weavess preys upon the weak and vulnerable, drawing them into its clutches with promises of power and fortune. Once ensnared, its victims are subjected to unspeakable horrors, their souls drained to fuel the Weavess\'s insatiable thirst for power. Only those with the strength of will and the courage to resist its charms can hope to escape its grasp.', 15, 8, 2, 'https://pbs.twimg.com/media/Cgk5IWBWkAAjLsm?format=jpg&name=900x900', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (9, 'Nightwraith', 'The Nightwraith is a spectral entity born from the lingering anguish and despair of the dead. Haunting graveyards and abandoned battlefields, the Nightwraith is a vengeful spirit that seeks retribution against the living for the injustices suffered in life. With its ethereal form and piercing wail, the Nightwraith strikes fear into the hearts of mortals, draining their life force to sustain its own twisted existence. Only the most skilled witchers, armed with silver blades and ancient incantations, can hope to banish this malevolent specter from the mortal realm.', 15, 8, 2, 'https://preview.redd.it/hmyy3ca7hpg51.jpg?width=960&crop=smart&auto=webp&s=473512c289acab6212d7b49d903ec2f6c3449094', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (10, 'Water Hag', 'The Water Hag is a grotesque creature that dwells in the murky depths of swamps and marshes, lurking beneath the surface to ambush unsuspecting travelers and adventurers. With its bloated form and slimy skin, the Water Hag blends seamlessly into its aquatic environment, making it a deadly adversary for those who dare to trespass into its domain. Armed with sharp claws and jagged teeth, the Water Hag drags its victims beneath the surface to drown them in the icy embrace of the watery depths.', 15, 8, 2, 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/88d5b237-3085-43b6-a9a4-f0c8a554ccd9/dfrijgt-a28eacf0-fbf2-4f02-bec9-e1ee06736c0d.jpg/v1/fill/w_1192,h_670,q_70,strp/the_witcher_3___water_hag_by_mrodex_dfrijgt-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIwIiwicGF0aCI6IlwvZlwvODhkNWIyMzctMzA4NS00M2I2LWE5YTQtZjBjOGE1NTRjY2Q5XC9kZnJpamd0LWEyOGVhY2YwLWZiZjItNGYwMi1iZWM5LWUxZWUwNjczNmMwZC5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.s4fxJ_eoT_au8LHOqgxLeHQ4FB_BiI0G8vXdiCHE5Vg', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (11, 'Werewolf', 'The Werewolf is a fearsome predator that prowls the night with feral grace and savage strength. Transformed by the light of the full moon, the Werewolf is a formidable adversary that hunts its prey with relentless determination. With its razor-sharp claws and powerful jaws, the Werewolf tears through flesh and bone with ease, leaving a trail of devastation in its wake. Only the most skilled witchers, armed with silver swords and potent potions, can hope to stand against this monstrous beast and emerge victorious.', 16, 8, 2, 'https://static1.cbrimages.com/wordpress/wp-content/uploads/2021/08/Gwent-Werewolf-Witcher-Header.jpg?q=50&fit=contain&w=1140&h=&dpr=1.5', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (12, 'Grave Hag', 'The Grave Hag is a twisted creature that lurks in the shadows of ancient burial grounds and forgotten crypts, feeding on the life force of the dead to sustain its own unnatural existence. With its withered form and sunken eyes, the Grave Hag exudes an aura of death and decay, drawing upon the dark energies of the underworld to wield powerful necromantic spells. Its skeletal minions, risen from the grave to serve their mistress, obey its every command, making it a formidable foe for any who dare to disturb its unholy domain.', 15, 8, 2, 'https://images.nightcafe.studio/jobs/DRWIkkAnU9TiIGqODAr0/DRWIkkAnU9TiIGqODAr0--4--76w9j.jpg?tr=w-1200,c-at_max', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (13, 'Whispess', 'The Whispess is a malevolent spirit that haunts the mist-shrouded forests and desolate moors of the Northern Realms, luring unsuspecting travelers to their doom with its haunting melodies and otherworldly beauty. With its ethereal form and hypnotic voice, the Whispess enchants its victims, leading them deeper into the wilderness with promises of riches and forbidden pleasures. Once ensnared, its victims are consumed by madness and despair, their souls trapped forever in the dark embrace of the Whispess\'s song.', 15, 8, 2, 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a8d7d0d1-8a75-4fe5-92e3-82bcb394eaab/d7zsnit-9278120b-01e5-4ec8-8e17-a50789113140.jpg/v1/fit/w_667,h_1024,q_70,strp/whispess_lady_of_the_woods__witcher_3_cosplay__by_elenasamko_d7zsnit-375w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAyNCIsInBhdGgiOiJcL2ZcL2E4ZDdkMGQxLThhNzUtNGZlNS05MmUzLTgyYmNiMzk0ZWFhYlwvZDd6c25pdC05Mjc4MTIwYi0wMWU1LTRlYzgtOGUxNy1hNTA3ODkxMTMxNDAuanBnIiwid2lkdGgiOiI8PTY2NyJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.uWZfxmnhndnlPJhWfyee2XIbtU3DnrfzbMlvUQ-J7Fk', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (14, 'Striga', 'The Striga is a cursed creature, trapped between the worlds of the living and the dead, doomed to wander the night in search of blood to sate its eternal hunger. With its twisted form and insatiable appetite, the Striga is a relentless hunter, capable of tearing through flesh and bone with its razor-sharp claws and fangs. Cursed by dark magic and bound to its wretched fate, the Striga is a tragic figure, driven by instinct and madness to commit unspeakable acts of violence against all who cross its path.', 18, 9, 3, 'https://media.craiyon.com/2023-10-18/20bca2c6ea30413b89016ddcd9fa11c4.webp', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (15, 'Brewess', 'The Brewess is a vile and repulsive creature that dwells in the depths of fetid swamps and cursed bogs, brewing foul concoctions from the bones and blood of its victims to fuel its dark rituals. With its bloated form and rancid breath, the Brewess exudes an aura of decay and corruption, spreading pestilence and disease wherever it treads. Armed with dark magic and vile poisons, the Brewess commands legions of twisted minions, from venomous snakes to rotting corpses, to do its bidding and enforce its will upon the land.', 19, 9, 3, 'https://pbs.twimg.com/media/C23_kq-UkAA7iK0?format=jpg&name=large', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (16, 'Leshen', 'The Leshen is a primal force of nature, an ancient guardian of the wilderness that stands vigil over the untamed forests and forgotten groves of the world. With its towering antlers and gnarled limbs, the Leshen commands the very essence of the forest itself, bending trees and vines to its will to ensnare and entrap its prey. Protected by an aura of ancient magic and surrounded by loyal minions, the Leshen is a formidable adversary for any who dare to trespass into its domain, punishing those who would seek to exploit or desecrate the sacred balance of nature.', 19, 9, 3, 'https://pbs.twimg.com/media/CKsRcxqUcAMvxZd?format=png&name=medium', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (17, 'Bruxa', 'The Bruxa is a seductive and deadly creature that prowls the night with grace and elegance, luring unsuspecting victims to their doom with promises of passion and ecstasy. With its porcelain skin and piercing gaze, the Bruxa exudes an aura of otherworldly beauty, drawing mortals into its embrace with whispers of forbidden desires. Once ensnared, its victims are drained of their life force, their blood fueling the Bruxa\'s dark hunger and insatiable thirst for power.', 20, 9, 3, 'https://i.imgur.com/Cq7pMW7.jpeg', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (18, 'Glustyworp', 'The Glustyworp is a monstrous aberration that lurks in the depths of fetid swamps and stagnant marshes, emerging only to feast upon the unwary and the unfortunate. With its bloated form and gaping maw, the Glustyworp devours everything in its path, from hapless travelers to entire villages, leaving nothing but destruction and despair in its wake. Protected by thick layers of slime and mucus, the Glustyworp is virtually invulnerable to conventional weapons and magic, making it a near-impossible foe for all but the most skilled witchers.', 18, 9, 3, 'https://static.wikia.nocookie.net/witcher/images/e/ec/Gwent_cardart_monsters_glustyworp.png/revision/latest?cb=20181031221626', NULL);
INSERT INTO `monster` (`id`, `name`, `description`, `health`, `damage`, `experience_reward`, `image_url`, `player_id`) VALUES (19, 'Yghern', 'The Yghern is a grotesque monstrosity that prowls the depths of forgotten caverns and subterranean tunnels, emerging only to wreak havoc upon the surface world with its immense size and savage strength. With its massive claws and armored carapace, the Yghern is a terrifying sight to behold, capable of tearing through solid rock and crushing its enemies beneath its colossal bulk. Protected by layers of thick chitin and armed with razor-sharp mandibles, the Yghern is a force to be reckoned with, posing a dire threat to all who would dare to challenge its dominance.', 18, 9, 3, 'https://preview.redd.it/tml9lj50pow31.jpg?width=290&format=pjpg&auto=webp&s=0e50c669a739fcef9e54493239a2ea044d68f271', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `monster_location`
-- -----------------------------------------------------
START TRANSACTION;
USE `witcherdb`;
INSERT INTO `monster_location` (`monster_id`, `location_id`) VALUES (1, 1);
INSERT INTO `monster_location` (`monster_id`, `location_id`) VALUES (2, 2);
INSERT INTO `monster_location` (`monster_id`, `location_id`) VALUES (3, 3);
INSERT INTO `monster_location` (`monster_id`, `location_id`) VALUES (4, 4);
INSERT INTO `monster_location` (`monster_id`, `location_id`) VALUES (5, 5);

COMMIT;

