load("PISA_STU_2018.rda")
# Turkiye icin degiskenlik gostermeyen ve hepsi eksik veri olan
#  degiskenler veri setinden
# cikartilarak yerinden isimlendirilmemistir.

# PARED i ceviremedim
library(dplyr)
library(labelled)
library(sjlabelled)
library(snakecase)

# tamamen eksik veri olan degiskenler
# Turkiye icin degiskenlik gostermeyen degiskenler
PISA_OGR_2018_nv <- sapply(PISA_STU_2018,table)
PISA_OGR_2018_nv <- unlist(lapply(PISA_OGR_2018_nv, length))
names(PISA_OGR_2018_nv[PISA_OGR_2018_nv==0 |PISA_OGR_2018_nv==1 ])


PISA_OGR_2018 <-  PISA_STU_2018 %>%
  dplyr::select(-names(PISA_OGR_2018_nv[PISA_OGR_2018_nv==0 |PISA_OGR_2018_nv==1]))

PISA_OGR_2018 <- PISA_OGR_2018 %>%
  dplyr::rename(OKULID = CNTSCHID)%>%
  dplyr::rename(OGRENCIID = CNTSTUID)%>%
  dplyr::rename(OKUL_TUR = STRATUM)%>%
  dplyr::rename(KITAPCIK = BOOKID) %>%
  dplyr::rename(SINIF = ST001D01T) %>%
  dplyr::rename(DOGUMAY = ST003D02T) %>%
  dplyr::rename(CINSIYET = ST004D01T) %>%
  dplyr::rename(ANNE_OKUL = ST005Q01TA) %>%
  dplyr::rename(ANNE_LISANSUSTU = ST006Q01TA) %>%
  dplyr::rename(ANNE_LISANS= ST006Q02TA) %>%
  dplyr::rename(ANNE_ONLISANS = ST006Q03TA) %>%
  dplyr::rename(BABA_OKUL = ST007Q01TA) %>%
  dplyr::rename(BABA_LISANSUSTU = ST008Q01TA) %>%
  dplyr::rename(BABA_LISANS= ST008Q02TA) %>%
  dplyr::rename(BABA_ONLISANS = ST008Q03TA)%>%
  dplyr::rename(OLANAK_MASA = ST011Q01TA) %>%
  dplyr::rename(OLANAK_ODA= ST011Q02TA) %>%
  dplyr::rename(OLANAK_SESSIZYER = ST011Q03TA)%>%
  dplyr::rename(OLANAK_BILGISAYAR = ST011Q04TA)%>%
  dplyr::rename(OLANAK_YAZILIM = ST011Q05TA)%>%
  dplyr::rename(OLANAK_INTERNET = ST011Q06TA)%>%
  dplyr::rename(OLANAK_KLASIKKITAP = ST011Q07TA) %>%
  dplyr::rename(OLANAK_SIIRKITAP = ST011Q08TA)%>%
  dplyr::rename(OLANAK_SANATESER = ST011Q09TA)%>%
  dplyr::rename(OLANAK_KAYNAKKITAP = ST011Q10TA)%>%
  dplyr::rename(OLANAK_TEKNIKKITAP = ST011Q11TA)%>%
  dplyr::rename(OLANAK_SOZLUK = ST011Q12TA)%>%
  dplyr::rename(OLANAK_SANATKITAP = ST011Q16NA)%>%
  dplyr::rename(OLANAK_KLIMA = ST011D17TA)%>%
  dplyr::rename(OLANAK_TVABONE = ST011D18TA)%>%
  dplyr::rename(OLANAK_TATIL = ST011D19TA) %>%
  dplyr::rename(MIKTAR_TV = ST012Q01TA) %>%
  dplyr::rename(MIKTAR_ARABA = ST012Q02TA) %>%
  dplyr::rename(MIKTAR_BANYO = ST012Q03TA) %>%
  dplyr::rename(MIKTAR_AKILLITEL = ST012Q05NA) %>%
  dplyr::rename(MIKTAR_BILGISAYAR = ST012Q06NA) %>%
  dplyr::rename(MIKTAR_TABLET= ST012Q07NA) %>%
  dplyr::rename(MIKTAR_EKITAPOKUYUCU = ST012Q08NA) %>%
  dplyr::rename(MIKTAR_MUZIKALET = ST012Q09NA) %>%
  dplyr::rename(KITAPSAYISI = ST013Q01TA) %>%
  dplyr::rename(DOGUMULKE_OGR = ST019AQ01T) %>%
  dplyr::rename(DOGUMULKE_ANNE = ST019BQ01T) %>%
  dplyr::rename(DOGUMULKE_BABA = ST019CQ01T) %>%
  dplyr::rename(TR_GELIS_YAS = ST021Q01TA)%>%
  dplyr::rename(BASLAMA_YAS_OKULONCESI= ST125Q01NA)%>%
  dplyr::rename(BASLAMA_YAS_ILKOKUL= ST126Q01TA)%>%
  dplyr::rename(SINIFTEKRARI_ILKOKUL = ST127Q01TA)%>%
  dplyr::rename(SINIFTEKRARI_ORTAOKUL= ST127Q02TA)%>%
  dplyr::rename(SINIFTEKRARI_LISE= ST127Q03TA)%>%
  dplyr::rename(EV_KONUSULAN_DIL= ST022Q01TA)%>%
  dplyr::rename(ANNE_KONUSULAN_DIL= ST023Q01TA)%>%
  dplyr::rename(BABA_KONUSULAN_DIL= ST023Q02TA)%>%
  dplyr::rename(KARDES_KONUSULAN_DIL= ST023Q03TA)%>%
  dplyr::rename(YARKADAS_KONUSULAN_DIL= ST023Q04TA)%>%
  dplyr::rename(OARKADAS_KONUSULAN_DIL= ST023Q05TA) %>%
  dplyr::rename(Anne_Egitim = MISCED) %>%
  dplyr::rename(Baba_Egitim = FISCED) %>%
  dplyr::rename(Ebeveyn_egitimi= HISCED) %>%
  dplyr::rename(Anne_Egitim_D = MISCED_D) %>%
  dplyr::rename(Baba_Egitim_D = FISCED_D) %>%
  dplyr::rename(Ebeveyn_egitimi_D = HISCED_D) %>%
  dplyr::rename(Anne_DIL = LANGMOTHER) %>%
  dplyr::rename(Baba_DIL = LANGFATHER) %>%
  dplyr::rename(Kardes_DIL = LANGSIBLINGS) %>%
  dplyr::rename(Arkadas_DIL = LANGFRIEND) %>%
  dplyr::rename(O_Arkadas_DIL = LANGSCHMATES)  %>%
  dplyr::rename(Gocmenlik = IMMIG)  %>%
  dplyr::rename(Okuloncesi_yil = DURECEC) %>%
  dplyr::rename(Sinif_tekrari = REPEAT) %>%
  dplyr::rename(Beklenen_Mesleki_Statu = BSMJ)  %>%
  dplyr::rename(Ogrenme_zamani_mat = MMINS)  %>%
  dplyr::rename(Ogrenme_zamani_turkce = LMINS)  %>%
  dplyr::rename(Ogrenme_zamani_fen = SMINS)  %>%
  dplyr::rename(Ogrenme_zamani_toplam= TMINS)  %>%
  dplyr::rename(SES= ESCS)  %>%
  dplyr::rename(MC_Anlama_Hatirlama = UNDREM)  %>%
  dplyr::rename(MC_Ozetleme = METASUM)  %>%
  dplyr::rename(MC_Degerlendirme = METASPAM)   %>%
  dplyr::rename(BIT_EV = ICTHOME)   %>%
  dplyr::rename(BIT_OKL = ICTSCH)   %>%
  dplyr::rename(EVSEL_ESYA = HOMEPOS)   %>%
  dplyr::rename(KULTUREL_KAYNAK = CULTPOSS) %>%
  dplyr::rename(EGITIMSEL_KAYNAK = HEDRES)  %>%
  dplyr::rename(ZENGINLIK = WEALTH)  %>%
  dplyr::rename(BIT_KAYNAK = ICTRES)  %>%
  dplyr::rename(DISIPLIN = DISCLIMA)  %>%
  dplyr::rename(OGR_DESTEK = TEACHSUP)  %>%
  dplyr::rename(OGR_YONLENDIRME = DIRINS)  %>%
  dplyr::rename(GERI_BILDIRIM = PERFEED)  %>%
  dplyr::rename(DUYGUSAL_DESTEK = EMOSUPS)  %>%
  dplyr::rename(OKUMA_BAGLILIGI = STIMREAD)   %>%
  dplyr::rename(TALIMAT_UYAR = ADAPTIVITY)    %>%
  dplyr::rename(OGR_ILGISI = TEACHINT)  %>%
  dplyr::rename(OKUMA_ZEVK = JOYREAD)   %>%
  dplyr::rename(OK_YETERLIK = SCREADCOMP)   %>%
  dplyr::rename(OK_ZORLUK = SCREADDIFF)   %>%
  dplyr::rename(ALGILANAN_PISA_ZORLUK = PISADIFF)   %>%
  dplyr::rename(ALGILANAN_REKABET = PERCOMP)   %>%
  dplyr::rename(ALGILANAN_ISBIRLIGI = PERCOOP)   %>%
  dplyr::rename(OKUL_TUTUM = ATTLNACT)   %>%
  dplyr::rename(REKABET = COMPETE)   %>%
  dplyr::rename(USTALIK = WORKMAST)   %>%
  dplyr::rename(BASARISIZLIK_KORKUSU = GFOFAIL)   %>%
  dplyr::rename(EUDMO = EUDMO)   %>%
  dplyr::rename(IYI_OLUS = SWBP)   %>%
  dplyr::rename(DAYANIKLIK = RESILIENCE)   %>%
  dplyr::rename(KURSOR_OZYET = GCSELFEFF)   %>%
  dplyr::rename(KURSOR_FARKINDALIK = GCAWARE)   %>%
  dplyr::rename(GOCMENLIK_TUTUM = ATTIMM)   %>%
  dplyr::rename(KULTURLERE_ILGI = INTCULT)   %>%
  dplyr::rename(BAKIS_ACISI = PERSPECT)   %>%
  dplyr::rename(BILISSEL_ESNEKLIK = COGFLEX)   %>%
  dplyr::rename(KULTURLERE_SAYGI = RESPECT) %>%
  dplyr::rename(ILETISIM_FARKINDALIK = AWACOM) %>%
  dplyr::rename(KURESEL_FIKIR= GLOBMIND) %>%
  dplyr::rename(AYRIMCI_IKLIM= DISCRIM)%>%
  dplyr::rename(AIDIYET= BELONG)%>%
  dplyr::rename(ZORBALIK= BEINGBULLIED)%>%
  dplyr::rename(BIT_BOSZAMAN= ENTUSE)%>%
  dplyr::rename(BIT_OKULDISI= HOMESCH)%>%
  dplyr::rename(BIT_OKUL= USESCH)%>%
  dplyr::rename(BIT_ILGI= INTICT)%>%
  dplyr::rename(BIT_YET= COMPICT)%>%
  dplyr::rename(BIT_OZERK= AUTICT)%>%
  dplyr::rename(BIT_SOSYAL = SOIAICT)%>%
  dplyr::rename(BIT_DERS = ICTCLASS)%>%
  dplyr::rename(BIT_DERSDISI= ICTOUTSIDE) %>%
  dplyr::rename(Sinif_Duzey= GRADE) %>%
  dplyr::rename(Yas= AGE) %>%
  dplyr::rename(Program = PROGN) %>%
  dplyr::rename(caba = EFFORT1) %>%
  dplyr::rename_at(vars(starts_with("W_FSTURWT")), ~paste("AGIRLIKLANDIRMA", 1:80, sep=""))%>%
  dplyr::rename_at(vars(ends_with("MATH")), ~paste("OD","MAT", 1:10, sep=""))%>%
  dplyr::rename_at(vars(ends_with("READ")), ~paste("OD","OKUMA", 1:10, sep=""))%>%
  dplyr::rename_at(vars(ends_with("SCIE")), ~paste("OD","FEN", 1:10, sep=""))

