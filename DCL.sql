-- Create roles for each user type
CREATE ROLE customer;
CREATE ROLE waiter;
CREATE ROLE cooker;
CREATE ROLE manager;

-- Grant permissions to Customer role
GRANT SELECT, INSERT ON Reservations TO customer; -- Creating, canceling, viewing reservations
GRANT SELECT ON Tables TO customer; -- Viewing tables
GRANT SELECT, INSERT ON Orders TO customer; -- Placing orders
GRANT SELECT, INSERT ON Payments TO customer; -- Making payments
GRANT INSERT ON Reviews TO customer; -- Leaving feedback
GRANT INSERT ON Notifications TO customer; -- For actions like calling waiter
GRANT SELECT ON Menu TO customer; -- To view menu for placing orders

-- Grant permissions to Waitstaff (waiter) role
GRANT SELECT,UPDATE ON Tables TO waiter; -- Viewing assigned tables
GRANT SELECT ON Orders TO waiter; -- Viewing orders
GRANT SELECT ON Payments TO waiter; -- Viewing payments
GRANT SELECT, UPDATE ON Reservations TO waiter; -- To view and update reservation details (e.g., order status)

-- Grant permissions to Kitchen Team (cooker) role
GRANT SELECT ON Orders TO cooker; -- Viewing order notes
GRANT SELECT ON Reservations TO cooker; -- To access customer preferences/allergies via reservation_id
GRANT SELECT ON Menu TO cooker; -- To check allergens in menu items

-- Grant permissions to Admin (manager) role
GRANT ALL PRIVILEGES ON Customers TO manager; -- Managing users
GRANT ALL PRIVILEGES ON Staff TO manager; -- Managing users
GRANT ALL PRIVILEGES ON Roles TO manager; -- Managing system settings
GRANT ALL PRIVILEGES ON Tables TO manager; -- Managing tables
GRANT ALL PRIVILEGES ON Menu TO manager; -- Managing menus
GRANT ALL PRIVILEGES ON Categories TO manager; -- Managing menus
GRANT ALL PRIVILEGES ON Reviews TO manager; -- Analyzing feedback
GRANT ALL PRIVILEGES ON Reservations TO manager; -- Managing orders
GRANT ALL PRIVILEGES ON Orders TO manager; -- Managing orders
GRANT ALL PRIVILEGES ON Payments TO manager; -- Managing payments
GRANT ALL PRIVILEGES ON Notifications TO manager; -- Managing notifications


-- Assign Roles for Customers 
CREATE USER ahmet_yilmaz1 WITH PASSWORD 'ahmetyilmaz1';
GRANT customer TO ahmet_yilmaz1;

CREATE USER ayse_demir2 WITH PASSWORD 'aysedemir2';
GRANT customer TO ayse_demir2;

CREATE USER mehmet_kaya3 WITH PASSWORD 'mehmetkaya3';
GRANT customer TO mehmet_kaya3;

CREATE USER fatma_celik4 WITH PASSWORD 'fatmacelik4';
GRANT customer TO fatma_celik4;

CREATE USER mustafa_ozturk5 WITH PASSWORD 'mustafaozturk5';
GRANT customer TO mustafa_ozturk5;

CREATE USER zeynep_aydin6 WITH PASSWORD 'zeynepaydin6';
GRANT customer TO zeynep_aydin6;

CREATE USER ali_sahin7 WITH PASSWORD 'alisahin7';
GRANT customer TO ali_sahin7;

CREATE USER emine_koc8 WITH PASSWORD 'eminekoc8';
GRANT customer TO emine_koc8;

CREATE USER hasan_er9 WITH PASSWORD 'hasaner9';
GRANT customer TO hasan_er9;

CREATE USER hulya_yildiz10 WITH PASSWORD 'hulyayildiz10';
GRANT customer TO hulya_yildiz10;

CREATE USER ibrahim_arslan11 WITH PASSWORD 'ibrahimarslan11';
GRANT customer TO ibrahim_arslan11;

CREATE USER esra_boz12 WITH PASSWORD 'esraboz12';
GRANT customer TO esra_boz12;

CREATE USER kemal_gunes13 WITH PASSWORD 'kemalgunes13';
GRANT customer TO kemal_gunes13;

CREATE USER asli_tekin14 WITH PASSWORD 'aslitekin14';
GRANT customer TO asli_tekin14;

CREATE USER murat_polat15 WITH PASSWORD 'muratpolat15';
GRANT customer TO murat_polat15;

CREATE USER selin_aksoy16 WITH PASSWORD 'selinaksoy16';
GRANT customer TO selin_aksoy16;

CREATE USER omer_korkmaz17 WITH PASSWORD 'omerkorkmaz17';
GRANT customer TO omer_korkmaz17;

CREATE USER derya_ucar18 WITH PASSWORD 'deryaucar18';
GRANT customer TO derya_ucar18;

CREATE USER can_eren19 WITH PASSWORD 'caneren19';
GRANT customer TO can_eren19;

CREATE USER buse_yalcin20 WITH PASSWORD 'buseyalcin20';
GRANT customer TO buse_yalcin20;

CREATE USER efe_toprak21 WITH PASSWORD 'efetoprak21';
GRANT customer TO efe_toprak21;

CREATE USER ceren_sonmez22 WITH PASSWORD 'cerensonmez22';
GRANT customer TO ceren_sonmez22;

