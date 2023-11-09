/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 110 (55 per locale)
///
/// Built on 2023-11-09 at 01:26 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	pt(languageCode: 'pt', build: _StringsPt.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsToastEn toast = _StringsToastEn._(_root);
	late final _StringsLoginPageEn loginPage = _StringsLoginPageEn._(_root);
	late final _StringsHomePageEn homePage = _StringsHomePageEn._(_root);
	late final _StringsSearchPageEn searchPage = _StringsSearchPageEn._(_root);
	late final _StringsProfilePageEn profilePage = _StringsProfilePageEn._(_root);
	late final _StringsLicensesPageEn licensesPage = _StringsLicensesPageEn._(_root);
	late final _StringsMoviePageEn moviePage = _StringsMoviePageEn._(_root);
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsCommonBottomNavBarEn bottomNavBar = _StringsCommonBottomNavBarEn._(_root);
	late final _StringsCommonSideDrawerEn sideDrawer = _StringsCommonSideDrawerEn._(_root);
}

// Path: toast
class _StringsToastEn {
	_StringsToastEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsToastMoviesEn movies = _StringsToastMoviesEn._(_root);
	late final _StringsToastHelpersEn helpers = _StringsToastHelpersEn._(_root);
}

// Path: loginPage
class _StringsLoginPageEn {
	_StringsLoginPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Review films you\'ve watched. Save those you want to see.';
	String get subtitle => 'Welcome to Flickmemo. Let\'s start your lists!';
	String get googleButton => 'Continue with Google';
}

// Path: homePage
class _StringsHomePageEn {
	_StringsHomePageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String title({required Object name}) => 'Hey, ${name}!';
	String get subtitle => 'Here are some recommendations for you.';
	late final _StringsHomePageMovieCardsEn movieCards = _StringsHomePageMovieCardsEn._(_root);
}

// Path: searchPage
class _StringsSearchPageEn {
	_StringsSearchPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsSearchPageHeaderEn header = _StringsSearchPageHeaderEn._(_root);
	late final _StringsSearchPageBodyEn body = _StringsSearchPageBodyEn._(_root);
}

// Path: profilePage
class _StringsProfilePageEn {
	_StringsProfilePageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsProfilePageHeaderEn header = _StringsProfilePageHeaderEn._(_root);
	late final _StringsProfilePageFavoriteMoviesEn favoriteMovies = _StringsProfilePageFavoriteMoviesEn._(_root);
	late final _StringsProfilePageRecentMoviesEn recentMovies = _StringsProfilePageRecentMoviesEn._(_root);
}

// Path: licensesPage
class _StringsLicensesPageEn {
	_StringsLicensesPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Licenses';
}

// Path: moviePage
class _StringsMoviePageEn {
	_StringsMoviePageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsMoviePageBodyEn body = _StringsMoviePageBodyEn._(_root);
}

// Path: common.bottomNavBar
class _StringsCommonBottomNavBarEn {
	_StringsCommonBottomNavBarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get search => 'Search';
	String get profile => 'Profile';
}

// Path: common.sideDrawer
class _StringsCommonSideDrawerEn {
	_StringsCommonSideDrawerEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsCommonSideDrawerLogOutDialogEn logOutDialog = _StringsCommonSideDrawerLogOutDialogEn._(_root);
	late final _StringsCommonSideDrawerOptionsEn options = _StringsCommonSideDrawerOptionsEn._(_root);
}

// Path: toast.movies
class _StringsToastMoviesEn {
	_StringsToastMoviesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get movieAddedToWatchlist => 'Movie added to your watchlist';
	String get movieAlreadyOnWatchlist => 'This movie is already in your watchlist';
	String get failedtoAddToWatchlist => 'Something went wrong when adding this movie to your watchlist. Please, try again';
	String get movieRemovedFromWatchlist => 'Movie removed from your watchlist';
	String get failedtoRemoveFromWatchlist => 'Something went wrong when removing this movie from your watchlist. Please, try again';
}