PISA_OGR_2018 <- PISA_OGR_2018 %>% set_variable_labels(.labels = to_sentence_case(names(PISA_OGR_2018)))

var_label(PISA_OGR_2018) <- list(
  OKULID = "OKULID",
  OGRENCIID = "OGRENCIID",
  OKUL_TUR = "BOLGE ID 7-karakter (ULKE + BOLGE ID + original TABAKA ID)",
  KITAPCIK = "KITAPCIK ID",
  SINIF = "Ogrenci Sinif Duzeyi",
  DOGUMAY = "Ogrenci (Standart) Dogum - Ayi",
  CINSIYET = "Ogrenci (Standart) Cinsiyet",
  ANNE_OKUL = "Anneniz, asagidaki egitim kademelerinden en son hangisini bitirmistir?",
  ANNE_LISANSUSTU = "Anneniz asagidaki diplomalardan herhangi birine sahip midir? (Yuksek Lisans / Doktora)",
  ANNE_LISANS = "Anneniz asagidaki diplomalardan herhangi birine sahip midir? (universite)",
  ANNE_ONLISANS = "Anneniz asagidaki diplomalardan herhangi birine sahip midir? (Meslek Yuksek Okulu, Acikogretim Fakultesi/ Yuksek Okul vb.)",
  BABA_OKUL = "Babaniz, asagidaki egitim kademelerinden en son hangisini bitirmistir?",
  BABA_LISANSUSTU = "Babaniz asagidaki diplomalardan herhangi birine sahip midir? (Yuksek Lisans / Doktora)",
  BABA_LISANS = "Babaniz asagidaki diplomalardan herhangi birine sahip midir? (universite)",
  BABA_ONLISANS = "Babaniz asagidaki diplomalardan herhangi birine sahip midir? (Meslek Yuksek Okulu, Acikogretim Fakultesi/ Yuksek Okul vb.)",
  OLANAK_MASA = "Evinizde asagidakilerden hangileri bulunmaktadir: calisma Masasi",
  OLANAK_ODA = "Evinizde asagidakilerden hangileri bulunmaktadir: Kendinize ait oda",
  OLANAK_SESSIZYER = "Evinizde: calismak icin sessiz bir yer",
  OLANAK_BILGISAYAR = "Evinizde: Okul calismalari icin kullanabileceginiz bir bilgisayar",
  OLANAK_YAZILIM = "Evinizde: Egitim yazilimi",
  OLANAK_INTERNET = "Evinizde: İnternet baglantisi",
  OLANAK_KLASIKKITAP = "Evinizde: Edebiyat klasikleri (or. calikusu)",
  OLANAK_SIIRKITAP = "Evinizde: siir kitaplari",
  OLANAK_SANATESER = "Evinizde: Sanat eserleri (or. tablolar)",
  OLANAK_KAYNAKKITAP =  "Evinizde: Okul calismalari icin kaynak kitaplar",
  OLANAK_TEKNIKKITAP ="Evinizde: Teknik icerikli kitaplar (or. bilgisayar kitaplari)",
  OLANAK_SOZLUK = "Evinizde: Sozluk",
  OLANAK_SANATKITAP = "Evinizde: Muzik, sanat veya tasarim konulu kitaplar",
  OLANAK_KLIMA= "Evinizde: Klima tipi isitma-sogutma sistemi",
  OLANAK_TVABONE = "Evinizde: ucretli TV abonelikleri (or. Digiturk, Tivibu ve Teledunya gibi)",
  OLANAK_TATIL = "Evinizde: Yilda en az bir hafta tatil yapmak (memleket disinda otel vb. yerlerde kalarak yapilan tatiler",
  MIKTAR_TV = "Evinizde asagidakilerden kac tane bulunmaktadir: Televisyon",
  MIKTAR_ARABA = "Evinizde asagidakilerden kac tane bulunmaktadir: Araba",
  MIKTAR_BANYO = "Evinizde asagidakilerden kac tane bulunmaktadir: Banyolu ya da duslu oda",
  MIKTAR_AKILLITEL = "Evinizde asagidakilerden kac tane bulunmaktadir: İnternet erisimi olan cep telefonu (or. Akilli telefonlar)",
  MIKTAR_BILGISAYAR = "Evinizde asagidakilerden kac tane bulunmaktadir: Bilgisayar (or. Masaustu bilgisayar, tasinabilir dizustu veya notebook)",
  MIKTAR_TABLET = "Evinizde asagidakilerden kac tane bulunmaktadir: Tablet bilgisayarlar (or. iPad®, BlackBerry® PlayBook™)",
  MIKTAR_EKITAPOKUYUCU = "Evinizde asagidakilerden kac tane bulunmaktadir: Elektronik kitap okuyucular (or. Amazon® Kindle™)",
  MIKTAR_MUZIKALET = "Evinizde asagidakilerden kac tane bulunmaktadir: Muzik aleti (or. gitar, piyano)",
  KITAPSAYISI = "Evinizde kac tane kitap bulunmaktadir?",
  DOGUMULKE_OGR = "Hangi ulkede dogdunuz? Siz",
  DOGUMULKE_ANNE = "Hangi ulkede dogdunuz? ANNE",
  DOGUMULKE_BABA = "Hangi ulkede dogdunuz? BABA",
  TR_GELIS_YAS = "Turkiye'ye geldiginizde kac yasindaydiniz?",
  BASLAMA_YAS_OKULONCESI = "Kres, anaokulu ya da anasinifina basladiginizda kac yasindaydiniz?",
  BASLAMA_YAS_ILKOKUL= "İlkogretime/ilkokula basladiginizda kac yasindaydiniz?",
  SINIFTEKRARI_ILKOKUL = "Hic sinif tekrari yaptiniz mi?: Ilkokulda",
  SINIFTEKRARI_ORTAOKUL = "Hic sinif tekrari yaptiniz mi?: Ortaokulda",
  SINIFTEKRARI_LISE = "Hic sinif tekrari yaptiniz mi?: Lisede",
  EV_KONUSULAN_DIL= "Evde en cok hangi dili konusuyorsunuz?",
  ANNE_KONUSULAN_DIL= "Asagidaki kisilerle genellikle hangi dili konusuyorsunuz: Annem",
  BABA_KONUSULAN_DIL= "Asagidaki kisilerle genellikle hangi dili konusuyorsunuz: Babam",
  KARDES_KONUSULAN_DIL= "Asagidaki kisilerle genellikle hangi dili konusuyorsunuz: Kardesim / kardeslerim",
  YARKADAS_KONUSULAN_DIL = "Asagidaki kisilerle genellikle hangi dili konusuyorsunuz: Yakin arkadasim",
  OARKADAS_KONUSULAN_DIL="Asagidaki kisilerle genellikle hangi dili konusuyorsunuz: Okul arkadaslarim",
  ST097Q01TA="ogrenciler ogretmenin soylediklerini dinlemezler.",
  ST097Q02TA="Gurultu ve duzensizlik vardir.",
  ST097Q03TA="ogretmen ogrencilerin susmasi icin uzun sure bekler.",
  ST097Q04TA="ogrenciler derse iyi odaklanamiyorlar.",
  ST097Q05TA="ogrenciler, ders basladiktan sonra, uzun bir sure derse dikkatlerini vermiyorlar.",
  ST100Q01TA="ogretmen her ogrencinin ogrenmesi ile ilgilenmektedir.",
  ST100Q02TA="ogrenciler ihtiyac duydugunda ogretmen ekstra yardimda bulunmaktadir.",
  ST100Q03TA="ogretmen, ogrencilerin ogrenmelerine yardim etmektedir.",
  ST100Q04TA="ogretmen, ogrenciler anlayincaya kadar ders anlatmaya devam etmektedir.",
  ST102Q01TA="ogretmenimiz, ogrenecegimiz konular hakkinda acik hedefler koyar.",
  ST102Q02TA="ogretmenimiz ogretilen konuyu anlayip anlamadigimizi kontrol etmek icin sorular sorar.",
  ST102Q03TA="Dersin basinda, ogretmenimiz daha onceki dersin kisa bir ozetini yapar.",
  ST102Q04TA="ogretmenimiz ne ogrenmemiz gerektigini soyler.",
  ST211Q01HA="İslediginiz son iki Turkce dersini dusununuz:ogretmen, derste daha iyi seyler yapabilecegim konusunda kendi yeteneklerime guvenmemi sagladi.",
  ST211Q02HA="İslediginiz son iki Turkce dersini dusununuz:ogretmen, bir seylerin nasil yapilacagi ile ilgili benim goruslerimi dinledi",
  ST211Q03HA="İslediginiz son iki Turkce dersini dusununuz:ogretmenimin beni anladigini hissettim.",
  ST212Q01HA="ogretmen, dersi sinifin ihtiyaci ve seviyesine gore uyarlar." ,
  ST212Q02HA="Bir ogrenci, herhangi bir konuyu veya bir gorevi anlamakta gucluk cektiginde ogretmen bu ogrenciye bireysel olarak yardim eder.",
  ST212Q03HA="ogretmen, bircok ogrencinin anlamadigi konularda dersin anlatim seklini degistirir.",
  ST104Q02NA="ogretmen, derste iyi oldugum ozelliklerim ile ilgili bana geribildirim verir.",
  ST104Q03NA="ogretmen, kendimi hangi alanlarda daha da gelistirebilecegimi soyler.",
  ST104Q04NA="ogretmen, performansimi nasil gelistirebilecegimi soyler.",
  ST213Q01HA="İslediginiz son iki Turkce dersini dusununuz:ogretmenimizin bize ders anlatmaktan zevk aldigi belli oluyordu.",
  ST213Q02HA="İslediginiz son iki Turkce dersini dusununuz:ogretmenimizin coskusu bana ilham verdi.",
  ST213Q03HA="İslediginiz son iki Turkce dersini dusununuz:ogretmenimizin bu dersin konusunu begendigi belli oluyordu.",
  ST213Q04HA="İslediginiz son iki Turkce dersini dusununuz:ogretmenimiz, dersten zevk aldigini gosterdi.",
  ST150Q01IA="Gecen ay boyunca kac kere: sema ve harita iceren metinler",
  ST150Q02IA="Gecen ay boyunca kac kere: oykuleyici metinler (roman, kisa hikaye gibi)",
  ST150Q03IA="Gecen ay boyunca kac kere: Tablo ya da grafik iceren metinler",
  ST150Q04HA="Gecen ay boyunca kac kere: İcerisinde link adresi bulunan dijital metinler",
  ST152Q05IA="ogretmen, ogrencileri metinle ilgili goruslerini aciklamalari icin tesvik eder.",
  ST152Q06IA="ogretmen, ogrencilerin yasantilari ile okuduklari hikâyeler arasinda baglanti kurmalarina yardimci olur.",
  ST152Q07IA="ogretmen metinlerdeki bilgileri, ogrencilerin onceki bilgilerine nasil dayandiracaklarini ogrencilere gosterir.",
  ST152Q08IA="ogretmen, ogrencilerin derse daha aktif katilimini motive eden sorular sorar.",
  ST154Q01HA= "Bu ogretim yili boyunca, Turkce dersiniz icin okumak zorunda oldugunuz en uzun metin kac sayfaydi?",
  ST153Q01HA= "bir kitap ya da bir kitaptan bir bolum okumak durumunda kaldiginizda, ogretmeniniz Kitabin ya da bolumun bir ozetini cikarmak gorevini ister mi",
  ST153Q02HA= "bir kitap ya da bir kitaptan bir bolum okumak durumunda kaldiginizda, ogretmeniniz Ana karakterleri listelemek ve bunlarin bir tasvirini yapmak gorevini ister mi",
  ST153Q03HA= "bir kitap ya da bir kitaptan bir bolum okumak durumunda kaldiginizda, ogretmeniniz Ayni kitabi ya da bolumu okuyan diger ogrencilerle kucuk grup tartismasi yapmak gorevini ister mi",
  ST153Q04HA= "bir kitap ya da bir kitaptan bir bolum okumak durumunda kaldiginizda, ogretmeniniz Kitap ya da bolum hakkinda kendi dusuncelerinizi paylasmak (ondan hoslandiniz mi, eger evet ise nicin gibi sorular) gorevini ister mi",
  ST153Q05HA= "bir kitap ya da bir kitaptan bir bolum okumak durumunda kaldiginizda, ogretmeniniz Kitap ya da bolum hakkindaki sorulara cevap vermek gorevini ister mi",
  ST153Q06HA= "bir kitap ya da bir kitaptan bir bolum okumak durumunda kaldiginizda, ogretmeniniz Kitabin ya da bolumun icerigiyle kendi deneyimlerinizi karsilastirmak gorevini ister mi",
  ST153Q08HA= "bir kitap ya da bir kitaptan bir bolum okumak durumunda kaldiginizda, ogretmeniniz Kitabi, benzer konular hakkinda yazilmis diger kitaplarla ya da metinlerle karsilastirmak gorevini ister mi",
  ST153Q09HA= "bir kitap ya da bir kitaptan bir bolum okumak durumunda kaldiginizda, ogretmeniniz Hoslandiginiz ya da hoslanmadiginiz bir parcayi secmek ve nedenini aciklamak gorevini ister mi",
  ST153Q10HA= "bir kitap ya da bir kitaptan bir bolum okumak durumunda kaldiginizda, ogretmeniniz Ne okudugunuzla ilgili bir metin yazmak gorevini ister mi",
  ST158Q01HA= "Okulda, hic egitim aldiniz mi:Google©, Yahoo© gibi arama motorlari kullanirken anahtar kelimelerin nasil kullanilacagi",
  ST158Q02HA= "Okulda, hic egitim aldiniz mi:İnternetteki bilgilere guvenip guvenilmeyecegine nasil karar verilecegi ",
  ST158Q03HA= "Okulda, hic egitim aldiniz mi:Farkli internet sayfalarinin nasil karsilastirilacagi ve okul odevleriniz icin hangi bilgilerin daha onemli olduguna karar verilmesi",
  ST158Q04HA= "Okulda, hic egitim aldiniz mi:Facebook©, Instagram© gibi sitelerde bilgilerin herkese online olarak acilmasinin olasi sonuclarinin anlasilmasi",
  ST158Q05HA= "Okulda, hic egitim aldiniz mi:Arama sonucunda listelenen linklerin altindaki kisa aciklamalarin nasil kullanilacagi",
  ST158Q06HA= "Okulda, hic egitim aldiniz mi:Bilginin oznel veya tarafli olup olmadiginin nasil tespit edilecegi",
  ST158Q07HA= "Okulda, hic egitim aldiniz mi:Spam ve sifre avciligi yapan e-postalarin nasil tespit edilecegi",
  ST160Q01IA="Sadece mecbur kaldigimda bir seyler okurum.",
  ST160Q02IA="Okuma bos zamanlarimda yapmaktan en cok zevk aldigim ugraslardan biridir.",
  ST160Q03IA="Baskalariyla kitaplar hakkinda konusmaktan hoslanirim.",
  ST160Q04IA="Benim icin okuma, zamani bosa harcamaktir.",
  ST160Q05IA="Sadece ihtiyacim olan bilgiyi edinmek icin okurum.",
  ST167Q01IA="Kendi isteginizle ne siklikta okursunuz:Dergiler",
  ST167Q02IA="Kendi isteginizle ne siklikta okursunuz:cizgi romanlar",
  ST167Q03IA="Kendi isteginizle ne siklikta okursunuz:oykuleyici kitaplar (romanlar,oykuler, hikayeler)",
  ST167Q04IA="Kendi isteginizle ne siklikta okursunuz:Bilgilendirici kitaplar (orn: biyografi, tarih, tanitim kitaplari )",
  ST167Q05IA="Kendi isteginizle ne siklikta okursunuz:Gazeteler",
  ST168Q01HA="Asagida verilen ifadelerden hangisi, kitaplari (herhangi bir konuda) nasil okudugunuzu en iyi sekilde tanimlar?",
  ST175Q01IA="Zevk icin okumaya genellikle ne kadar zaman ayiriyorsunuz?",
  ST176Q01IA="Hangi siklikla yapiyorsunuz:E-postalari okuma",
  ST176Q02IA="Hangi siklikla yapiyorsunuz:İnternette sohbet etmek (or. Whatsapp®, Skype® gibi)",
  ST176Q03IA="Hangi siklikla yapiyorsunuz:İnternet sayfalarindaki haberleri okuma",
  ST176Q05IA="Hangi siklikla yapiyorsunuz:Belli bir konuyu ogrenmek icin internette bilgi arama",
  ST176Q06IA="Hangi siklikla yapiyorsunuz:Online grup tartismalarina ve forumlara katilma",
  ST176Q07IA="Hangi siklikla yapiyorsunuz:İnternette pratik bilgiler arastirma (or. tarifeler, yarismalar, tuyolar, yemek tarifleri)",
  ST161Q01HA="İyi bir okuyucuyumdur.",
  ST161Q02HA="Zor metinleri anlayabilirim.",
  ST161Q03HA="Akici olarak okurum.",
  ST161Q06HA="Genellikle okumakta zorluk yasarim.",
  ST161Q07HA="Bir metni tam olarak anlamadan once onu bircok kez okumak zorunda kalirim.",
  ST161Q08HA="Bir metin hakkindaki sorulari cevaplamak benim icin zordur.",
  ST163Q02HA="PISA testi okuma metinlerinde:Anlamadigim bircok kelime vardi. ",
  ST163Q03HA="PISA testi okuma metinlerinde:Bircok metin benim icin cok zordu.",
  ST163Q04HA="PISA testi okuma metinlerinde:Farkli sayfalarda gecis yapmak zorunda kaldigim zaman yolumu kaybettim.",
  ST164Q01IA="Bir metni anlamak ve hatirlamak icin: Metnin anlasilmasi kolay kisimlarina yogunlasirim.",
  ST164Q02IA="Bir metni anlamak ve hatirlamak icin: Metnin genelini hizli bir sekilde iki kez okurum.",
  ST164Q03IA="Bir metni anlamak ve hatirlamak icin: Metni okuduktan sonra, metnin icerigini diger insanlarla tartisirim.",
  ST164Q04IA="Bir metni anlamak ve hatirlamak icin: Metnin onemli kisimlarinin altini cizerim.",
  ST164Q05IA="Bir metni anlamak ve hatirlamak icin: Metni kendi kelimelerimi kullanarak ozetlerim.",
  ST164Q06IA="Bir metni anlamak ve hatirlamak icin: Metni sesli bir sekilde, bir baskasina okurum.",
  ST165Q01IA="Bu iki sayfalik metnin ozetini cikarmak icin: Bir ozet yazarim. Her bir paragrafin bu ozette yer alip almadigini kontrol ederim. cunku her paragrafin icerigi bu ozette yer almalidir.",
  ST165Q02IA="Bu iki sayfalik metnin ozetini cikarmak icin: Mumkun oldugunca cok cumleyi dogru olarak kopyalamaya calisirim.",
  ST165Q03IA="Bu iki sayfalik metnin ozetini cikarmak icin: ozeti yazmadan once, metni mumkun oldugunca cok defa okurum.",
  ST165Q04IA="Bu iki sayfalik metnin ozetini cikarmak icin: Metinde yer alan en onemli noktalarin, benim ozetimde yer alip almadiklarini dikkatlice kontrol ederim.",
  ST165Q05IA="Bu iki sayfalik metnin ozetini cikarmak icin: Metnin genelini okurum, en onemli cumlelerin altini cizerim.Bu cumleleri, kendi kelimelerimle ozet seklinde yazarim.",
  ST166Q01HA="Bu e-postaya tepki olarak: E-postaya cevap vermek ve akilli telefon hakkinda daha fazla bilgi talep etmek",
  ST166Q02HA="Bu e-postaya tepki olarak: Gondericinin e-posta adresini kontrol etmek",
  ST166Q03HA="Bu e-postaya tepki olarak: En kisa zamanda formu doldurmak icin linke tiklamak",
  ST166Q04HA="Bu e-postaya tepki olarak: Linke tiklamadan e-postayi silmek",
  ST166Q05HA="Bu e-postaya tepki olarak: Akilli telefon kampanyasindan bahsedilip bahsedilmedigini gormek icin cep telefonu operatorunun internet adresini kontrol etmek",
  ST016Q01NA="Genel anlamda, bir butun olarak dusundugunuzde bugunlerde hayatinizdan ne derece memnunsunuz?",
  ST036Q05TA="Okulunuzu goz onune aldiginizda: Okulda cok calismak iyi bir is bulmamda bana yardimci olacaktir.",
  ST036Q06TA="Okulunuzu goz onune aldiginizda: Okulda cok calismak iyi bir universiteye gitmeme yardimci olacaktir.",
  ST036Q08TA="Okulunuzu goz onune aldiginizda: Okulda cok calismak onemlidir.",
  ST225Q01HA="Egitim kademelerinden hangisini tamamlamayi umuyorsunuz: Ortaokul",
  ST225Q02HA="Egitim kademelerinden hangisini tamamlamayi umuyorsunuz: Mesleki ve Teknik Anadolu Lisesi/ cok Programli Anadolu Lisesi",
  ST225Q03HA="Egitim kademelerinden hangisini tamamlamayi umuyorsunuz: Anadolu Lisesi/ Fen Lisesi/ Sosyal Bilimler Lisesi/ Guzel Sanatlar Lisesi/ Spor Lisesi/Anadolu İmam Hatip Lisesi",
  ST225Q05HA="Egitim kademelerinden hangisini tamamlamayi umuyorsunuz: universite veya Yuksek Lisans/Doktora",
  ST181Q02HA="Baskalariyla rekabetin oldugu durumlarda calismayi severim.",
  ST181Q03HA="Bir iste baskalarindan daha iyi performans gostermek benim icin onemlidir.",
  ST181Q04HA="Baska insanlarla rekabet icinde oldugum zaman daha cok calisirim.",
  ST182Q03HA="calisabildigim kadar cok calismaktan memnuniyet duyarim.",
  ST182Q04HA="Bir ise basladigim zaman onu bitirene kadar devam ederim.",
  ST182Q05HA="Bir seyler yaparken aldigim hazzin bir kismi, kendimi gelistirmekten kaynaklidir.",
  ST182Q06HA="Daha iyi oldugum bir isi yapmak yerine, iyi olmadigim iste basarili olmaya calisirim.",
  ST183Q01HA="Basarisiz oldugum zamanlarda, diger kisilerin hakkimda ne dusunduklerini merak ederim.",
  ST183Q02HA="Basarisiz oldugum zamanlarda, yeterince yetenekli biri olmadigimdan korkarim.",
  ST183Q03HA="Basarisiz oldugum zamanlarda, bu durum gelecekteki planlarim hakkinda beni supheye dusurur.",
  ST184Q01HA="Zekâ, cok fazla degistiremediginiz bir seydir." ,
  ST185Q01HA="Hayatimin belirgin bir anlami ve amaci vardir.",
  ST185Q02HA="Hayatta beni tatmin edecek bir anlam buldum.",
  ST185Q03HA="Hayatima neyin anlam verecegi konusunda net bir fikrim var.",

  ST186Q05HA="Kendinizi genel olarak nasil hissettiginizi dusununuz. Kendinizi ne siklikla Mutlu hissedersiniz?",
  ST186Q06HA="Kendinizi genel olarak nasil hissettiginizi dusununuz. Kendinizi ne siklikla Korkmus hissedersiniz?",
  ST186Q07HA="Kendinizi genel olarak nasil hissettiginizi dusununuz. Kendinizi ne siklikla Yasam dolu hissedersiniz?",
  ST186Q10HA="Kendinizi genel olarak nasil hissettiginizi dusununuz. Kendinizi ne siklikla Perisan hissedersiniz?",
  ST186Q09HA="Kendinizi genel olarak nasil hissettiginizi dusununuz. Kendinizi ne siklikla Gururlu hissedersiniz?",
  ST186Q02HA="Kendinizi genel olarak nasil hissettiginizi dusununuz. Kendinizi ne siklikla Endiseli hissedersiniz?",
  ST186Q01HA="Kendinizi genel olarak nasil hissettiginizi dusununuz. Kendinizi ne siklikla Sevincli hissedersiniz?",
  ST186Q08HA="Kendinizi genel olarak nasil hissettiginizi dusununuz. Kendinizi ne siklikla uzgun hissedersiniz?",
  ST186Q03HA="Kendinizi genel olarak nasil hissettiginizi dusununuz. Kendinizi ne siklikla Neseli hissedersiniz?",
  ST208Q01HA="Hedefim, olabildigince cok ogrenmektir.",
  ST208Q02HA="Hedefim, sinifta gosterilen konulari tamamiyla ogrenmektir.",
  ST208Q04HA="Hedefim, ders iceriklerini olabildigince tum ayrintilariyla anlamaktir.",
  ST188Q01HA="Genellikle oyle ya da boyle islerin ustesinden gelirim.",
  ST188Q02HA="Basardigim seylerden gurur duyarim.",
  ST188Q03HA="Bircok seyle bir seferde basa cikabilecegimi hissederim.",
  ST188Q06HA="Kendime olan inancim zor zamanlarin ustesinden gelmemi saglar.",
  ST188Q07HA="Zor bir durumda kaldigim zaman, genellikle kendi cozum yolumu bulabilirim.",
  ST034Q01TA="Okulda kendimi yabanci (ya da dislanmis gibi) hissederim.",
  ST034Q02TA="Okulda diger ogrencilerle kolaylikla arkadaslik kurarim.",
  ST034Q03TA="Kendimi okulun bir parcasi olarak hissederim.",
  ST034Q04TA="Kendimi aykiri ve okula ait degilmis gibi hissederim.",
  ST034Q05TA="Diger ogrencilerin beni sevdigini dusunuyorum.",
  ST034Q06TA="Okulda kendimi yalniz hissediyorum.",
  ST196Q02HA="Karbondioksit salinimlarinin kuresel iklim degisikliklerini nasil etkileyebilecegini aciklamak",
  ST196Q03HA="Tekstil urunlerinin fiyatlariyla uretimlerinin yapildigi ulkelerin calisma kosullari arasinda baglanti kurmak",
  ST196Q04HA="İnsanlarin neden multeci olduklarinin sebeplerini tartismak",
  ST196Q05HA="Bazi ulkelerin kuresel iklim degisikliklerinden digerlerine gore neden daha fazla etkilendigini aciklamak",
  ST196Q06HA="Bir ulkede meydana gelen ekonomik krizin kuresel ekonomiyi nasil etkileyebilecegini aciklamak",
  ST196Q07HA="Ekonomik gelismenin cevre uzerindeki etkilerini aciklamak",
  ST197Q01HA="Ne kadar bilgi sahibisiniz: İklim degisikligi ve kuresel isinma",
  ST197Q02HA="Ne kadar bilgi sahibisiniz: Kuresel saglik (or. salgin hastaliklar)",
  ST197Q04HA="Ne kadar bilgi sahibisiniz: Goc (insan hareketleri)",
  ST197Q07HA="Ne kadar bilgi sahibisiniz: Uluslararasi anlasmazliklar",
  ST197Q08HA="Ne kadar bilgi sahibisiniz: Dunyanin cesitli bolgelerindeki aclik ya da yetersiz beslenme",
  ST197Q09HA="Ne kadar bilgi sahibisiniz: Yoksullugun nedenleri",
  ST197Q12HA="Ne kadar bilgi sahibisiniz: Dunyanin cesitli bolgelerindeki kadin ve erkek esitligi",
  ST215Q01HA="Sizi ne kadar iyi tanimlar: Karar vermeden once herkesin fikrinin uyusmadigi yonlere bakarim.",
  ST215Q02HA="Sizi ne kadar iyi tanimlar: Her olayin iki yonu olduguna inanirim ve her iki yonune de bakmaya calisirim.",
  ST215Q03HA="Sizi ne kadar iyi tanimlar: Bazen olaylara arkadaslarimin gozunden bakarak onlari daha iyi anlamaya calisirim.",
  ST215Q04HA="Sizi ne kadar iyi tanimlar: Birini elestirmeden once, onun yerinde ben olsam nasil hissederdim diye dusunmeye calisirim.",
  ST215Q05HA="Sizi ne kadar iyi tanimlar: Birine sinirlendigimde bir sureligine olaya onun acisindan bakmaya calisirim.",
  ST216Q01HA="Beklenmedik durumlarin ustesinden gelebilirim.",
  ST216Q02HA="Davranislarimi, yeni durumlarin gerekliliklerine gore degistirebilirim.",
  ST216Q03HA="Stres ve baski altinda bile farkli durumlara uyum saglayabilirim.",
  ST216Q04HA="Yeni bir kulture kolaylikla uyum saglayabilirim.",
  ST216Q05HA="Diger insanlarla sorun yasadigimda sorunlari cozmenin bir yolunu bulabilirim.",
  ST216Q06HA="Baska kulturlerden insanlarla iletisim kurarken karsilastigim zorluklarin ustesinden gelebilirim.",
  ST218Q01HA="cok kulturlu iletisimde: Bu kisilerin tepkilerini dikkatlice gozlemlerim.",
  ST218Q02HA="cok kulturlu iletisimde: Birbirimizi dogru anlayip anlamadigimizi sik sik kontrol ederim.",
  ST218Q03HA="cok kulturlu iletisimde: Ne dediklerini dikkatlice dinlerim.",
  ST218Q04HA="cok kulturlu iletisimde: Kelimelerimi dikkatlice secer ve telaffuz ederim.",
  ST218Q05HA="cok kulturlu iletisimde: Fikirlerimi aciklamak icin somut ornekler veririm.",
  ST218Q06HA="cok kulturlu iletisimde: Olaylari dikkatli bir sekilde aciklarim.",
  ST218Q07HA="cok kulturlu iletisimde: İletisimle ilgili bir problem varsa, bunu cozebilirim. (or. el kol hareketleriyle, tekrar
  aciklayarak, yazarak vb.)",
  ST222Q01HA="cevreyi korumak icin evde kullandigim enerjiyi azaltirim (ornegin, bir odadan cikarken lambalari kapatirim ya da isiticinin
  veya klimanin derecesini azaltirim).",
  ST222Q03HA="Biraz pahali da olsa etik ve cevresel nedenlerden dolayi belirli urunleri secerim.",
  ST222Q04HA="cevre ve insan haklarini korumak icin online dilekceleri imzalarim.",
  ST222Q05HA="Twitter ya da Facebook araciligiyla dunyada olup bitenlerden aninda haberdar olurum.",
  ST222Q06HA="Siyasi, etik ya da cevresel nedenlerden dolayi sirketleri ya da urunleri boykot ederim.",
  ST222Q08HA="Erkek ve kadin esitligini destekleyen etkinliklere katilirim.",
  ST222Q09HA="cevre koruma yararina olan etkinliklere katilirim.",
  ST222Q10HA="Uluslararasi toplumsal olaylar (or. aclik, insan haklari) hakkinda duzenli olarak internetten bir seyler okurum.",
  ST214Q01HA="Farkli ulkelerdeki insanlarin nasil yasadigini bilmek isterim.",
  ST214Q02HA="Dunyadaki dinler hakkinda daha fazla bilgi edinmek isterim.",
  ST214Q03HA="cesitli kulturlerdeki insanlarin dunyayi nasil anlamlandirdiklarini merak ederim.",
  ST214Q06HA="Farkli kulturlerin geleneklerini ogrenmek isterim.",
  ST220Q01HA="Baska ulkelerden insanlarla iletisiminiz var mi: Ailenizde",
  ST220Q02HA="Baska ulkelerden insanlarla iletisiminiz var mi: Okulda",
  ST220Q03HA="Baska ulkelerden insanlarla iletisiminiz var mi: Mahallenizde",
  ST220Q04HA="Baska ulkelerden insanlarla iletisiminiz var mi: Arkadas cevrenizde",
  ST217Q01HA="Farkli kulturlerden insanlarin hepsini esit gorup saygi gosteririm.",
  ST217Q02HA="Kulturel gecmisleri ne olursa olsun butun insanlara saygiyla davranirim.",
  ST217Q03HA="Farkli kulturlerden insanlarin kendilerini ifade etmelerine olanak tanirim.",
  ST217Q04HA="Farkli kulturlerden insanlarin degerlerine saygigosteririm.",
  ST217Q05HA="Farkli kulturlerden insanlarin fikirlerine deger veririm.",
  ST219Q01HA="Kendimi bir dunya vatandasi olarak goruyorum.",
  ST219Q02HA="Dunyadaki bazi insanlarin icinde bulundugu zor kosullar icin bir seyler yapma sorumlulugu hissediyorum.",
  ST219Q03HA="Davranislarimin diger ulkelerdeki insanlari etkileyebilecegini dusunuyorum.",
  ST219Q04HA="calisanlarina kotu calisma ortami sunan sirketleri boykot etmenin dogru oldugunu dusunuyorum.",
  ST219Q05HA="Dunyadaki sorunlar icin bir seyler yapabilirim.",
  ST219Q06HA="Kuresel cevreye ozen gostermek benim icin onemlidir.",
  ST204Q02HA="Gocmen cocuklar, egitim konusunda goc ettikleri ulkelerdeki diger cocuklarla ayni imkanlara sahip olmalidirlar.",
  ST204Q03HA="Bir ulkede birkac yil yasayan gocmenler, secimlerde oy kullanma imkanina sahip olmalidirlar.",
  ST204Q04HA="Gocmenler kendi geleneklerini ve yasam tarzlarini devam ettirmek icin gerekli imkanlara sahip olmalidirlar.",
  ST204Q05HA="Gocmenler, gittikleri ulkelerdeki herkesin sahip olduklari haklara sahip olmalidirlar.",
  ST177Q01HA="Siz evde konustugunuz dil dâhil olmak uzere kac dili baskalariyla konusacak kadar iyi konusuyorsunuz?",
  ST177Q02HA="Anneniz evde konustugunuz dil dâhil olmak uzere kac dili baskalariyla konusacak kadar iyi konusuyorsunuz?",
  ST177Q03HA="Babaniz evde konustugunuz dil dâhil olmak uzere kac dili baskalariyla konusacak kadar iyi konusuyorsunuz?",
  ST189Q01HA="Bu yil, okulunuzda kac tane yabanci dil ogrendiniz?",
  ST221Q01HA="Okulda: ulke ekonomilerinin birbirleriyle baglantili olduklarini ogrenirim.",
  ST221Q02HA="Okulda: Sinifta diger insanlarla yasadigimiz sorunlari nasil cozecegimizi ogrenirim.",
  ST221Q03HA="Okulda: Farkli kulturleri ogrenirim.",
  ST221Q04HA="Okulda: Derslerde gazete okuruz, internetteki haberlere bakariz veya televizyon izleriz.",
  ST221Q05HA="Okulda: ogretmenlerim bana sik sik uluslararasi haberler hakkindaki kisisel fikirlerimi sorar.",
  ST221Q06HA="Okulda: Kulturel farkliliklarin kutlanmasiyla ilgili etkinliklere egitim-ogretim yili boyunca katilirim.",
  ST221Q07HA="Okulda: ogretim programinin bir parcasi olarak dunyadaki olaylarla ilgili sinif ici tartismalara katilirim.",
  ST221Q08HA="Okulda: Ders esnasinda kucuk gruplar halinde sinif arkadaslarimla birlikte kuresel meseleleri analiz ederiz.",
  ST221Q09HA="Okulda: Bazi meseleler hakkinda farkli kulturlerden insanlarin ne gibi farkli goruslere sahip olabilecegini ogrenirim.",
  ST221Q11HA="Okulda: Farkli sosyal cevrelerdeki insanlarla nasil iletisim kurabilecegimi ogrenirim.",
  ST223Q02HA="Okuldaki ogretmenleriniz: Bazi etnik gruplarin tarihi konusunda yanlis fikirlere sahipler.",
  ST223Q04HA="Okuldaki ogretmenleriniz: Bazi etnik gruplardan olan insanlar hakkinda olumsuz seyler soylerler.",
  ST223Q05HA="Okuldaki ogretmenleriniz: Turkiye’nin karsilastigi sorunlar icin bazi etnik gruplardan olan insanlari suclarlar.",
  ST223Q08HA="Okuldaki ogretmenleriniz: Bazi etnik gruplara ait ogrencilerin akademik basarilari konusunda beklentileri daha dusuktur.",
  ST123Q02NA="Bu ogretim yilinda: Ailem, egitim cabalarimi ve basarilarimi destekler.",
  ST123Q03NA="Bu ogretim yilinda: Ailem, okulda zorluklarla karsilastigimda bana destek olur.",
  ST123Q04NA="Bu ogretim yilinda: Ailem, kendime guvenmem konusunda beni cesaretlendirir.",
  ST205Q01HA="Okulunuz hakkinda dusununuz: ogrenciler rekabetin onemli oldugunu dusunuyorlar.",
  ST205Q02HA="Okulunuz hakkinda dusununuz: ogrencilerin birbirleriyle rekabet icinde oldugu gorunmektedir.",
  ST205Q03HA="Okulunuz hakkinda dusununuz: ogrenciler birbirleriyle rekabet icinde olmanin onemli oldugu hissini paylasiyor.",
  ST205Q04HA="Okulunuz hakkinda dusununuz: ogrenciler, birbirleriyle karsilastirildigini hissederler.",
  ST059Q01TA="Turkce dersi icin bir haftada kac ders saati devam etmeniz gerekmektedir?",
  ST059Q02TA="Fen bilimleri (fizik, kimya ve biyoloji gibi) icin bir haftada kac ders saati devam etmeniz gerekmektedir?",
  ST059Q03TA="Matematik dersi icin bir haftada kac ders saati devam etmeniz gerekmektedir?",
  ST059Q04HA="Yabanci dil dersi icin bir haftada kac ders saati devam etmeniz gerekmektedir?",
  ST060Q01NA= "Normalde, tum hafta boyunca okulda toplam kac ders saatine devam etmeniz gerekmektedir?",
  ST061Q01NA= "Bir ders saati ortalama kac dakikadir?",
  ST062Q01TA= "Okulun son iki haftasi icerisinde: Bir tam gun okulu astim.",
  ST062Q02TA= "Okulun son iki haftasi icerisinde: Bazi dersleri astim.",
  ST062Q03TA= "Okulun son iki haftasi icerisinde: Okula gec geldim.",
  ST038Q03NA= "Son 12 ay boyunca: Diger ogrenciler beni bilerek yalniz birakti.",
  ST038Q04NA= "Son 12 ay boyunca: Diger ogrenciler benimle alay etti.",
  ST038Q05NA= "Son 12 ay boyunca: Diger ogrenciler tarafindan tehdit edildim.",
  ST038Q06NA= "Son 12 ay boyunca: Diger ogrenciler bana ait olan seyleri zorla elimden aldilar veya onlara zarar verdiler.",
  ST038Q07NA= "Son 12 ay boyunca: Diger ogrenciler tarafindan itildim veya siddete maruz kaldim.",
  ST038Q08NA= "Son 12 ay boyunca: Diger ogrenciler hakkimda cirkin dedikodular cikardi.",
  ST207Q01HA="Zorbaliga maruz kalan ogrencilerin kimse tarafindan savunulmamasi beni sinirlendirir.",
  ST207Q02HA="Kendini savunamayan ogrencilere yardimci olmak iyi bir seydir.",
  ST207Q03HA="Zorbalik eylemlerine katilmak yanlis bir seydir.",
  ST207Q04HA="Zorbaliga ugrayan ogrencileri gordugumde kendimi kotu hissederim.",
  ST207Q05HA="Birisinin, zorbaliga maruz kalan diger ogrencileri savunmasi hosuma gider.",
  ST206Q01HA="Okulda: ogrenciler is birliginin onemli oldugunu dusunuyorlar.",
  ST206Q02HA="Okulda: ogrencilerin birbirleriyle is birligi yaptigi gorunmektedir.",
  ST206Q03HA="Okulda: ogrenciler birbirleriyle is birligi yapmanin onemli oldugu hissini paylasiyor.",
  ST206Q04HA="Okulda: ogrenciler, birbirleriyle is birligi yapmaya tesvik edildiklerini hissederler."
)