CREATE USER burak_karaca23 WITH PASSWORD 'burakkaraca23';
GRANT customer TO burak_karaca23;

CREATE USER melis_turan24 WITH PASSWORD 'melisturan24';
GRANT customer TO melis_turan24;

CREATE USER okan_cetin25 WITH PASSWORD 'okancetin25';
GRANT customer TO okan_cetin25;

CREATE USER pinar_yaman26 WITH PASSWORD 'pinaryaman26';
GRANT customer TO pinar_yaman26;

CREATE USER tolga_bulut27 WITH PASSWORD 'tolgabulut27';
GRANT customer TO tolga_bulut27;

CREATE USER gizem_ozkan28 WITH PASSWORD 'gizemozkan28';
GRANT customer TO gizem_ozkan28;

CREATE USER umut_kara29 WITH PASSWORD 'umutkara29';
GRANT customer TO umut_kara29;

CREATE USER seda_guler30 WITH PASSWORD 'sedaguler30';
GRANT customer TO seda_guler30;

CREATE USER berk_deniz31 WITH PASSWORD 'berkdeniz31';
GRANT customer TO berk_deniz31;

CREATE USER elif_sari32 WITH PASSWORD 'elifsari32';
GRANT customer TO elif_sari32;

CREATE USER yusuf_acar33 WITH PASSWORD 'yusufacar33';
GRANT customer TO yusuf_acar33;

CREATE USER ece_kir34 WITH PASSWORD 'ecekir34';
GRANT customer TO ece_kir34;

CREATE USER arda_soyadi35 WITH PASSWORD 'ardasoyadi35';
GRANT customer TO arda_soyadi35;

CREATE USER leyla_yurt36 WITH PASSWORD 'leylayurt36';
GRANT customer TO leyla_yurt36;

CREATE USER kaan_duman37 WITH PASSWORD 'kaanduman37';
GRANT customer TO kaan_duman37;

CREATE USER defne_aslan38 WITH PASSWORD 'defneaslan38';
GRANT customer TO defne_aslan38;

CREATE USER baris_kocaman39 WITH PASSWORD 'bariskocaman39';
GRANT customer TO baris_kocaman39;

CREATE USER selen_ergen40 WITH PASSWORD 'selenergen40';
GRANT customer TO selen_ergen40;

CREATE USER deniz_kaplan41 WITH PASSWORD 'denizkaplan41';
GRANT customer TO deniz_kaplan41;

CREATE USER merve_tunc42 WITH PASSWORD 'mervetunc42';
GRANT customer TO merve_tunc42;

CREATE USER emir_gunduz43 WITH PASSWORD 'emirgunduz43';
GRANT customer TO emir_gunduz43;

CREATE USER cem_bilgin44 WITH PASSWORD 'cembilgin44';
GRANT customer TO cem_bilgin44;

CREATE USER naber_naber45 WITH PASSWORD 'nabernaber45';
GRANT customer TO naber_naber45;

CREATE USER nazli_oz46 WITH PASSWORD 'nazlioz46';
GRANT customer TO nazli_oz46;

CREATE USER onur_keser47 WITH PASSWORD 'onurkeser47';
GRANT customer TO onur_keser47;

CREATE USER eda_cinar48 WITH PASSWORD 'edacinar48';
GRANT customer TO eda_cinar48;

CREATE USER kerem_yavas49 WITH PASSWORD 'keremyavas49';
GRANT customer TO kerem_yavas49;

CREATE USER ada_gokce50 WITH PASSWORD 'adagokce50';
GRANT customer TO ada_gokce50;

-- Assign role for staff
CREATE USER levent_kara1 WITH PASSWORD 'leventkara1';
GRANT manager TO levent_kara1; 

CREATE USER aylin_vural2 WITH PASSWORD 'aylinvural2';
GRANT manager TO aylin_vural2; 

CREATE USER sevgi_ates3 WITH PASSWORD 'sevgiates3';
GRANT waiter TO sevgi_ates3;

CREATE USER fatih_bahce4 WITH PASSWORD 'fatihbahce4';
GRANT waiter TO fatih_bahce4; 

CREATE USER gul_cicek5 WITH PASSWORD 'gulcicek5';
GRANT waiter TO gul_cicek5; 

CREATE USER hakan_dag6 WITH PASSWORD 'hakandag6';
GRANT waiter TO hakan_dag6; 

CREATE USER nur_ege7 WITH PASSWORD 'nurege7';
GRANT waiter TO nur_ege7; 

CREATE USER salih_fidan8 WITH PASSWORD 'salihfidan8';
GRANT waiter TO salih_fidan8; 

CREATE USER zehra_gok9 WITH PASSWORD 'zehragok9';
GRANT waiter TO zehra_gok9; 

CREATE USER bulent_hava10 WITH PASSWORD 'bulenthava10';
GRANT cooker TO bulent_hava10; 

CREATE USER cemile_isik11 WITH PASSWORD 'cemileisik11';
GRANT cooker TO cemile_isik11; 

CREATE USER dogan_jale12 WITH PASSWORD 'doganjale12';
GRANT cooker TO dogan_jale12; 

CREATE USER ebru_kale13 WITH PASSWORD 'ebrukale13';
GRANT cooker TO ebru_kale13; 

CREATE USER ferhat_lale14 WITH PASSWORD 'ferhatlale14';
GRANT cooker TO ferhat_lale14; 