// Path: toast.helpers
class _StringsToastHelpersEn {
	_StringsToastHelpersEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get emailFailed => 'Could not launch email. Please, try again.';
	String get emailSubject => 'Hello! I want to talk about Flickmemo';
	String get emailBody => 'Here you write a nice message for me :)';
	String get imdbFailed => 'Could not launch IMDb page. Please, try again.';
}

// Path: homePage.movieCards
class _StringsHomePageMovieCardsEn {
	_StringsHomePageMovieCardsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get error => 'Oops, something went wrong! Please try again.';
	String get empty => 'There are no movies to show';
	late final _StringsHomePageMovieCardsNoMoreMoviesEn noMoreMovies = _StringsHomePageMovieCardsNoMoreMoviesEn._(_root);
}

// Path: searchPage.header
class _StringsSearchPageHeaderEn {
	_StringsSearchPageHeaderEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Search by the movie\'s title';
	String get searchBarPlaceholder => 'Search for movies...';
}

// Path: searchPage.body
class _StringsSearchPageBodyEn {
	_StringsSearchPageBodyEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Trending Movies';
	String get subtitle => 'Get in touch with the latest releases.';
	String get error => 'Oops, something went wrong! Please try again.';
	String get empty => 'There are no movies to show';
}

// Path: profilePage.header
class _StringsProfilePageHeaderEn {
	_StringsProfilePageHeaderEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String profileCreation({required Object date}) => 'User since ${date}';
	late final _StringsProfilePageHeaderCountsEn counts = _StringsProfilePageHeaderCountsEn._(_root);
}

// Path: profilePage.favoriteMovies
class _StringsProfilePageFavoriteMoviesEn {
	_StringsProfilePageFavoriteMoviesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Favorite Movies';
	String get empty => 'There are no favorite movies';
}

// Path: profilePage.recentMovies
class _StringsProfilePageRecentMoviesEn {
	_StringsProfilePageRecentMoviesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Recent Movies';
	String get subtitle => 'Your recent reviews and watchlist\'s movies';
	String get empty => 'There are no recent movies';
}

// Path: moviePage.body
class _StringsMoviePageBodyEn {
	_StringsMoviePageBodyEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsMoviePageBodyOverviewEn overview = _StringsMoviePageBodyOverviewEn._(_root);
	late final _StringsMoviePageBodyStatsEn stats = _StringsMoviePageBodyStatsEn._(_root);
	String get reviews => 'Reviews';
	String get similarMovies => 'Similar Movies';
	String get emptyReviews => 'There are no reviews to show.';
}

// Path: common.sideDrawer.logOutDialog
class _StringsCommonSideDrawerLogOutDialogEn {
	_StringsCommonSideDrawerLogOutDialogEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Logging out';
	String get content => 'Are you sure you want to log out?';
	String get cancel => 'No';
	String get confirm => 'Yes';
}

// Path: common.sideDrawer.options
class _StringsCommonSideDrawerOptionsEn {
	_StringsCommonSideDrawerOptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get changeLanguage => 'Change language';
	String get licenses => 'Licenses';
	String get logOut => 'Log out';
	String get developer => 'Talk with the developer';
}

// Path: homePage.movieCards.noMoreMovies
class _StringsHomePageMovieCardsNoMoreMoviesEn {
	_StringsHomePageMovieCardsNoMoreMoviesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Wow, we ran out of movies!';
	String get subtitle => 'Try to re-enter the page to see more movies.';
}

// Path: profilePage.header.counts
class _StringsProfilePageHeaderCountsEn {
	_StringsProfilePageHeaderCountsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get watched => 'Watched';
	String get favorites => 'Favorites';
	String get watchlist => 'Watchlist';
}

// Path: moviePage.body.overview
class _StringsMoviePageBodyOverviewEn {
	_StringsMoviePageBodyOverviewEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Overview';
	String get readMore => 'Read more';
	String get showLess => 'Show less';
}

