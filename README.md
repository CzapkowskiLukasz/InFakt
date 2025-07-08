Aplikacja mobilna oparta o WebView, służąca do autoryzacji i korzystania z konta użytkownika na platformie InFakt.

🔐 Logowanie i autologowanie
Po naciśnięciu przycisku, użytkownik zostaje przekierowany do strony logowania w WebView.
Jeśli na stronie logowania zaznaczony zostanie checkbox "Zapamiętaj mnie", aplikacja:
aktywuje automatyczne logowanie z wykorzystaniem Face ID przez kolejne 14 dni,
zapisuje tę informację lokalnie (z datą ważności autologowania),
uruchamia systemową push notyfikację po 10 sekundach, informującą użytkownika do kiedy autologowanie będzie aktywne.

🧠 W skrócie
✅ Wsparcie dla Face ID po stronie użytkownika.
✅ Obsługa lokalnych notyfikacji.
✅ Prosty interfejs oparty na WebView.
✅ Zapamiętywanie preferencji użytkownika z wykorzystaniem UserDefaults.


A mobile application based on WebView, designed for user authentication and access to the InFakt platform.

🔐 Login & Auto-login
When the login button is tapped, the user is redirected to the authentication page displayed in a WebView.
If the "Remember me" checkbox is selected on the login page, the app will:

enable automatic login using Face ID for the next 14 days,
store this preference locally (along with the expiration date),
trigger a local push notification after 10 seconds, informing the user of the auto-login expiration date.
🧠 At a Glance
✅ Support for Face ID authentication.
✅ Local push notification integration.
✅ Clean interface powered by WebView.
✅ User preference storage using UserDefaults.