var_label(PISA_OGR_2018) <- list(
  IC001Q01TA= "Evinizde bulunuyor mu: Masaustu bilgisayar",
  IC001Q02TA= "Evinizde bulunuyor mu: Tasinabilir dizustu bilgisayar",
  IC001Q03TA= "Evinizde bulunuyor mu: Tablet bilgisayar (or. iPad®, BlackBerry® PlayBook™)",
  IC001Q04TA= "Evinizde bulunuyor mu: İnternet baglantisi",
  IC001Q05TA= "Evinizde bulunuyor mu: Video oyun konsolu, or. Sony® PlayStation®",
  IC001Q06TA= "Evinizde bulunuyor mu: Cep telefonu (internet erisimi olmayan)",
  IC001Q07TA= "Evinizde bulunuyor mu: Cep telefonu (internet erisimi olan)",
  IC001Q08TA= "Evinizde bulunuyor mu: Tasinabilir muzik calar (Mp3/Mp4 player, iPod® vb.)",
  IC001Q09TA= "Evinizde bulunuyor mu: Yazici",
  IC001Q10TA= "Evinizde bulunuyor mu: USB bellek",
  IC001Q11TA= "Evinizde bulunuyor mu: Elektronik kitap okuyucu, or. Amazon® Kindle™",


  IC009Q01TA= "Okulunuzda bulunuyor mu: Masaustu bilgisayar",
  IC009Q02TA= "Okulunuzda bulunuyor mu: Tasinabilir dizustu bilgisayar",
  IC009Q03TA= "Okulunuzda bulunuyor mu: Tablet bilgisayar (or. iPad®, BlackBerry® PlayBook™)",
  IC009Q05NA= "Okulunuzda bulunuyor mu: İnternet baglantisi olan okul bilgisayarlari",
  IC009Q06NA= "Okulunuzda bulunuyor mu: Kablosuz ag ile internet baglantisi",
  IC009Q07NA= "Okulunuzda bulunuyor mu: Elektronik ortamda okula iliskin belgelerin saklanmasi icin depolama alani, or. ogrencinin kendi belgelerini koydugu bir klasor",
  IC009Q08TA= "Okulunuzda bulunuyor mu: USB bellek",
  IC009Q09TA= "Okulunuzda bulunuyor mu: Elektronik kitap okuyucu, or. Amazon® Kindle™",
  IC009Q10NA= "Okulunuzda bulunuyor mu: Projeksiyon, or. sunumlar icin",
  IC009Q11NA= "Okulunuzda bulunuyor mu: Etkilesimli tahta, or. Akilli Tahta",

  IC002Q01HA="İlk kez dijital bir cihazi kullandiginizda kac yasindaydiniz?",
  IC004Q01HA="İlk kez internete girdiginizde kac yasindaydiniz?",
  IC005Q01TA="Hafta ici normal bir gunde, okulda ne kadar sure internet kullaniyorsunuz?",
  IC006Q01TA="Hafta ici normal bir gunde, okul disinda ne kadar sure internet kullaniyorsunuz?",
  IC007Q01TA= "Hafta sonu normal bir gunde, okul disinda ne kadar sure internet kullaniyorsunuz?",
  IC150Q01HA="Normal bir haftada, Turkce derslerinde dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC150Q02HA="Normal bir haftada, Matematik derslerinizde dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC150Q03HA="Normal bir haftada, Fen bilimleri (fizik, kimya ve biyoloji gibi) derslerinizde dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC150Q04HA="Normal bir haftada, Yabanci dil derslerinizde dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC150Q05HA="Normal bir haftada, Sosyal bilimler (tarih ve cografya) derslerinizde dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC150Q06HA="Normal bir haftada, Muzik derslerinizde dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC150Q07HA="Normal bir haftada, Beden egitimi derslerinizde dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC150Q08HA="Normal bir haftada, Sahne sanatlari derslerinizde dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC150Q09HA="Normal bir haftada, Gorsel sanatlar derslerinizde dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC151Q01HA="Normal bir haftada, derslerinizin disinda (evde veya okulda) Turkce dersleri icin  dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC151Q02HA="Normal bir haftada, derslerinizin disinda (evde veya okulda) Matematik dersleri icin  dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC151Q03HA="Normal bir haftada, derslerinizin disinda (evde veya okulda) Fen bilimleri (fizik, kimya ve biyoloji gibi) dersleri icin  dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC151Q04HA="Normal bir haftada, derslerinizin disinda (evde veya okulda) Yabanci dil dersleri icin  dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC151Q05HA="Normal bir haftada, derslerinizin disinda (evde veya okulda) Sosyal bilimler (tarih ve cografya) dersleri icin  dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC151Q06HA="Normal bir haftada, derslerinizin disinda (evde veya okulda) Muzik dersleri icin  dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC151Q07HA="Normal bir haftada, derslerinizin disinda (evde veya okulda) Beden egitimi dersleri icin  dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC151Q08HA="Normal bir haftada, derslerinizin disinda (evde veya okulda) Sahne sanatlari dersleri icin  dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",
  IC151Q09HA="Normal bir haftada, derslerinizin disinda (evde veya okulda) Gorsel sanatlar dersleri icin  dijital cihazlari kullanarak ne kadar zaman geciriyorsunuz?",


  IC152Q01HA="Gectigimiz ay icinde, asagidaki Turkce derslerinde ogrenme veya ogretme amaciyla dijital bir cihaz kullanildi mi?",
  IC152Q02HA="Gectigimiz ay icinde, asagidaki Matematik derslerinde ogrenme veya ogretme amaciyla dijital bir cihaz kullanildi mi?",
  IC152Q03HA="Gectigimiz ay icinde, asagidaki Fen bilimleri (fizik, kimya ve biyoloji gibi) derslerinde ogrenme veya ogretme amaciyla dijital bir cihaz kullanildi mi?",
  IC152Q04HA="Gectigimiz ay icinde, asagidaki Yabanci dil derslerinde ogrenme veya ogretme amaciyla dijital bir cihaz kullanildi mi?",
  IC152Q05HA="Gectigimiz ay icinde, asagidaki Sosyal bilimler (tarih ve cografya) derslerinde ogrenme veya ogretme amaciyla dijital bir cihaz kullanildi mi?",
  IC152Q06HA="Gectigimiz ay icinde, asagidaki Muzik derslerinde ogrenme veya ogretme amaciyla dijital bir cihaz kullanildi mi?",
  IC152Q07HA="Gectigimiz ay icinde, asagidaki Beden egitimi derslerinde ogrenme veya ogretme amaciyla dijital bir cihaz kullanildi mi?",
  IC152Q08HA="Gectigimiz ay icinde, asagidaki Sahne sanatlari derslerinde ogrenme veya ogretme amaciyla dijital bir cihaz kullanildi mi?",
  IC152Q09HA="Gectigimiz ay icinde, asagidaki Gorsel sanatlar derslerinde ogrenme veya ogretme amaciyla dijital bir cihaz kullanildi mi?",

  IC008Q01TA= "Okul disi etkinliklerde: Tek oyunculu oyunlar oynama.",
  IC008Q02TA= "Okul disi etkinliklerde: cok oyunculu online oyunlar oynama.",
  IC008Q03TA= "Okul disi etkinliklerde: E-posta kullanma.",
  IC008Q04TA= "Okul disi etkinliklerde: İnternette sohbet etme (or. Skype).",
  IC008Q05TA= "Okul disi etkinliklerde: Sosyal aglara girme (or. Facebook, Twitter).",
  IC008Q07NA= "Okul disi etkinliklerde: Sosyal aglarda online oyunlar oynama (or. Farmville, Candy Crush).",
  IC008Q08TA= "Okul disi etkinliklerde: Eglence icin internete bakma (video izlemek gibi, or. Youtube™).",
  IC008Q09TA= "Okul disi etkinliklerde: İnternetten haberleri okuma (or. guncel olaylarla ilgili).",
  IC008Q10TA= "Okul disi etkinliklerde: İnternetten faydali bilgiler bulma (or. mekanlar, onemli gunlerin tarihleri).",
  IC008Q11TA= "Okul disi etkinliklerde: İnternetten muzik, film veya yazilim programi indirme.",
  IC008Q12TA= "Okul disi etkinliklerde: Kendi olusturdugunuz icerigi paylasmak uzere internete yukleme (or. muzik, siir, video, bilgisayar programlari).",
  IC008Q13NA= "Okul disi etkinliklerde: Cep telefonunuza yeni uygulamalar indirme.",
  IC010Q01TA= "Okul disi etkinliklerde: Okul calismalari icin interneti kulanma (or. sunum hazirlama veya komposizyon yazma).",
  IC010Q02NA= "Okul disi etkinliklerde: Dersleri takip etmek icin internet kullanma, or. konularla ilgili aciklamalar bulmak icin.",
  IC010Q03TA= "Okul disi etkinliklerde: Okuldaki odevlerle ilgili okul arkadaslariyla iletisim kurmak icin e-posta kullanma.",
  IC010Q04TA= "Okul disi etkinliklerde: ogretmenlerle iletisim kurmak ve ev odevi ya da okuldaki diger odevleri gondermek icin e-posta kullanma.",
  IC010Q05NA= "Okul disi etkinliklerde: Okuldaki odevlerle ilgili okul arkadaslariyla iletisim kurmak icin sosyal aglari kullanma (or. Facebook, Twitter).",
  IC010Q06NA= "Okul disi etkinliklerde: ogretmenlerle iletisim kurmak icin sosyal aglari kullanma (or.Facebook, Twitter).",
  IC010Q07TA= "Okul disi etkinliklerde: Okulun internet sitesinden dosyalar indirme, yukleme ya da dosyalara goz atma (or. haftalik ders cizelgesi veya ders materyalleri).",
  IC010Q08TA= "Okul disi etkinliklerde: Okulun internet sitesinden duyurulari kontrol etme, ogretmenin gelip gelmemesi gibi.",
  IC010Q09NA= "Okul disi etkinliklerde: Bilgisayarda ev odevi yapma.",
  IC010Q10NA= "Okul disi etkinliklerde: Cep telefonunda ev odevi yapma.",
  IC010Q11HA= "Okul disi etkinliklerde: Bilgisayarda egitim uygulamalari veya egitim icerikli internet sitelerini kullanma.",
  IC010Q12HA= "Okul disi etkinliklerde: Cep telefonunda egitim uygulamalari veya egitim icerikli internet sitelerini kullanma.",


  IC011Q01TA = "Okulda: Okulda internet ortaminda sohbet etme.",
  IC011Q02TA = "Okulda: Okulda e-posta kullanma.",
  IC011Q03TA = "Okulda: Okul odevlerinde internet kullanma.",
  IC011Q04TA = "Okulda: Okulun internet sitesinden dosyalari indirme, yukleme yapma ya da dosyalara goz atma.",
  IC011Q05TA = "Okulda: Okulun internet sitesine yaptigim urunleri yukleme.",
  IC011Q06TA = "Okulda: Okulda simulasyon programi kullanma.",
  IC011Q07TA = "Okulda: Yabanci dil ogrenirken veya matetamatik dersi icin pratik yapma ve tekrarlar yapma.",
  IC011Q08TA = "Okulda: Okul bilgisayarinda ev odevini yapma.",
  IC011Q09TA = "Okulda: Grup calismalari ve okul arkadaslari ile iletisim kurmak icin okul bilgisayarlarini kullanma.",
  IC011Q10HA = "Okulda: Egitim uygulamalarini ya da egitici internet sitelerini kullanma.",

  IC013Q01NA="Dijital cihazlari kullanirken zamanin nasil gectigini unuturum.",
  IC013Q04NA="İlgilendigim bilgileri bulmak icin internet buyuk bir kaynaktir (or. haberler, spor,sozluk gibi).",
  IC013Q05NA="İnternetteki sosyal aglar cok faydali.",
  IC013Q11NA="Yeni dijital cihazlar veya uygulamalari ilk kez kurcalarken cok heyecanlanirim.",
  IC013Q12NA="İnternet baglantisi olmadiginda kendimi gercekten kotu hissederim.",
  IC013Q13NA="Dijital cihazlari kullanmayi seviyorum.",

  IC014Q03NA="cok aliskin olmadigim dijital cihazlari kullanirken kendimi rahat hissederim.",
  IC014Q04NA="Arkadaslarim ve akrabalarim yeni dijital cihazlar ya da uygulamalar satin almak istediklerinde onlara oneride bulunabilirim.",
  IC014Q06NA="Evde dijital cihazlari kullanirken rahat hissederim.",
  IC014Q08NA="Dijital cihazlarla ilgili bir sorunla karsilastigimda bu sorunu cozebilecegimi dusunurum.",
  IC014Q09NA="Arkadaslarim ve akrabalarim, dijital cihazlarla ilgili sorunla karsilastiklarinda onlara yardimci olabilirim.",

  IC015Q02NA="Yeni bir yazilim programina ihtiyac duyarsam bu programi kendim yukleyebilirim.",
  IC015Q03NA="Dijital cihazlari kullanma konusunda baskasina bagimli olmamak icin bu cihazlar hakkinda bir seyler okurum.",
  IC015Q05NA="Dijital cihazlari kullanmak istedigim icin kullaniyorum.",
  IC015Q07NA="Herhangi bir dijital cihazla ilgili sorunla karsilasirsam sorunu kendi basima cozmeye calisirim.",
  IC015Q09NA="Yeni bir yazilim programina ihtiyac duyarsam bu programi kendim secebilirim.",

  IC016Q01NA="Dijital cihazlarla ilgili yeni bir seyler ogrenmek icin bu urunler hakkinda arkadaslarimla konusmayi severim.",
  IC016Q02NA="İnternette diger insanlarla, dijital cihazlarla ilgili sorunlarin cozumleri hakkinda fikir paylasimi yapmayi severim.",
  IC016Q04NA="Arkadaslarla bulusarak birlikte bilgisayar ve video oyunlari oynamayi severim.",
  IC016Q05NA="Dijital cihazlarla ilgili bilgileri arkadaslarimla paylasmayi severim.",
  IC016Q07NA="Arkadaslarim ve akrabalarim ile tartisarak dijital medya hakkinda cok fazla sey ogrenirim.",

  IC169Q01HA="Haberleri (or. siyaset, kultur, spor, yerel haberler) nasil okudugunuzu en iyi sekilde tanimlar?"
)