// Path: moviePage.body.stats
class _StringsMoviePageBodyStatsEn {
	_StringsMoviePageBodyStatsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get popularity => 'POPULARITY';
	String get imdbLink => 'SEE IT ON IMDB';
	String get visitImdb => 'Visit';
	String get releaseDate => 'RELEASE DATE';
}

// Path: <root>
class _StringsPt implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsPt _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsCommonPt common = _StringsCommonPt._(_root);
	@override late final _StringsToastPt toast = _StringsToastPt._(_root);
	@override late final _StringsLoginPagePt loginPage = _StringsLoginPagePt._(_root);
	@override late final _StringsHomePagePt homePage = _StringsHomePagePt._(_root);
	@override late final _StringsSearchPagePt searchPage = _StringsSearchPagePt._(_root);
	@override late final _StringsProfilePagePt profilePage = _StringsProfilePagePt._(_root);
	@override late final _StringsLicensesPagePt licensesPage = _StringsLicensesPagePt._(_root);
	@override late final _StringsMoviePagePt moviePage = _StringsMoviePagePt._(_root);
}

// Path: common
class _StringsCommonPt implements _StringsCommonEn {
	_StringsCommonPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsCommonBottomNavBarPt bottomNavBar = _StringsCommonBottomNavBarPt._(_root);
	@override late final _StringsCommonSideDrawerPt sideDrawer = _StringsCommonSideDrawerPt._(_root);
}

// Path: toast
class _StringsToastPt implements _StringsToastEn {
	_StringsToastPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsToastMoviesPt movies = _StringsToastMoviesPt._(_root);
	@override late final _StringsToastHelpersPt helpers = _StringsToastHelpersPt._(_root);
}

// Path: loginPage
class _StringsLoginPagePt implements _StringsLoginPageEn {
	_StringsLoginPagePt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Organize seus filmes favoritos. Descubra novos.';
	@override String get subtitle => 'Boas-vindas ao Flickmemo. Vamos começas suas listas!';
	@override String get googleButton => 'Continuar com Google';
}

// Path: homePage
class _StringsHomePagePt implements _StringsHomePageEn {
	_StringsHomePagePt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String title({required Object name}) => 'Olá, ${name}!';
	@override String get subtitle => 'Aqui estão algumas recomendações para você.';
	@override late final _StringsHomePageMovieCardsPt movieCards = _StringsHomePageMovieCardsPt._(_root);
}

// Path: searchPage
class _StringsSearchPagePt implements _StringsSearchPageEn {
	_StringsSearchPagePt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsSearchPageHeaderPt header = _StringsSearchPageHeaderPt._(_root);
	@override late final _StringsSearchPageBodyPt body = _StringsSearchPageBodyPt._(_root);
}

// Path: profilePage
class _StringsProfilePagePt implements _StringsProfilePageEn {
	_StringsProfilePagePt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsProfilePageHeaderPt header = _StringsProfilePageHeaderPt._(_root);
	@override late final _StringsProfilePageFavoriteMoviesPt favoriteMovies = _StringsProfilePageFavoriteMoviesPt._(_root);
	@override late final _StringsProfilePageRecentMoviesPt recentMovies = _StringsProfilePageRecentMoviesPt._(_root);
}

// Path: licensesPage
class _StringsLicensesPagePt implements _StringsLicensesPageEn {
	_StringsLicensesPagePt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Licenças';
}

// Path: moviePage
class _StringsMoviePagePt implements _StringsMoviePageEn {
	_StringsMoviePagePt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsMoviePageBodyPt body = _StringsMoviePageBodyPt._(_root);
}

// Path: common.bottomNavBar
class _StringsCommonBottomNavBarPt implements _StringsCommonBottomNavBarEn {
	_StringsCommonBottomNavBarPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Início';
	@override String get search => 'Pesquisar';
	@override String get profile => 'Perfil';
}

