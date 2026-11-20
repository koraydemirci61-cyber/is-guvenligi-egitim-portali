# Destek Bilişim — İş Sağlığı ve Güvenliği Eğitimi Oturum Planlama Portalı

Yerel ağda (intranet / ev Wi-Fi / VPN) çalışan, departman şeflerinin tek bağlantı üzerinden personellerinin eğitim oturumlarını belirlemesini ve yöneticinin Excel raporu almasını sağlayan **FastAPI + SQLite** tabanlı bağımsız web uygulamasıdır.

---

## 🌟 Öne Çıkan Özellikler

1. **Şefler İçin Tek Link ve Parolasız Giriş:**
   - Şeflerin şifre veya TC/sicil numarası girmesine gerek yoktur.
   - Tek bir linke (`http://<IP_ADRESI>:8090/`) girip departmanını seçer; personelleri hazır liste olarak gelir.
2. **KVKK & Kişisel Veri Gizliliği Güvencesi:**
   - Departman şeflerinin tarayıcısına **kesinlikle T.C. Kimlik No veya Sicil No gönderilmez**.
   - Şefler sadece personelin Ad-Soyad ve İşyeri bilgisini görür.
   - Yönetici Excel dökümü aldığında ise resmi T.C. Kimlik No ve Sicil No raporda eksiksiz yer alır.
3. **4 Oturum Seçeneği & Mazeret Girişi:**
   - Personel için belirlenen 4 oturum saatinden biri tek tıkla seçilebilir.
   - Eğitime katılamayacak personel için **Katılamayacak** seçeneği işaretlenip zorunlu kısa mazeret açıklaması girilebilir.
4. **Yönetim Paneli & Excel Raporu:**
   - `http://localhost:8090/yonetim` adresinden seans saatleri yönetilebilir, kayıtlar kilitlenebilir.
   - Tek tıkla **Katılım Listesi** ve **Oturum Özeti** sayfalarını içeren kurumsal `.xlsx` raporu indirilebilir.
5. **Ağ Desteği:**
   - Ev veya ofis ağındaki tüm cihazlardan (telefon, tablet, dizüstü) anında erişilebilir.

---

## 🚀 Evde ve Yerel Ağda Kurulum & Çalıştırma

### 1. Gereksinimler
- Bilgisayarınızda **Python 3.10 veya üzeri** kurulu olmalıdır ([python.org](https://www.python.org/downloads/) adresinden indirirken *"Add Python to PATH"* kutucuğunu işaretleyin).

### 2. İlk Kurulum (Yalnızca bir kez)
1. Klasördeki **`KURULUM.bat`** dosyasına çift tıklayın.
2. Script otomatik olarak `.venv` sanal ortamını oluşturur ve gerekli paketleri (`fastapi`, `uvicorn`, `jinja2`, `openpyxl`, vb.) yükler.

### 3. Portalı Başlatma
1. **`BASLAT.bat`** dosyasına çift tıklayın.
2. Konsol ekranında yerel IP adresiniz ve linkler görünecektir:
   - **Şeflerin / Kullanıcıların Gireceği Link:** `http://<BILGISAYAR_IP_ADRESI>:8090/`
   - **Yönetim Paneli (Excel & Ayar):** `http://127.0.0.1:8090/yonetim`
3. Tarayıcınız otomatik olarak açılacaktır.

---

## 📱 Ev Ağındaki Telefondan / Başka Cihazdan Giriş

1. Sunucuyu çalıştıran bilgisayar ile telefonunuzun **aynı ev Wi-Fi / ağa** bağlı olduğundan emin olun.
2. `BASLAT.bat` ekranında yazan IP adresini (Örneğin: `http://192.168.1.35:8090/`) telefonunuzun tarayıcısına yazın.
3. **Windows Güvenlik Duvarı:** Eğer telefondan açılamazsa, bilgisayarda Windows Defender Güvenlik Duvarı ekranında Python için "Özel Ağlar" iznini onaylayın veya 8090 portuna gelen bağlantılara izin verin.

---

## 📊 Excel ile Personel Yükleme & Test Verisi

Klasörde hazır test yapabilmeniz için örnek bir **`ornek_personel_sablonu.xlsx`** dosyası bulunmaktadır.

Komut satırından yeni personel listesi aktarmak için:
```powershell
python run_seans.py --import-excel ornek_personel_sablonu.xlsx
```
*(Not: Sistemde daha önce personel yüklüyse mevcut atamaların bozulmaması için yeniden yükleme kilitlidir; sıfırdan yüklemek için `data/seans_portal/seans.db` dosyasını silmeniz yeterlidir.)*

---

## 🧪 Otomatik Testleri Çalıştırma

Tüm iş kuralları, veri gizliliği, eşzamanlı kayıt ve Excel içe/dışa aktarım testlerini çalıştırmak için:
- **`TEST_CALISTIR.bat`** dosyasına çift tıklayın veya
- Terminalden:
```powershell
python -m unittest test_seans_portal.py -v
```

---

## 📁 Proje Dizin Yapısı

```text
is_guvenligi_egitim_portali/
├── BASLAT.bat                 # Sunucuyu baslatir ve tarayiciyi acar
├── KURULUM.bat                # Sanal ortami (.venv) ve paketleri kurar
├── TEST_CALISTIR.bat          # Otomatik birim/entegrasyon testlerini calistirir
├── requirements.txt           # Python bagimliliklari
├── run_seans.py               # Ana calistirici betik (LAN IP algilama, port yonetimi)
├── test_seans_portal.py       # 13 adet tam kapsamli otomatik test
├── ornek_personel_sablonu.xlsx# Test icin ornek personel Excel sablonu
├── README.md                  # Bu kullanim kilavuzu
├── data/
│   └── seans_portal/
│       └── seans.db           # SQLite veritabani (ilk calistirmada otomatik olusur)
└── seans_portal/              # Uygulama kaynak kodlari
    ├── __init__.py
    ├── app.py                 # FastAPI rota ve kontrolleri
    ├── database.py            # SQLite sema ve baglanti yonetimi
    ├── services.py            # Excel parse/export ve atama servisleri
    ├── static/                # CSS ve JavaScript dosyalari
    └── templates/             # Jinja2 HTML arayuz sablonlari
```

---

## 🛠️ Geliştirme Notları

- **Port Ayarı:** Varsayılan port `8090`'dır. Değiştirmek isterseniz `run_seans.py --port 8085` şeklinde çalıştırabilirsiniz.
- **Veritabanı:** `data/seans_portal/seans.db` dosyasında tutulur. WAL (Write-Ahead Logging) modunda çalışır, eşzamanlı yazmalarda kilitlenme yaşanmaz.
- **Güvenlik:** Şef arayüzü yalnızca gerekli alanları döner. İsim benzerlikleri için personel ID UUID tabanlıdır ve formüllü Excel girişleri engellenir.