var_label(PISA_OGR_2018) <- list(
  Anne_Egitim = "Anne Egitim_ISCED",
  Baba_Egitim = "Baba Egitim _ISCED",
  Ebeveyn_egitimi ="En Yuksek Ebeveyn egitimi",
  Anne_DIL = "Evde test dilini konusmayan ogrenciler icin anneleriyle konusulan dil",
  Baba_DIL = "Evde test dilini konusmayan ogrenciler icin babalariyla konusulan dil",
  Kardes_DIL = "Evde test dilini konusmayan ogrenciler icin kardesleriyle konusulan dil",
  Arkadas_DIL = "Evde test dilini konusmayan ogrenciler icin arkadaslariyla konusulan dil",
  O_Arkadas_DIL = "Evde test dilini konusmayan ogrenciler icin okul arkadaslariyla konusulan dil",
  Gocmenlik = "Gocmenlik durumu indeksi",
  Okuloncesi_yil = "Erken cocukluk egitiminde gecen sure",
  Sinif_tekrari = "Sinif tekrari",
  Beklenen_Mesleki_Statu =  "ogrencinin beklenen mesleki statusu",
  Ogrenme_zamani_mat = "ogrenme zamani (haftalik dakika) - <Matematik>",
  Ogrenme_zamani_turkce = "ogrenme zamani (haftalik dakika) - <Test Dili>",
  Ogrenme_zamani_fen = "ogrenme zamani (haftalik dakika) - <Fen Bilimleri>",
  Ogrenme_zamani_toplam = "ogrenme zamani (haftalik dakika) - <Toplam>",
  SES = "Sosyo-ekonomik duzey indeksi",
  MC_Anlama_Hatirlama = "Meta-bilis: anlama ve hatirlama",
  MC_Ozetleme = "Meta-bilis: ozetleme",
  MC_Degerlendirme = "Meta-bilis: guvenirligi degerlendirme",
  BIT_EV = "Evde Kullanilan Bilisim Teknolojileri",
  BIT_OKL = "Okulda Kullanilan Bilisim Teknolojileri",
  EVSEL_ESYA = "Evdeki esyalar indeksi",
  KULTUREL_KAYNAK = "Evdeki kulturel esyalar indeksi",
  EGITIMSEL_KAYNAK = "Evdeki egitimsel kaynaklar indeksi",
  ZENGINLIK = "Aile zenginligi",
  BIT_KAYNAK = "Bilisim Teknolojileri Kaynaklari",
  DISIPLIN = "Turkce derslerinde disiplin iklimi (WLE)",
  OGR_DESTEK = "Turkce derslerinde ogretmen destegi",
  OGR_YONLENDIRME =  "ogretmen yonlendirmeli egitim (WLE)",
  GERI_BILDIRIM = "Algilanan geri bildirim",
  DUYGUSAL_DESTEK ="Ebeveynlerin ogrenci tarafindan algilanan duygusal destegi",
  OKUMA_BAGLILIGI = "ogretmenin ogrenci tarafindan algilanan okuma katilimini tesvik etmesi",
  TALIMAT_UYAR = "Talimatin uyarlanmasi",
  OGR_ILGISI = "Algilanan ogretmen ilgisi",
  OKUMA_ZEVK = "Okumaya karsi duyulan zevk",
  OK_YETERLIK = "Okuma oz kavrami: Yeterlilik algisi",
  OK_ZORLUK = "Okuma oz kavrami: Zorluk algisi",
  ALGILANAN_PISA_ZORLUK = "Algilanan PISA zorlugu",
  ALGILANAN_REKABET  = "Okulda rekabetcilik algisi",
  ALGILANAN_ISBIRLIGI = "Okulda isbirligi algisi",
  OKUL_TUTUM = "Okula karsi tutum: ogrenme etkinlikleri",
  REKABET = "Rekabet gucu",
  USTALIK = "Calisma Ustaligi",
  BASARISIZLIK_KORKUSU = "Genel Basarisizlik Korkusu",
  EUDMO = "Eudaemonia: yasamin anlami",
  IYI_OLUS = "oznel esenlik: Olumlu etki (WLE)",
  DAYANIKLIK =  "DAYANIKLIK",
  KURSOR_OZYET = "Kuresel sorunlarla ilgili oz yeterlik",
  KURSOR_FARKINDALIK = "ogrencinin kuresel sorunlar konusundaki farkindaligi",
  GOCMENLIK_TUTUM = "ogrencilerin gocmenlere yonelik tutumlari (WLE)",
  KULTURLERE_ILGI = "ogrencinin diger kulturleri ogrenmeye olan ilgisi (WLE)",
  BAKIS_ACISI = "Bakis acisi edinme",
  BILISSEL_ESNEKLIK = "Bilissel esneklik / uyarlanabilirlik ",
  KULTURLERE_SAYGI =  "Diger kulturlerden insanlara saygi",
  ILETISIM_FARKINDALIK = "Kulturlerarasi iletisim bilinci (WLE)",
  KURESEL_FIKIR =  "Kuresel fikirlilik ",
  AYRIMCI_IKLIM =  "Ayrimci okul iklimi (WLE)",
  AIDIYET=	"oznel iyi olus: Okula aidiyet duygusu",
  ZORBALIK=	"ogrencinin zorbaliga maruz kalma deneyimi",
  BIT_BOSZAMAN=	"Okul disinda BİT kullanimi (bos zaman) ",
  BIT_OKULDISI=	"BİT'in okul disinda kullanimi (okul calismalari icin)",
  BIT_OKUL=	"Okulda genel olarak BİT kullanimi",
  BIT_ILGI=	"BIT'e ilgi",
  BIT_YET=	"Algilanan BİT yeterliligi",
  BIT_OZERK=	"BİT kullanimiyla ilgili algilanan ozerklik",
  BIT_SOSYAL=	"Sosyal etkilesimde bir konu olarak BİT",
  BIT_DERS=	"Dersler sirasinda konu ile ilgili BİT kullanimi",
  BIT_DERSDISI= "Ders disinda konu ile ilgili BİT kullanimi"
)