// Path: common.sideDrawer
class _StringsCommonSideDrawerPt implements _StringsCommonSideDrawerEn {
	_StringsCommonSideDrawerPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsCommonSideDrawerLogOutDialogPt logOutDialog = _StringsCommonSideDrawerLogOutDialogPt._(_root);
	@override late final _StringsCommonSideDrawerOptionsPt options = _StringsCommonSideDrawerOptionsPt._(_root);
}

// Path: toast.movies
class _StringsToastMoviesPt implements _StringsToastMoviesEn {
	_StringsToastMoviesPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get movieAddedToWatchlist => 'Filme adicionado à sua watchlist';
	@override String get movieAlreadyOnWatchlist => 'Este filme já está em sua watchlist';
	@override String get failedtoAddToWatchlist => 'Ocorreu um erro ao adicionar o filme à sua watchlist. Por favor, tente novamente';
	@override String get movieRemovedFromWatchlist => 'Filme removido da sua watchlist';
	@override String get failedtoRemoveFromWatchlist => 'Ocorreu um erro ao remover o filme da sua watchlist. Por favor, tente novamente';
}

// Path: toast.helpers
class _StringsToastHelpersPt implements _StringsToastHelpersEn {
	_StringsToastHelpersPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get emailFailed => 'Não foi possível abrir o e-mail. Por favor, tente novamente.';
	@override String get emailSubject => 'Olá! Quero falar sobre o Flickmemo';
	@override String get emailBody => 'Aqui você escreve uma mensagem legal para mim :)';
	@override String get imdbFailed => 'Não foi possível acessar o IMDB. Por favor, tente novamente.';
}

// Path: homePage.movieCards
class _StringsHomePageMovieCardsPt implements _StringsHomePageMovieCardsEn {
	_StringsHomePageMovieCardsPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get error => 'Oops, algo deu errado! Por favor, tente novamente.';
	@override String get empty => 'Não existem filmes para exibir';
	@override late final _StringsHomePageMovieCardsNoMoreMoviesPt noMoreMovies = _StringsHomePageMovieCardsNoMoreMoviesPt._(_root);
}

// Path: searchPage.header
class _StringsSearchPageHeaderPt implements _StringsSearchPageHeaderEn {
	_StringsSearchPageHeaderPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pesquise pelo título do filme';
	@override String get searchBarPlaceholder => 'Pesquise por filmes...';
}

// Path: searchPage.body
class _StringsSearchPageBodyPt implements _StringsSearchPageBodyEn {
	_StringsSearchPageBodyPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filmes em alta';
	@override String get subtitle => 'Fique atualizado com os últimos lançamentos.';
	@override String get error => 'Oops, algo deu errado! Por favor, tente novamente.';
	@override String get empty => 'Não há filmes para serem exibidos';
}

// Path: profilePage.header
class _StringsProfilePageHeaderPt implements _StringsProfilePageHeaderEn {
	_StringsProfilePageHeaderPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String profileCreation({required Object date}) => 'Entrou em ${date}';
	@override late final _StringsProfilePageHeaderCountsPt counts = _StringsProfilePageHeaderCountsPt._(_root);
}

// Path: profilePage.favoriteMovies
class _StringsProfilePageFavoriteMoviesPt implements _StringsProfilePageFavoriteMoviesEn {
	_StringsProfilePageFavoriteMoviesPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filmes favoritos';
	@override String get empty => 'Não há filmes favoritos';
}

// Path: profilePage.recentMovies
class _StringsProfilePageRecentMoviesPt implements _StringsProfilePageRecentMoviesEn {
	_StringsProfilePageRecentMoviesPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filmes recentes';
	@override String get subtitle => 'Suas reviews mais recentes e filmes da watchlist';
	@override String get empty => 'Não há filmes recentes';
}

// Path: moviePage.body
class _StringsMoviePageBodyPt implements _StringsMoviePageBodyEn {
	_StringsMoviePageBodyPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override late final _StringsMoviePageBodyOverviewPt overview = _StringsMoviePageBodyOverviewPt._(_root);
	@override late final _StringsMoviePageBodyStatsPt stats = _StringsMoviePageBodyStatsPt._(_root);
	@override String get reviews => 'Reviews';
	@override String get similarMovies => 'Filmes similares';
	@override String get emptyReviews => 'Não há reviews para mostrar.';
}

