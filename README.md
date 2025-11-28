Ürün Katalog Uygulaması
Bu proje, Flutter ile geliştirilmiş basit bir ürün listeleme ve detay gösterme mobil uygulamasıdır. Uygulama; ürünlerin bir listede gösterilmesini, tıklandığında ürün detay sayfasına yönlendirilmesini ve dinamik rota yönetimi (dynamic routing) konularını kapsamaktadır.

Genel Bakış
Uygulama, bir ana sayfada önceden tanımlanmış ürünlerin bir listesini sunar. Kullanıcı herhangi bir ürüne tıkladığında, onGenerateRoute kullanılarak dinamik olarak oluşturulan ürün detay sayfasına yönlendirilir.

Eğer geçersiz bir ID veya rota ile yönlendirme denenirse, kullanıcı bir "Sayfa Bulunamadı" (404) ekranına yönlendirilir.

Özellikler
Ürün Listeleme: Ana sayfada ListView.separated ile ürünler listelenir.

Dinamik Rota Yönetimi: Rotalar, onGenerateRoute metodu kullanılarak çalışma zamanında (runtime) oluşturulur. Bu sayede /product rotasına id argümanı iletilerek ilgili ürünün detay sayfası açılır.

Argümanlı Yönlendirme: Navigator.pushNamed ile sayfa geçişlerinde veri (ürün ID'si) aktarılır.

Bilinmeyen Rota Kontrolü: onUnknownRoute ve onGenerateRoute içindeki kontroller sayesinde geçersiz veya tanımsız rotalara yapılan istekler yakalanarak kullanıcı NotFoundPage'e yönlendirilir.

Geri Dönen Değeri Kullanma: Ürün detay sayfasından geri dönüldüğünde SnackBar ile kullanıcıya bilgi mesajı gösterilir.

Hata Sayfası: Geçersiz yönlendirmeler için özel bir 404 hata sayfası mevcuttur.

Ekranlar
1. Ana Sayfa (HomePage)

Ürünlerin listelendiği ana ekrandır.

Her bir ürün ListTile olarak gösterilir.

Sağ altta bulunan FloatingActionButton, 404 sayfasını test etmek için bir kısayol sunar.

2. Ürün Detay Sayfası (ProductDetail)

onGenerateRoute tarafından dinamik olarak oluşturulur.

Yönlendirme sırasında gönderilen id argümanını alarak ilgili ürünü gösterir (Bu projedeki product_detail.dart dosyasında bu mantığın tamamlanması beklenir).

3. Sayfa Bulunamadı (NotFoundPage)

Tanımsız veya hatalı bir rotaya gidilmeye çalışıldığında kullanıcıya gösterilen ekrandır.

Teknik Detaylar ve Kod Yapısı
main.dart: Uygulamanın giriş noktasıdır. MaterialApp widget'ı burada yapılandırılır.

onGenerateRoute: Uygulamanın en kritik yönlendirme mantığını içerir.

Gelen rotanın adı (settings.name) kontrol edilir.

Eğer rota /product ise, gelen argümanın (settings.arguments) bir int olup olmadığı doğrulanır.

Koşullar sağlanırsa MaterialPageRoute ile ProductDetail sayfası oluşturulur ve prodid parametresi olarak iletilir.

Koşullar sağlanmazsa, NotFoundPage sayfasına yönlendirme yapılır.

onUnknownRoute: onGenerateRoute tarafından işlenemeyen veya routes haritasında bulunmayan tüm rotaları yakalar ve NotFoundPage'e yönlendirir.

_navigateAndDisplaySnackBar Fonksiyonu:

Navigator.pushNamed kullanarak argümanlı sayfa geçişi yapar.

await ile detay sayfasından geri dönülecek değeri bekler.

Geri dönen bir değer varsa (result != null), bu değeri bir SnackBar içinde gösterir.