Faktor_deg <- sapply(PISA_OGR_2018,attr,"labels")
Faktor_deg_null <- unlist(lapply(Faktor_deg,is.null))
Faktor_deg_dolu <- Faktor_deg_null[Faktor_deg_null == FALSE]
PISA_OGR_2018[,names(Faktor_deg_dolu)]


Faktor_duzeyi <-sapply(PISA_OGR_2018[,names(Faktor_deg_dolu)],attr,"labels")

Faktor_duzeyi <- unlist(lapply(Faktor_duzeyi,length))
Faktor_duzeyi[order(Faktor_duzeyi)]

Faktor_duzeyi_4 <-names(Faktor_duzeyi[Faktor_duzeyi == 4])
Faktor_duzeyi_6 <-names(Faktor_duzeyi[Faktor_duzeyi == 6])
Faktor_duzeyi_7 <-names(Faktor_duzeyi[Faktor_duzeyi == 7])
Faktor_duzeyi_8 <-names(Faktor_duzeyi[Faktor_duzeyi == 8])
Faktor_duzeyi_9 <-names(Faktor_duzeyi[Faktor_duzeyi == 9])
Faktor_duzeyi_10 <-names(Faktor_duzeyi[Faktor_duzeyi == 10])
Faktor_duzeyi_11 <-names(Faktor_duzeyi[Faktor_duzeyi == 11])
Faktor_duzeyi_12 <-names(Faktor_duzeyi[Faktor_duzeyi == 12])
Faktor_duzeyi_13 <-names(Faktor_duzeyi[Faktor_duzeyi == 13])
Faktor_duzeyi_14 <-names(Faktor_duzeyi[Faktor_duzeyi == 14])
Faktor_duzeyi_16 <-names(Faktor_duzeyi[Faktor_duzeyi == 16])
Faktor_duzeyi_137 <-names(Faktor_duzeyi[Faktor_duzeyi == 137])
table(PISA_OGR_2018$Program)