// Path: common.sideDrawer.logOutDialog
class _StringsCommonSideDrawerLogOutDialogPt implements _StringsCommonSideDrawerLogOutDialogEn {
	_StringsCommonSideDrawerLogOutDialogPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Saindo da conta';
	@override String get content => 'Tem certeza que deseja sair da conta?';
	@override String get cancel => 'Não';
	@override String get confirm => 'Sim';
}

// Path: common.sideDrawer.options
class _StringsCommonSideDrawerOptionsPt implements _StringsCommonSideDrawerOptionsEn {
	_StringsCommonSideDrawerOptionsPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get changeLanguage => 'Mudar idioma';
	@override String get licenses => 'Licenças';
	@override String get logOut => 'Sair';
	@override String get developer => 'Falar com o desenvolvedor';
}

// Path: homePage.movieCards.noMoreMovies
class _StringsHomePageMovieCardsNoMoreMoviesPt implements _StringsHomePageMovieCardsNoMoreMoviesEn {
	_StringsHomePageMovieCardsNoMoreMoviesPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wow, ficamos sem filmes!';
	@override String get subtitle => 'Tente reentrar na página para ver mais filmes.';
}

// Path: profilePage.header.counts
class _StringsProfilePageHeaderCountsPt implements _StringsProfilePageHeaderCountsEn {
	_StringsProfilePageHeaderCountsPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get watched => 'Assistidos';
	@override String get favorites => 'Favoritos';
	@override String get watchlist => 'Vou assistir';
}

// Path: moviePage.body.overview
class _StringsMoviePageBodyOverviewPt implements _StringsMoviePageBodyOverviewEn {
	_StringsMoviePageBodyOverviewPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sinopse';
	@override String get readMore => 'Ler mais';
	@override String get showLess => 'Mostrar menos';
}

// Path: moviePage.body.stats
class _StringsMoviePageBodyStatsPt implements _StringsMoviePageBodyStatsEn {
	_StringsMoviePageBodyStatsPt._(this._root);

	@override final _StringsPt _root; // ignore: unused_field

