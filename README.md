# map_local_storage

# Map Local Storage Example

This is a Flutter example application that demonstrates how to use nested maps in Flutter and store them locally using `SharedPreferences`. It provides a simple user interface to add, update, and delete users from the nested map and displays the current state of the nested map on the screen.

## Features

- Add a user to the nested map
- Update a user's age in the nested map
- Delete a user from the nested map
- Local storage using `SharedPreferences` to persist the nested map data

## Screenshots

![Screenshot](screenshots/screenshot.png)

## Usage

To run this example application, follow these steps:

1. Clone this repository:

   ```bash
   git clone https://github.com/your-username/nested-map-example.git
   ```

2. Change to the project directory:

   ```bash
   cd nested-map-example
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## How It Works

This application uses the `NestedMapProvider` class to manage the nested map data and interact with `SharedPreferences` for local storage. The `NestedMapProvider` class extends the `ChangeNotifier` class and provides methods to add, update, and delete users in the nested map. It also initializes the nested map data from `SharedPreferences` when the app starts.

The main screen of the app displays the current state of the nested map using a `Consumer` widget. It provides buttons to add, update, and delete users, which open dialogs to enter user details. When a user action is performed, such as adding or updating a user, the corresponding method of the `NestedMapProvider` is called to update the nested map data. The UI is automatically updated using the `notifyListeners()` method, and the nested map data is saved to `SharedPreferences` for local storage.

## Dependencies

- `provider`: A state management library for Flutter.
- `shared_preferences`: A plugin for accessing and storing preferences.


---------------------------------------------------------------------------------------------------------------------------------------------------------------------


# İç İçe Map Örneği

Bu, Flutter örnek bir uygulamasıdır ve iç içe geçmiş haritaları nasıl kullanacağınızı ve bunları `SharedPreferences` kullanarak yerel olarak nasıl saklayacağınızı gösterir. Uygulama, iç içe geçmiş bir haritaya kullanıcı eklemek, güncellemek ve silmek için basit bir kullanıcı arayüzü sunar ve iç içe geçmiş haritanın mevcut durumunu ekranda görüntüler.

## Özellikler

- İç içe geçmiş bir haritaya kullanıcı eklemek
- İç içe geçmiş bir haritadaki bir kullanıcının yaşını güncellemek
- İç içe geçmiş bir haritadan kullanıcı silmek
- İç içe geçmiş harita verilerini saklamak için `SharedPreferences` kullanmak

## Ekran Görüntüleri

![Ekran Görüntüsü](screenshots/screenshot.png)

## Kullanım

Bu örnek uygulamayı çalıştırmak için aşağıdaki adımları izleyin

:

1. Bu depoyu klonlayın:

   ```bash
   git clone https://github.com/sizin-kullanıcı-adınız/ic-ice-harita-ornek.git
   ```

2. Proje dizinine geçin:

   ```bash
   cd ic-ice-harita-ornek
   ```

3. Bağımlılıkları yükleyin:

   ```bash
   flutter pub get
   ```

4. Uygulamayı çalıştırın:

   ```bash
   flutter run
   ```

## Nasıl Çalışır

Bu uygulama, iç içe geçmiş harita verilerini yönetmek ve yerel depolama için `SharedPreferences` ile etkileşimde bulunmak için `NestedMapProvider` sınıfını kullanır. `NestedMapProvider` sınıfı, `ChangeNotifier` sınıfını genişletir ve iç içe geçmiş harita verilerini eklemek, güncellemek ve silmek için yöntemler sağlar. Uygulama başladığında, iç içe geçmiş harita verileri `SharedPreferences`'den başlatılır.

Uygulamanın ana ekranı, `Consumer` bileşenini kullanarak iç içe geçmiş haritanın mevcut durumunu görüntüler. Kullanıcı eklemek, güncellemek ve silmek için düğmeler sağlar ve bu işlemleri gerçekleştirmek için iletişim kutuları açar. Kullanıcı eylemi gerçekleştirildiğinde, örneğin bir kullanıcı eklemek veya güncellemek için `NestedMapProvider`'ın ilgili yöntemi çağrılır ve iç içe geçmiş harita verileri güncellenir. UI, otomatik olarak `notifyListeners()` yöntemi kullanılarak güncellenir ve iç içe geçmiş harita verileri yerel depolama için `SharedPreferences`'e kaydedilir.

## Bağımlılıklar

- `provider`: Flutter için bir durum yönetimi kütüphanesi.
- `shared_preferences`: Tercihlere erişmek ve saklamak için bir eklenti.

## Lisans

Bu proje [MIT Lisansı](LICENSE) ile lisanslanmıştır.