labels_4_fak <- lapply(PISA_OGR_2018[,Faktor_duzeyi_4],attr,"labels")
labels_4_list <- unlist(lapply(lapply(labels_4_fak, function(x) x[1]),labels))
unique(labels_4_fak)

Faktor_duzeyi_4 <- sapply(PISA_OGR_2018[,names(Faktor_duzeyi[Faktor_duzeyi == 4])],attr,"labels")

val_labels(PISA_OGR_2018[,Faktor_duzeyi_4]) <- NULL
# Faktor_duzeyi_4_9995 <- Faktor_duzeyi_4[,Faktor_duzeyi_4[1,] == 9995]
# Faktor_duzeyi_4_95<- Faktor_duzeyi_4[,Faktor_duzeyi_4[1,] == 95]
# Faktor_duzeyi_4_99995<- Faktor_duzeyi_4[,Faktor_duzeyi_4[1,] == 99995]
# Faktor_duzeyi_4_995<- Faktor_duzeyi_4[,Faktor_duzeyi_4[1,] == 995]
# val_labels(PISA_OGR_2018[,colnames(Faktor_duzeyi_4_9995)]) <- c("Gecerli Atlama"=9995, "Gecerli Degil"=9997,"Gecersiz"=9998,"Yanit Yok" = 9999)
# val_labels(PISA_OGR_2018[,colnames(Faktor_duzeyi_4_95)]) <- c("Gecerli Atlama"=95, "Gecerli Degil"=97,"Gecersiz"=98,"Yanit Yok" = 99)
# val_labels(PISA_OGR_2018[,colnames(Faktor_duzeyi_4_99995)]) <- c("Gecerli Atlama"=99995, "Gecerli Degil"=99997,"Gecersiz"=99998,"Yanit Yok" = 99999)
# val_labels(PISA_OGR_2018[,colnames(Faktor_duzeyi_4_995)]) <- c("Gecerli Atlama"=995, "Gecerli Degil"=997,"Gecersiz"=998,"Yanit Yok" = 999)
# val_labels(PISA_OGR_2018[,colnames(Faktor_duzeyi_4_995)]) <- c("Gecerli Atlama"=995, "Gecerli Degil"=997,"Gecersiz"=998,"Yanit Yok" = 999)