	// Translations
	@override String get popularity => 'POPULARIDADE';
	@override String get imdbLink => 'VER NO IMDB';
	@override String get visitImdb => 'Visitar';
	@override String get releaseDate => 'LANÇAMENTO';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.bottomNavBar.home': return 'Home';
			case 'common.bottomNavBar.search': return 'Search';
			case 'common.bottomNavBar.profile': return 'Profile';
			case 'common.sideDrawer.logOutDialog.title': return 'Logging out';
			case 'common.sideDrawer.logOutDialog.content': return 'Are you sure you want to log out?';
			case 'common.sideDrawer.logOutDialog.cancel': return 'No';
			case 'common.sideDrawer.logOutDialog.confirm': return 'Yes';
			case 'common.sideDrawer.options.changeLanguage': return 'Change language';
			case 'common.sideDrawer.options.licenses': return 'Licenses';
			case 'common.sideDrawer.options.logOut': return 'Log out';
			case 'common.sideDrawer.options.developer': return 'Talk with the developer';
			case 'toast.movies.movieAddedToWatchlist': return 'Movie added to your watchlist';
			case 'toast.movies.movieAlreadyOnWatchlist': return 'This movie is already in your watchlist';
			case 'toast.movies.failedtoAddToWatchlist': return 'Something went wrong when adding this movie to your watchlist. Please, try again';
			case 'toast.movies.movieRemovedFromWatchlist': return 'Movie removed from your watchlist';
			case 'toast.movies.failedtoRemoveFromWatchlist': return 'Something went wrong when removing this movie from your watchlist. Please, try again';
			case 'toast.helpers.emailFailed': return 'Could not launch email. Please, try again.';
			case 'toast.helpers.emailSubject': return 'Hello! I want to talk about Flickmemo';
			case 'toast.helpers.emailBody': return 'Here you write a nice message for me :)';
			case 'toast.helpers.imdbFailed': return 'Could not launch IMDb page. Please, try again.';
			case 'loginPage.title': return 'Review films you\'ve watched. Save those you want to see.';
			case 'loginPage.subtitle': return 'Welcome to Flickmemo. Let\'s start your lists!';
			case 'loginPage.googleButton': return 'Continue with Google';
			case 'homePage.title': return ({required Object name}) => 'Hey, ${name}!';
			case 'homePage.subtitle': return 'Here are some recommendations for you.';
			case 'homePage.movieCards.error': return 'Oops, something went wrong! Please try again.';
			case 'homePage.movieCards.empty': return 'There are no movies to show';
			case 'homePage.movieCards.noMoreMovies.title': return 'Wow, we ran out of movies!';
			case 'homePage.movieCards.noMoreMovies.subtitle': return 'Try to re-enter the page to see more movies.';
			case 'searchPage.header.title': return 'Search by the movie\'s title';
			case 'searchPage.header.searchBarPlaceholder': return 'Search for movies...';
			case 'searchPage.body.title': return 'Trending Movies';
			case 'searchPage.body.subtitle': return 'Get in touch with the latest releases.';
			case 'searchPage.body.error': return 'Oops, something went wrong! Please try again.';
			case 'searchPage.body.empty': return 'There are no movies to show';
			case 'profilePage.header.profileCreation': return ({required Object date}) => 'User since ${date}';
			case 'profilePage.header.counts.watched': return 'Watched';
			case 'profilePage.header.counts.favorites': return 'Favorites';
			case 'profilePage.header.counts.watchlist': return 'Watchlist';
			case 'profilePage.favoriteMovies.title': return 'Favorite Movies';
			case 'profilePage.favoriteMovies.empty': return 'There are no favorite movies';
			case 'profilePage.recentMovies.title': return 'Recent Movies';
			case 'profilePage.recentMovies.subtitle': return 'Your recent reviews and watchlist\'s movies';
			case 'profilePage.recentMovies.empty': return 'There are no recent movies';
			case 'licensesPage.title': return 'Licenses';
			case 'moviePage.body.overview.title': return 'Overview';
			case 'moviePage.body.overview.readMore': return 'Read more';
			case 'moviePage.body.overview.showLess': return 'Show less';
			case 'moviePage.body.stats.popularity': return 'POPULARITY';
			case 'moviePage.body.stats.imdbLink': return 'SEE IT ON IMDB';
			case 'moviePage.body.stats.visitImdb': return 'Visit';
			case 'moviePage.body.stats.releaseDate': return 'RELEASE DATE';
			case 'moviePage.body.reviews': return 'Reviews';
			case 'moviePage.body.similarMovies': return 'Similar Movies';
			case 'moviePage.body.emptyReviews': return 'There are no reviews to show.';
			default: return null;
		}
	}
}

