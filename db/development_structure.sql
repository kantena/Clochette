CREATE TABLE "clients" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nom" varchar(255), "description" text, "infos_projets" text, "created_at" datetime, "updated_at" datetime, "client_ce_mois?" boolean);
CREATE TABLE "facturations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nb_heures_a_facturer" integer, "etat_valide?" boolean, "facturation_envoyee?" boolean, "liste_dev_attente_validation" text, "date_archivage" date, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "travail_developpeurs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "client" varchar(255), "nom_developpeur" varchar(255), "nb_jours_travail" integer, "created_at" datetime, "updated_at" datetime, "validation_nb_jours_travail?" boolean);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20100713142223');

INSERT INTO schema_migrations (version) VALUES ('20100713155943');

INSERT INTO schema_migrations (version) VALUES ('20100715074352');

INSERT INTO schema_migrations (version) VALUES ('20100715075711');

INSERT INTO schema_migrations (version) VALUES ('20100715082342');

INSERT INTO schema_migrations (version) VALUES ('20100718091406');

INSERT INTO schema_migrations (version) VALUES ('20100718093332');

INSERT INTO schema_migrations (version) VALUES ('20100718094107');

INSERT INTO schema_migrations (version) VALUES ('20100718094643');