labels_6_fak <- lapply(PISA_OGR_2018[,Faktor_duzeyi_6],attr,"labels")
labels_6_list <- unlist(lapply(lapply(labels_6_fak, function(x) x[1]),labels))
unique(labels_6_fak)


val_labels(PISA_OGR_2018[,names(labels_6_list[labels_6_list == "Female" ])]) <-
  c("Kiz"=1, "Erkek"=2
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,
    #                                     "Gecersiz" = 8,"Yanit Yok" = 9
  )
val_labels(PISA_OGR_2018[,names(labels_6_list[labels_6_list == "Yes" ])]) <-
  c("Evet"=1, "Hayir"=2
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,
    # "Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_6_list[labels_6_list == "Country of test" ])]) <-
  c("Testin yapildigi ulke"=1, "Diger ulke"=2
    # "Gecerli Atlama"=95,"Gecerli Degil" = 97,
    # "Gecersiz" = 98,"Yanit Yok" = 99
  )


val_labels(PISA_OGR_2018[,names(labels_6_list[labels_6_list == "Language of the test" ])]) <-
  c("Testin yapildigi dil"=1, "Diger dil"=2
    # "Gecerli Atlama"=95,"Gecerli Degil" = 97,
    # "Gecersiz" = 98,"Yanit Yok" = 99
  )

val_labels(PISA_OGR_2018[,names(labels_6_list[labels_6_list == "Did not repeat a  grade" ])]) <-
  c("Sinif tekrari yapmadi"=0, "Sinif tekrari yapti"=1
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,
    # "Gecersiz" = 8,"Yanit Yok" = 9
  )

labels_7_fak <- lapply(PISA_OGR_2018[,Faktor_duzeyi_7],attr,"labels")
labels_7_list <- unlist(lapply(lapply(labels_7_fak, function(x) x[1]),labels))
unique(labels_7_list)

val_labels(PISA_OGR_2018[,names(labels_7_list[labels_7_list == "No, never"  ])]) <-  c("Hayir, hicbir zaman"=1,
                                                                                       "Evet, bir kez"=2,"Evet, iki veya daha fazla"=3
                                                                                       # "Gecerli Atlama" = 5,
                                                                                       #    "Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok"=9
)

val_labels(PISA_OGR_2018[,names(labels_7_list[labels_7_list ==  "Yes, and I use it"  ])])  <-
  c("Var ve kullaniyorum"=1, "Var ama kullanmiyorum"=2,"Yok" =3
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_7_list[labels_7_list ==   "Mostly their heritage language"  ])])<-
  c("cogunlukla ana dilimizi"=1, "Ana dilimizi ve Turkceyi ayni siklikta"=2,"cogunlukla Turkceyi" =3
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,c("Gocmenlik")]) <- c("Yerli"=1, "İkinci Nesil"=2,"Birinci Nesil" =3
                                                # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
)


labels_8_fak <- lapply(PISA_OGR_2018[,Faktor_duzeyi_8],attr,"labels")
labels_8_list <- unlist(lapply(lapply(labels_8_fak, function(x) x[1]),labels))
unique(labels_8_list)

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "None" ])]) <-
  c("Yok"=1, "Bir"=2,"İki" =3,"uc veya daha fazla"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )


val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "Mostly my  heritage language" ])]) <-
  c("cogunlukla ana dilimizi"=1, "Kendi ana dilimizi ve test dili ayni siklikta"=2,"cogunlukla Turkceyi" =3,
    "Gecerli Degi-test dili ve kendi dili ayni"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "Every lesson" ])]) <-
  c("Her ders"=1, "Derslerin cogunda"=2,"cogunlukla test dili" =3,"Bazi derslerde"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "Strongly disagree" ])]) <-
  c("Kesinlikle katilmiyorum"=1, "Katilmiyorum"=2,"Katiliyorum" =3,"Kesinlikle katiliyorum"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "Never or almost never" ])]) <-
  c("Hic veya hemen hemen hic"=1, "Bazi derslerde"=2,"Derslerin cogunda" =3,
    "Her derste ya da hemen hemen her derste"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "Never or almost never" ])]) <-
  c("Hic veya hemen hemen hic"=1, "Bazi derslerde"=2,"Derslerin cogunda" =3,
    "Her derste ya da hemen hemen her derste"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )


val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "Many times" ])]) <-
  c("Bircok kez"=1, "İki ya da uc kez"=2,"Bir kere" =3,
    "Her derste ya da hemen hemen her derste"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "Never or hardly ever" ])]) <-
  c("Hic ya da hemen hemen hic"=1, "Bazi derslerde "=2,"Derslerin cogunda" =3,
    "Her derste"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "I rarely or never read books." ])]) <-
  c("Hic ya da cok nadiren kitap okurum."=1, "Basili haldeki kitaplari daha cok okurum."=2,
    "Dijital cihazlardaki (e-kitap okuyucu, tablet, akilli telefon, bilgisayar gibi) kitaplari daha cok okurum." =3,
    "Basili ve dijital cihazlardan ayni siklikta kitap okurum."=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )



val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "Strongly agree" ])]) <-
  c("Kesinlikle katilmiyorum"=4, "Katilmiyorum"=3,"Katiliyorum" =2,"Kesinlikle katiliyorum"=1
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "Never" ])]) <-
  c("Her zaman"=4, "Bazen"=3,"Nadiren" =2,"Hic"=1
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "I couldn't do this" ])]) <-
  c("Bunu yapamam"=1,"Bunu tek basima yapmakta zorlanirim"=2,"Biraz cabayla bunu yapabilirim"=3,
    "Bunu kolaylikla yapabilirim"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )


