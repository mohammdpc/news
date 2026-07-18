# 📰 News — Flutter News Reader App

A cross‑platform news reader built with Flutter. It pulls live headlines from [NewsAPI.org](https://newsapi.org/), lets you browse by category, switch between news sources for that category, search across all articles, and read the full story in an in‑app browser. The UI supports both light and dark themes.

---

## 📸 Screenshots

### Home Screen

<table>
<tr>
<td align="center"><img src="screenshots/home%20light.png" width="220"></td>
<td align="center"><img src="screenshots/home%20dark.png" width="220"></td>
</tr>
</table>

Each news category (General, Business, Sport, Technology, Entertainment, Health, Science) gets its own card with a themed illustration and a **View All** button to jump into that category's feed. The screen instantly re‑themes between light and dark, driven by the app‑wide `SettingsBlock` cubit.

---

### App Drawer

<table>
<tr>
<td align="center"><img src="screenshots/drawer.png" width="220"></td>
</tr>
</table>

The side menu, opened from the hamburger icon on any screen. It provides a **Go To Home** shortcut, a **Theme** dropdown (Light/Dark), and a **Language** dropdown (English/Arabic) for switching app‑wide settings on the fly.

---

### Category Feed

<table>
<tr>
<td align="center"><img src="screenshots/news%20light.png" width="220"></td>
<td align="center"><img src="screenshots/news%20dark.png" width="220"></td>
</tr>
</table>

Shown after tapping into a category. Tabs across the top switch between the news **sources** available for that category (e.g. Ars Technica, Crypto Coins News, Engadget), and the feed below reloads with articles from whichever source is selected — each shown as a card with thumbnail, headline, author, and publish date.

---

### Search

<table>
<tr>
<td align="center"><img src="screenshots/search.png" width="220"></td>
</tr>
</table>

Accessible from the search icon in the top bar. Lets you free‑text search across all articles (not limited to one category or source), with live results shown in the same card‑style list used in the category feeds.

---

### Article Reader

<table>
<tr>
<td align="center"><img src="screenshots/card%20content.png" width="220"></td>
</tr>
</table>

Opened by tapping a card in any feed. It loads the original article page inside an in‑app WebView (with a back arrow and the article's title in the app bar), so you can read the full story without leaving the app.

---

### Article Card — Expanded

<table>
<tr>
<td align="center"><img src="screenshots/card%20expanded.png" width="220"></td>
</tr>
</table>

A closer look at an individual article card before it's tapped: the thumbnail, an "Enlarge" caption/credit line, a short excerpt of the article body, and a **View Full Article** button that opens the in‑app WebView reader shown above.

---

## 🧱 Technical Details

### Packages

| Package | Purpose |
|---|---|
| `flutter_bloc` / `bloc` | Cubits drive all screen state (`MianScreenViewModel`, `SettingsBlock`) |
| `http` | Calls to the NewsAPI REST endpoints |
| `cached_network_image` | Disk/memory caching of article thumbnails for smoother, offline‑friendly scrolling |
| `webview_flutter` | Renders the full article inside an in‑app browser when a card is tapped |
| `flutter_native_splash` | Generates native splash screens per platform |
| `provider` | Used internally by `flutter_bloc` to power `context.watch` / `context.read` |

Dart SDK constraint (from `pubspec.yaml`): `^3.10.7`

### API

The app is powered by **[NewsAPI.org](https://newsapi.org/)**, called from `lib/api/http_api.dart`:

- `getSources()` — fetches the list of available news sources for a given category.
- `getNewsData()` — fetches articles for a selected category/source.
- `searchNews()` — hits NewsAPI's `/v2/everything` endpoint for free‑text search across all articles.

Responses are parsed into the `NewsData` / `Articles` model (`lib/models/news_data.dart`) and the `Sources` model (`lib/models/sources_model.dart`).

### Code Architecture

The app follows a **Cubit‑per‑screen** pattern — a lightweight flavor of the BLoC architecture:

- **`MianScreenViewModel`** (`Cubit<MainScreenViewModelStates>`) owns navigation between the Home, Category, and Search views, and triggers the corresponding API calls.
- **`SettingsBlock`** (`Cubit<SettingsState>`) owns app‑wide theme and language state, provided at the top of the widget tree in `main.dart` so any screen can read or change it.
- Screens use `BlocBuilder` / `context.watch` to rebuild automatically when state changes, and `context.read` to dispatch actions (e.g. switching category, toggling theme).

Project layout:

```
lib/
├── api/            # NewsAPI base URL, endpoints, and HTTP calls
├── app utils/       # Asset paths, theme-aware colors, route names, shared text styles, responsive sizing helpers
├── blocks/          # SettingsBlock cubit (theme + language state)
├── models/          # NewsData/Articles and Sources response models
├── screens/         # Home Screen, Main Screen, News Screen, App Drawer, article/search screens
├── widgits/         # category_card, news_card, expanded_news_card, drop_down_menu_button
├── theme.dart        # Light/Dark ThemeData definitions
└── main.dart         # App entry point, providers setup
```

Layouts are built to be responsive across device sizes using custom `widthOf()` / `heightOf()` helpers that scale UI elements relative to a 393×852 reference screen.

### Supported Platforms

The repository contains platform scaffolding for **Android, iOS, Linux, macOS, Windows, and Web**.