extension on _StringsPt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.bottomNavBar.home': return 'Início';
			case 'common.bottomNavBar.search': return 'Pesquisar';
			case 'common.bottomNavBar.profile': return 'Perfil';
			case 'common.sideDrawer.logOutDialog.title': return 'Saindo da conta';
			case 'common.sideDrawer.logOutDialog.content': return 'Tem certeza que deseja sair da conta?';
			case 'common.sideDrawer.logOutDialog.cancel': return 'Não';
			case 'common.sideDrawer.logOutDialog.confirm': return 'Sim';
			case 'common.sideDrawer.options.changeLanguage': return 'Mudar idioma';
			case 'common.sideDrawer.options.licenses': return 'Licenças';
			case 'common.sideDrawer.options.logOut': return 'Sair';
			case 'common.sideDrawer.options.developer': return 'Falar com o desenvolvedor';
			case 'toast.movies.movieAddedToWatchlist': return 'Filme adicionado à sua watchlist';
			case 'toast.movies.movieAlreadyOnWatchlist': return 'Este filme já está em sua watchlist';
			case 'toast.movies.failedtoAddToWatchlist': return 'Ocorreu um erro ao adicionar o filme à sua watchlist. Por favor, tente novamente';
			case 'toast.movies.movieRemovedFromWatchlist': return 'Filme removido da sua watchlist';
			case 'toast.movies.failedtoRemoveFromWatchlist': return 'Ocorreu um erro ao remover o filme da sua watchlist. Por favor, tente novamente';
			case 'toast.helpers.emailFailed': return 'Não foi possível abrir o e-mail. Por favor, tente novamente.';
			case 'toast.helpers.emailSubject': return 'Olá! Quero falar sobre o Flickmemo';
			case 'toast.helpers.emailBody': return 'Aqui você escreve uma mensagem legal para mim :)';
			case 'toast.helpers.imdbFailed': return 'Não foi possível acessar o IMDB. Por favor, tente novamente.';
			case 'loginPage.title': return 'Organize seus filmes favoritos. Descubra novos.';
			case 'loginPage.subtitle': return 'Boas-vindas ao Flickmemo. Vamos começas suas listas!';
			case 'loginPage.googleButton': return 'Continuar com Google';
			case 'homePage.title': return ({required Object name}) => 'Olá, ${name}!';
			case 'homePage.subtitle': return 'Aqui estão algumas recomendações para você.';
			case 'homePage.movieCards.error': return 'Oops, algo deu errado! Por favor, tente novamente.';
			case 'homePage.movieCards.empty': return 'Não existem filmes para exibir';
			case 'homePage.movieCards.noMoreMovies.title': return 'Wow, ficamos sem filmes!';
			case 'homePage.movieCards.noMoreMovies.subtitle': return 'Tente reentrar na página para ver mais filmes.';
			case 'searchPage.header.title': return 'Pesquise pelo título do filme';
			case 'searchPage.header.searchBarPlaceholder': return 'Pesquise por filmes...';
			case 'searchPage.body.title': return 'Filmes em alta';
			case 'searchPage.body.subtitle': return 'Fique atualizado com os últimos lançamentos.';
			case 'searchPage.body.error': return 'Oops, algo deu errado! Por favor, tente novamente.';
			case 'searchPage.body.empty': return 'Não há filmes para serem exibidos';
			case 'profilePage.header.profileCreation': return ({required Object date}) => 'Entrou em ${date}';
			case 'profilePage.header.counts.watched': return 'Assistidos';
			case 'profilePage.header.counts.favorites': return 'Favoritos';
			case 'profilePage.header.counts.watchlist': return 'Vou assistir';
			case 'profilePage.favoriteMovies.title': return 'Filmes favoritos';
			case 'profilePage.favoriteMovies.empty': return 'Não há filmes favoritos';
			case 'profilePage.recentMovies.title': return 'Filmes recentes';
			case 'profilePage.recentMovies.subtitle': return 'Suas reviews mais recentes e filmes da watchlist';
			case 'profilePage.recentMovies.empty': return 'Não há filmes recentes';
			case 'licensesPage.title': return 'Licenças';
			case 'moviePage.body.overview.title': return 'Sinopse';
			case 'moviePage.body.overview.readMore': return 'Ler mais';
			case 'moviePage.body.overview.showLess': return 'Mostrar menos';
			case 'moviePage.body.stats.popularity': return 'POPULARIDADE';
			case 'moviePage.body.stats.imdbLink': return 'VER NO IMDB';
			case 'moviePage.body.stats.visitImdb': return 'Visitar';
			case 'moviePage.body.stats.releaseDate': return 'LANÇAMENTO';
			case 'moviePage.body.reviews': return 'Reviews';
			case 'moviePage.body.similarMovies': return 'Filmes similares';
			case 'moviePage.body.emptyReviews': return 'Não há reviews para mostrar.';
			default: return null;
		}
	}
}