val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "I have never heard of this" ])]) <-
  c("Bunu daha once hic duymadim."=1,"Bunu daha once duydum ama gercekten neyle ilgili oldugunu aciklayamam."=2,
    "Bunun hakkinda bir seyler biliyorum ve genel olarak aciklayabilirim."=3,
    "Bunu iyi biliyorum ve cok iyi aciklayabilirim."=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )


val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "One" ])]) <-
  c("Bir"=1,"İki"=2,
    "uc"=3,
    "Dort veya daha fazla"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )

val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list == "To none or almost none of them"])]) <-
  c("Hicbiri ya da hemen hemen hicbirine"=1,"Bazilarina"=2,
    "coguna"=3,
    "Hepsine ya da hemen hemen hepsine"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )


val_labels(PISA_OGR_2018[,names(labels_8_list[labels_8_list ==  "Not at all true"])]) <-
  c("Kesinlikle dogru degil"=1,"Kismen dogru"=2,
    "Dogru"=3,
    "Kesinlikle dogru"=4
    # "Gecerli Atlama"=5,"Gecerli Degil" = 7,"Gecersiz" = 8,"Yanit Yok" = 9
  )


labels_9_fak <- lapply(PISA_OGR_2018[,Faktor_duzeyi_9],attr,"labels")
labels_9_list <- unlist(lapply(lapply(labels_9_fak, function(x) x[1]),labels))
unique(labels_9_list)
names(labels_9_list[labels_9_list == "ISCED level 3A"  ])

val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==   "ISCED level 3A"  ])]) <-
  c("Genel Lise/ Anadolu Lisesi/ Fen Lisesi/ Sosyal Bilimler Lisesi/ Guzel Sanatlar Lisesi/ Spor Lisesi/İmam Hatip Lisesi"=1,
    "Meslek Lisesi/ Anadolu Meslek Lisesi/ Teknik Lise/ Anadolu Teknik Lisesi/cok Programli Lise"=2,
    "Ortaokul"=3, "İlkokul"=4,
    "İlkokulu tamamlamadi"=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )

PISA_OGR_2018$ANNE_OKUL

val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==   "Never or almost never"   ])]) <-
  c("Hic ya da hemen hemen hic"=1,
    "Yilda birkac defa"=2,
    "Ayda yaklasik bir kez"=3,
    "Ayda bircok kez"=4,
    "Haftada bircok kez"=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )



val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==   "I do not read for enjoyment"   ])]) <-
  c("Zevk icin okumuyorum"=1,
    "Gunde 30 dakika veya daha az"=2,
    "Gunde 30 - 60 dk arasi"=3,
    "Gunde 1 veya 2 saat"=4,
    "Gunde 2 saatten fazla"=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )


val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==   "I don't know what it is"   ])]) <-
  c("Ne oldugunu bilmiyorum"=1,
    "Hic ya da hemen hemen hic"=2,
    "Ayda bircok kez"=3,
    "Haftada bircok kez"=4,
    "Gunde bircok kez"=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )

val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==   "Not at all true of me"    ])]) <-
  c("Kesinlikle dogru degil"=1,
    "Kismen dogru"=2,
    "Dogru"=3,
    "Oldukca dogru"=4,
    "Kesinlikle dogru"=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )

val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==    "Very much like me"   ])]) <-
  c("cok iyi"=1,
    "İyi"=2,
    "Kismen"=3,
    "cok az"=4,
    "Hic"=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )

val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==    "No time"   ])]) <-
  c("Hic"=1,
    "Haftada 1-30 dakika"=2,
    "Haftada 31-60 dakika"=3,
    "Haftada 60 dakikadan daha fazla"=4,
    "Bu dersi almiyorum"=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )

val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==    "Yes, both the teacher and students used it"  ])]) <-
  c("Evet, hem ogretmen hem de ogrenciler tarafindan kullanildi"=1,
    "Evet, sadece ogrenciler tarafindan kullanildi"=2,
    "Evet, sadece ogretmen tarafindan kullanildi"=3,
    "Hayir"=4,
    "Bu dersi almiyorum"=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )



val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==    "Never or hardly ever"    ])]) <-
  c("Hic ya da hemen hemen hic"=1,
    "Ayda bir ya da iki kez"=2,
    "Haftada bir ya da iki kez"=3,
    "Hemen hemen her gun"=4,
    "Her gun"=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )


val_labels(PISA_OGR_2018[,names(labels_9_list[labels_9_list ==   "I do not follow the news at all."    ])]) <-
  c("Haberleri hic takip etmem."=1,
    "Haberleri (or. radyo, televizyon, internet ortami) sadece izler ya da dinlerim."=2,
    "Haberleri, dijital cihazlardan (or. tablet, akilli telefon, bilgisayar gibi) daha cok okurum."=3,
    "Haberleri, basili sekilde (or. gazeteler, dergiler gibi) daha cok okurum."=4,
    "Basili ve dijital cihazlardan ayni siklikta haber okurum."=5
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )


labels_10_fak <- lapply(PISA_OGR_2018[,Faktor_duzeyi_10],attr,"labels")
labels_10_list <- unlist(lapply(lapply(labels_10_fak, function(x) x[1]),labels))
unique(labels_10_list)
names(labels_10_list[labels_10_list ==  "One page or less" ])

PISA_OGR_2018$IC002Q01HA

val_labels(PISA_OGR_2018[,names(labels_10_list[labels_10_list ==   "0-10 books"     ])]) <-
  c("0-10 kitap"=1,
    "11-25 kitap"=2,
    "26-100 kitap"=3,
    "101-200 kitap"=4,
    "201-500 kitap"=5,
    "500 kitaptan fazla"=6
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )

val_labels(PISA_OGR_2018[,names(labels_10_list[labels_10_list ==    "One page or less"     ])]) <-
  c("Bir sayfa ya da daha az"=1,
    "2 ile 10 sayfa arasinda"=2,
    "11 ile 50 sayfa arasinda"=3,
    "51 ile 100 sayfa arasinda"=4,
    "101 ile 500 sayfa arasinda"=5,
    "500 sayfadan fazla"=6
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )

val_labels(PISA_OGR_2018[,names(labels_10_list[labels_10_list ==    "Not useful at all(1)"    ])]) <-
  c("Hic yararli degil(1)"=1,
    "(2)"=2,
    "(3)"=3,
    "(4)"=4,
    "(5)"=5,
    "cok yararli(6)"=6
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )


val_labels(PISA_OGR_2018[,names(labels_10_list[labels_10_list ==     "Not appropriate at all(1)"])]) <-
  c("Hic uygun degil(1)"=1,
    "(2)"=2,
    "(3)"=3,
    "(4)"=4,
    "(5)"=5,
    "cok uygun(6)"=6
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )



val_labels(PISA_OGR_2018[,names(labels_10_list[labels_10_list =="3 years old or younger" ])]) <-
  c("3 yasinda veya daha kucuk"=1,
    "4-6 yasinda"=2,
    "7-9 yasinda"=3,
    "10-12 yasinda"=4,
    "13 yasinda veya daha buyuk"=5,
    "Bugune kadar dijital bir cihaz hic kullanmadim"=6
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )


PISA_OGR_2018$Okuloncesi_yil <- dplyr::recode(PISA_OGR_2018$Okuloncesi_yil,`0` = 0L,`1` = 1L, `2` = 2L,
                                              `3` = 3L,`4` = 3L,`5` = 3L,`6` = 3L,`7` = 3L,
                                              `8` = 3L)

val_labels(PISA_OGR_2018$Okuloncesi_yil) <-
  c("1 yildan az"=0,
    "2 yildan az"=1,
    "3 yildan az"=2,
    "3 yil ve daha fazla"=3)


labels_11_fak <- lapply(PISA_OGR_2018[,Faktor_duzeyi_11],attr,"labels")
labels_11_list <- unlist(lapply(lapply(labels_11_fak, function(x) x[1]),labels))
unique(labels_11_list)
names(labels_11_list[labels_10_list ==  "One page or less" ])

val_labels(PISA_OGR_2018[,names(labels_11_list[labels_11_list =="None" ])]) <-
  c("Okul oncesi"=0,
    "Ilkokul"=1,
    "Ortaokul"=2,
    "Lise"=3,
    "Onlisans"=4,
    "Lisans"=5,
    "Lisans ustu"=6
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )


val_labels(PISA_OGR_2018[,names(labels_11_list[labels_11_list =="Grade 7" ])]) <-
  c("SINIF 7"=7,
    "SINIF 8"=8,
    "SINIF 9"=9,
    "SINIF 10"=10,
    "SINIF 11"=11,
    "SINIF 12"=12,
    "SINIF 13"=13
    # "Gecerli Atlama" = 95,"Gecerli Degil" = 97,"Gecersiz" = 98,"Yanit Yok" = 99
  )




val_labels(PISA_OGR_2018$Program) <-
  c("Ortaokul"="07920001" ,
    "Lise"="07920002",
    "Meslek Lisesi"="07920003"
  )



val_labels(PISA_OGR_2018$OKUL_TUR) <-c(
  "Anadolu Lisesi - A" = "TUR0108",
  "Anadolu Lisesi - B" = "TUR0109",
  "Anadolu Lisesi - C" = "TUR0110",
  "Anadolu Lisesi - D" = "TUR0111",
  "Anadolu Lisesi - E" = "TUR0112",
  "Anadolu Lisesi - F" = "TUR0113",
  "Anadolu Lisesi - G" = "TUR0114",
  "Anadolu Lisesi - H" = "TUR0115",
  "Anadolu Lisesi - I" = "TUR0116",
  "Anadolu Lisesi - J" = "TUR0117",
  "Mesleki ve Teknik Anadolu Lisesi - A" = "TUR0227",
  "Mesleki ve Teknik Anadolu Lisesi - B" = "TUR0228",
  "Mesleki ve Teknik Anadolu Lisesi - C" = "TUR0229",
  "Mesleki ve Teknik Anadolu Lisesi - D" = "TUR0230",
  "Mesleki ve Teknik Anadolu Lisesi - E" = "TUR0231",
  "Mesleki ve Teknik Anadolu Lisesi - F" = "TUR0232",
  "Mesleki ve Teknik Anadolu Lisesi - G" = "TUR0233",
  "Mesleki ve Teknik Anadolu Lisesi - H" = "TUR0234",
  "Mesleki ve Teknik Anadolu Lisesi - I" = "TUR0235",
  "cok Programli Anadolu Lisesi - A"     = "TUR0236",
  "cok Programli Anadolu Lisesi - B"     = "TUR0237",
  "cok Programli Anadolu Lisesi - C"     = "TUR0238",
  "cok Programli Anadolu Lisesi - D"     = "TUR0239",
  "Ortaokul"     = "TUR0301",
  "Fen Lisesi - A"     = "TUR0302",
  "Fen Lisesi - B"     = "TUR0303",
  "Fen Lisesi - C"     = "TUR0304",
  "Sosyal Bilimler Lisesi - A"     = "TUR0305",
  "Sosyal Bilimler Lisesi - B"     = "TUR0306",
  "Sosyal Bilimler Lisesi - C"     = "TUR0307",
  "Anadolu Imam Hatip Lisesi - A" = "TUR0318",
  "Anadolu Imam Hatip Lisesi - B" = "TUR0319",
  "Anadolu Imam Hatip Lisesi - C" = "TUR0320",
  "Anadolu Imam Hatip Lisesi - D" = "TUR0321",
  "Anadolu Imam Hatip Lisesi - E" = "TUR0322",
  "Anadolu Imam Hatip Lisesi - F" = "TUR0323",
  "Anadolu Imam Hatip Lisesi - G" = "TUR0324",
  "Anadolu Imam Hatip Lisesi - H" = "TUR0325",
  "Anadolu Guzel Sanatlar Lisesi" = "TUR0326"
)


val_labels(PISA_OGR_2018$OKUL_TUR)

save(PISA_OGR_2018,file="PISA_OGR_2018.Rda")


