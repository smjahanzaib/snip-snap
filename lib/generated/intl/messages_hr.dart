// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'hr';

  static m0(dow, day, month, year, time) =>
      "${dow}, ${day} ${month} ${year} u ${time}";

  static m1(sort) => "${Intl.select(sort, {
        'date_asc': 'Prvo najstarije',
        'date_desc': 'Prvo najnovije',
        'other': 'Ostalo',
      })}";

  static m2(status) => "${Intl.select(status, {
        'active': 'Aktivne',
        'completed': 'Završene',
        'other': 'Ostalo',
      })}";

  static m3(number) => "Pozvati ${number}?";

  static m4(current, total) => "Korak ${current} od ${total}";

  static m5(page) => "${Intl.select(page, {
        'page1': 'Odaberi usluge',
        'page2': 'Odaberi osoblje',
        'page3': 'Rezervacija',
        'page4': 'Potvrda',
        'other': '---',
      })}";

  static m6(from, to, total) => "Od ${from} do ${to} (${total})";

  static m7(name) => "${name} danas nije dostupan/na";

  static m8(name) => "Kod ${name}";

  static m9(status) => "${Intl.select(status, {
        'active': 'aktivno',
        'canceled': 'otkazano',
        'completed': 'završeno',
        'declined': 'odbijeno',
        'failed': 'neuspjelo',
        'other': '---',
      })}";

  static m10(value) => "\$${value}";

  static m11(mode) => "${Intl.select(mode, {
        'dynamic': 'Dinamičan',
        'alwaysOn': 'Uvijek uključeno',
        'alwaysOff': 'Uvijek isključeno',
        'other': '---',
      })}";

  static m12(value) => "${value} min";

  static m13(mins) => "za 1 sat, ${mins} min";

  static m14(hours) => "za 1 dan, ${hours} sati";

  static m15(days) => "za ${days} dana";

  static m16(hours) => "iza ${hours} h";

  static m17(mins) => "za ${mins} min";

  static m18(locale) => "${Intl.select(locale, {
        'ar': 'Arapski',
        'en': 'Engleski',
        'hr': 'Hrvatski',
        'other': 'Unknown',
      })}";

  static m19(day) => "${Intl.select(day, {
        'january': 'Siječanj',
        'february': 'Veljača',
        'march': 'Ožujak',
        'april': 'Travanj',
        'may': 'Svibanj',
        'june': 'Lipanj',
        'july': 'Srpanj',
        'august': 'Kolovoz',
        'september': 'Rujan',
        'october': 'Listopad',
        'november': 'Studeni',
        'december': 'Prosinac',
        'other': '---',
      })}";

  static m20(day) => "${Intl.select(day, {
        'january': 'Sij',
        'february': 'Vel',
        'march': 'Ožu',
        'april': 'Tra',
        'may': 'Svi',
        'june': 'Lip',
        'july': 'Srp',
        'august': 'Kol',
        'september': 'Ruj',
        'october': 'Lis',
        'november': 'Stu',
        'december': 'Pro',
        'other': '---',
      })}";

  static m21(source) => "${Intl.select(source, {
        'gallery': 'Fotogalerija',
        'camera': 'Kamera',
        'other': '---',
      })}";

  static m22(day) => "${Intl.select(day, {
        'monday': 'Ponedjeljak',
        'tuesday': 'Utorak',
        'wednesday': 'Srijeda',
        'thursday': 'Četvrtak',
        'friday': 'Petak',
        'saturday': 'Subota',
        'sunday': 'Nedjelja',
        'other': '---',
      })}";

  static m23(day) => "${Intl.select(day, {
        'monday': 'Pon',
        'tuesday': 'Uto',
        'wednesday': 'Sri',
        'thursday': 'Čet',
        'friday': 'Pet',
        'saturday': 'Sub',
        'sunday': 'Ned',
        'other': '---',
      })}";

  static m24(length) => "Min. duljina je ${length} znakova";

  static m25(name) => "Bok, ${name}!";

  static m26(code) =>
      "Upotrijebi kôd ${code} da bi uštedjeo 5 USD na prvim troškovima rezervacije.";

  static m27(num) => "Dostupnih usluga: ${num}";

  static m28(number) => "Nazvati broj ${number}?";

  static m29(date) => "Odgovorio je ${date}";

  static m30(num) => "${num} recenzija";

  static m31(num) => "Preostalo znamenki: ${num}";

  static m32(from, to) => "${from} - ${to} km";

  static m33(num) => "${num} + Zvijezde";

  static m34(num) => "Lokacije (${num})";

  static m35(length) =>
      "Lozinka mora imati najmanje ${length} znakova i mora sadržavati najmanje jedan broj i jedno veliko slovo.";

  static m36(date) => "Vrijedi do: ${date}";

  static m37(date) => "Isteklo: ${date}";

  static m38(date) => "Iskorišteno: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "addPaymentCardButton":
            MessageLookupByLibrary.simpleMessage("Dodaj karticu"),
        "addPaymentCardTitle":
            MessageLookupByLibrary.simpleMessage("Dodaj karticu"),
        "appointmentAt": m0,
        "appointmentCancelationConfirmation":
            MessageLookupByLibrary.simpleMessage(
                "Jeste li sigurni da želite otkazati ovu rezervaciju?"),
        "appointmentSubtitleNotes":
            MessageLookupByLibrary.simpleMessage("Napomene"),
        "appointmentSubtitleTotal":
            MessageLookupByLibrary.simpleMessage("UKUPNO"),
        "appointmentsBtnExplore":
            MessageLookupByLibrary.simpleMessage("Istraži salone u blizini"),
        "appointmentsLabelReview":
            MessageLookupByLibrary.simpleMessage("Ocijeni"),
        "appointmentsSort": m1,
        "appointmentsStatusGroup": m2,
        "appointmentsTitle":
            MessageLookupByLibrary.simpleMessage("Rezervacije"),
        "appointmentsWarningCompletedList":
            MessageLookupByLibrary.simpleMessage(
                "Nisu pronađene prethodne rezervacije."),
        "appointmentsWarningOtherList": MessageLookupByLibrary.simpleMessage(
            "Nije pronađena nijedna rezervacija koja se podudara s kriterijima pretraživanja."),
        "appointmentsWarningUpcomingList": MessageLookupByLibrary.simpleMessage(
            "Nisu pronađene predstojeće rezervacije."),
        "appointmentsWelcomeSignInBtn":
            MessageLookupByLibrary.simpleMessage("Prijavi se"),
        "appointmentsWelcomeSignInLabel":
            MessageLookupByLibrary.simpleMessage("Već si registriran?"),
        "appointmentsWelcomeSubtitle": MessageLookupByLibrary.simpleMessage(
            "Istraži i rezerviraj svoj prvi tretman"),
        "appointmentsWelcomeTitle":
            MessageLookupByLibrary.simpleMessage("Moje rezervacije"),
        "bookingAddNotes": MessageLookupByLibrary.simpleMessage(
            "Dodaj napomene o rezervaciji"),
        "bookingBtnCalendar": MessageLookupByLibrary.simpleMessage("Kalendar"),
        "bookingBtnCall": MessageLookupByLibrary.simpleMessage("Pozovi"),
        "bookingBtnCancel": MessageLookupByLibrary.simpleMessage("Otkaži"),
        "bookingBtnClose":
            MessageLookupByLibrary.simpleMessage("Ok, razumijem"),
        "bookingBtnConfirm": MessageLookupByLibrary.simpleMessage("Potvrdi"),
        "bookingBtnNext": MessageLookupByLibrary.simpleMessage("Dalje"),
        "bookingBtnNotes": MessageLookupByLibrary.simpleMessage("Napomene"),
        "bookingCallConfirmation": m3,
        "bookingLabelSteps": m4,
        "bookingMinutes": MessageLookupByLibrary.simpleMessage("min"),
        "bookingNoteslabel": MessageLookupByLibrary.simpleMessage(
            "Posebni zahtjevi za tvoju rezervaciju"),
        "bookingPayInStore":
            MessageLookupByLibrary.simpleMessage("Platite u Snip Snap"),
        "bookingPayWithCard":
            MessageLookupByLibrary.simpleMessage("Plati karticom"),
        "bookingSigninTitle":
            MessageLookupByLibrary.simpleMessage("Prijavi se za nastavak"),
        "bookingStaffNoPreferenceDescription":
            MessageLookupByLibrary.simpleMessage("Bilo tko"),
        "bookingStaffNoPreferenceName":
            MessageLookupByLibrary.simpleMessage("Bilo tko"),
        "bookingSubtitleAppointment":
            MessageLookupByLibrary.simpleMessage("Rezervacija"),
        "bookingSubtitleCancelationPolicy":
            MessageLookupByLibrary.simpleMessage("Politika otkazivanja"),
        "bookingSubtitleCheckout":
            MessageLookupByLibrary.simpleMessage("Naplata"),
        "bookingSubtitleDate": MessageLookupByLibrary.simpleMessage("Datum"),
        "bookingSubtitleLocation":
            MessageLookupByLibrary.simpleMessage("Mjesto"),
        "bookingSubtitleServices":
            MessageLookupByLibrary.simpleMessage("Usluge"),
        "bookingSubtitleSignin":
            MessageLookupByLibrary.simpleMessage("Prijavi se za nastavak"),
        "bookingSubtitleTime": MessageLookupByLibrary.simpleMessage("Vrijeme"),
        "bookingSuccessSubtitle": MessageLookupByLibrary.simpleMessage(
            "Ne trebaš raditi ništa drugo. Poslat ćemo ti podsjetnik prije termina rezervacije."),
        "bookingSuccessTitle":
            MessageLookupByLibrary.simpleMessage("Rezervacija potvrđena"),
        "bookingTitleWizardPage": m5,
        "bookingTotalTime": m6,
        "bookingWarningAppointment": MessageLookupByLibrary.simpleMessage(
            "Odaberi datum i vrijeme s popisa koji ti najviše odgovara."),
        "bookingWarningNoServices": MessageLookupByLibrary.simpleMessage(
            "Nijedna usluga nije dostupna"),
        "bookingWarningNoSlots":
            MessageLookupByLibrary.simpleMessage("Nema dostupnih mjesta"),
        "bookingWarningServices": MessageLookupByLibrary.simpleMessage(
            "Za nastavak odaberi barem jednu uslugu."),
        "bookingWarningStaffUnavailable": m7,
        "bookingWithStaff": m8,
        "chatOnlineLabel":
            MessageLookupByLibrary.simpleMessage("Trenutno na mreži"),
        "chatPlaceholder":
            MessageLookupByLibrary.simpleMessage("Upiši poruku ..."),
        "commonAppointmentStatus": m9,
        "commonBtnApply": MessageLookupByLibrary.simpleMessage("Primjeni"),
        "commonBtnCancel": MessageLookupByLibrary.simpleMessage("Otkaži"),
        "commonBtnClose": MessageLookupByLibrary.simpleMessage("Zatvori"),
        "commonBtnOk": MessageLookupByLibrary.simpleMessage("U redu"),
        "commonCurrencyFormat": m10,
        "commonDarkMode": m11,
        "commonDialogsErrorTitle": MessageLookupByLibrary.simpleMessage("Ups!"),
        "commonDurationFormat": m12,
        "commonElapseHhourMins": m13,
        "commonElapsedDayHours": m14,
        "commonElapsedDays": m15,
        "commonElapsedHours": m16,
        "commonElapsedMins": m17,
        "commonElapsedNow": MessageLookupByLibrary.simpleMessage("u procesu"),
        "commonGendersMen":
            MessageLookupByLibrary.simpleMessage("Samo muškarci"),
        "commonGendersUnisex": MessageLookupByLibrary.simpleMessage("Unisex"),
        "commonGendersWomen": MessageLookupByLibrary.simpleMessage("Samo žene"),
        "commonLocales": m18,
        "commonLocationFavorited": MessageLookupByLibrary.simpleMessage(
            "Lokacija je dodana na popis favorita."),
        "commonLocationUnfavorited": MessageLookupByLibrary.simpleMessage(
            "Lokacija je uklonjena s popisa favorita."),
        "commonMonthLong": m19,
        "commonMonthShort": m20,
        "commonPhotoSources": m21,
        "commonReadMore": MessageLookupByLibrary.simpleMessage("prikaži više"),
        "commonSearchSortTypeDistance":
            MessageLookupByLibrary.simpleMessage("Najbliže"),
        "commonSearchSortTypePopularity":
            MessageLookupByLibrary.simpleMessage("Najpopularniji"),
        "commonSearchSortTypePrice":
            MessageLookupByLibrary.simpleMessage("Najniža cijena"),
        "commonSearchSortTypeRating":
            MessageLookupByLibrary.simpleMessage("Najbolje ocijenjeno"),
        "commonSmartRefresherFooterCanLoadingText":
            MessageLookupByLibrary.simpleMessage(
                "Otpustite da biste učitali više"),
        "commonSmartRefresherFooterIdleText":
            MessageLookupByLibrary.simpleMessage("Povucite za više"),
        "commonSmartRefresherFooterLoadingText":
            MessageLookupByLibrary.simpleMessage("Učitavam..."),
        "commonSmartRefresherHeaderCompleteText":
            MessageLookupByLibrary.simpleMessage("Osvježavanje dovršeno"),
        "commonSmartRefresherHeaderIdleText":
            MessageLookupByLibrary.simpleMessage("Povuci dolje da se osvježi"),
        "commonSmartRefresherHeaderRefreshingText":
            MessageLookupByLibrary.simpleMessage("Osvježavanje..."),
        "commonSmartRefresherHeaderReleaseText":
            MessageLookupByLibrary.simpleMessage("Otpusti za osvježavanje"),
        "commonTooltipInfo": MessageLookupByLibrary.simpleMessage("Info"),
        "commonTooltipRefresh": MessageLookupByLibrary.simpleMessage("Osvježi"),
        "commonWeekdayLong": m22,
        "commonWeekdayShort": m23,
        "commonWeekdayToday": MessageLookupByLibrary.simpleMessage("Danas"),
        "commonWeekdayTomorrow": MessageLookupByLibrary.simpleMessage("Sutra"),
        "editProfileBtnUpdate":
            MessageLookupByLibrary.simpleMessage("Ažuriraj profil"),
        "editProfileLabelAddress":
            MessageLookupByLibrary.simpleMessage("Adresa"),
        "editProfileLabelCity": MessageLookupByLibrary.simpleMessage("Grad"),
        "editProfileLabelFullname":
            MessageLookupByLibrary.simpleMessage("Puno ime"),
        "editProfileLabelPhone":
            MessageLookupByLibrary.simpleMessage("Telefonski broj"),
        "editProfileLabelZIP": MessageLookupByLibrary.simpleMessage("Pošta"),
        "editProfileListTitleAddress":
            MessageLookupByLibrary.simpleMessage("Adresa"),
        "editProfileListTitleContact":
            MessageLookupByLibrary.simpleMessage("Kontakt"),
        "editProfileSuccess":
            MessageLookupByLibrary.simpleMessage("Profilni podaci ažurirani."),
        "editProfileTitle":
            MessageLookupByLibrary.simpleMessage("Uredi profil"),
        "emptyTitle":
            MessageLookupByLibrary.simpleMessage("(nije implementirano)"),
        "favoritesNoResults":
            MessageLookupByLibrary.simpleMessage("Popis omiljenih je prazan."),
        "favoritesTitle": MessageLookupByLibrary.simpleMessage("Moji omiljeni"),
        "favoritesTitleNoResults":
            MessageLookupByLibrary.simpleMessage("Još nema favorita"),
        "forgotPasswordBack":
            MessageLookupByLibrary.simpleMessage("Natrag na prijavu"),
        "forgotPasswordBtn":
            MessageLookupByLibrary.simpleMessage("Resetiranje lozinke"),
        "forgotPasswordDialogText": MessageLookupByLibrary.simpleMessage(
            "Sigurna veza za poništavanje lozinke poslana je na navedenu adresu e-pošte."),
        "forgotPasswordDialogTitle":
            MessageLookupByLibrary.simpleMessage("Poslana je sigurna veza"),
        "forgotPasswordLabel": MessageLookupByLibrary.simpleMessage(
            "Unesi svoju registriranu adresu e-pošte i poslat ćemo ti sigurnu vezu za resetiranje lozinke."),
        "forgotPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Zaboravio si lozinku?"),
        "formValidatorEmail":
            MessageLookupByLibrary.simpleMessage("Nevažeći format e-pošte"),
        "formValidatorInvalidPassword":
            MessageLookupByLibrary.simpleMessage("Nevažeći format lozinke"),
        "formValidatorMinLength": m24,
        "formValidatorRequired":
            MessageLookupByLibrary.simpleMessage("Obavezno polje"),
        "homeHeaderSubtitle":
            MessageLookupByLibrary.simpleMessage("Rezerviraj ono što voliš"),
        "homePlaceholderSearch":
            MessageLookupByLibrary.simpleMessage("Potražite uslugu ili tvrtku"),
        "homeTitleGuest": MessageLookupByLibrary.simpleMessage("Istraži"),
        "homeTitlePopularCategories":
            MessageLookupByLibrary.simpleMessage("Popularne kategorije"),
        "homeTitleRecentlyViewed":
            MessageLookupByLibrary.simpleMessage("Nedavno pogledano"),
        "homeTitleTopRated": MessageLookupByLibrary.simpleMessage(
            "Najbolje ocijenjene lokacije"),
        "homeTitleUser": m25,
        "inboxSlideButtonArchive":
            MessageLookupByLibrary.simpleMessage("Arhiva"),
        "inboxSlideButtonDelete":
            MessageLookupByLibrary.simpleMessage("Ukloni"),
        "inboxTitle": MessageLookupByLibrary.simpleMessage("Poruke"),
        "inviteButton":
            MessageLookupByLibrary.simpleMessage("Podijeli svoj kod"),
        "inviteDescription": MessageLookupByLibrary.simpleMessage(
            "Pozovi svoje prijatelje i daj svakome kupon od 5 USD. A za svakog prijatelja koji dovrši svoj prvi postupak rezervacije, dat ćemo ti i tebi kupon od 5 USD!"),
        "inviteEarningsLabel":
            MessageLookupByLibrary.simpleMessage("Ukupna zarada"),
        "inviteShareText": m26,
        "inviteSubtitle": MessageLookupByLibrary.simpleMessage(
            "Ostvari popuste pozivanjem prijatelja"),
        "inviteTitle":
            MessageLookupByLibrary.simpleMessage("Pozovi prijatelje"),
        "locationAvailableServies": m27,
        "locationBtnBook": MessageLookupByLibrary.simpleMessage("Rezerviraj"),
        "locationCallConfirmation": m28,
        "locationClosed": MessageLookupByLibrary.simpleMessage("Zatvoreno"),
        "locationCurrentlyClosed":
            MessageLookupByLibrary.simpleMessage("Trenutno zatvoreno"),
        "locationInstantConfirmation":
            MessageLookupByLibrary.simpleMessage("Trenutna potvrda!"),
        "locationLabelGenders": MessageLookupByLibrary.simpleMessage("Spol"),
        "locationLabelPhone": MessageLookupByLibrary.simpleMessage("Telefon"),
        "locationLabelWeb": MessageLookupByLibrary.simpleMessage("Web"),
        "locationLabelWorkingHours":
            MessageLookupByLibrary.simpleMessage("Radni sati"),
        "locationLinkAllReviews":
            MessageLookupByLibrary.simpleMessage("Pogledaj sve recenzije"),
        "locationLinkAllServices":
            MessageLookupByLibrary.simpleMessage("Pogledaj sve usluge"),
        "locationNoResults": MessageLookupByLibrary.simpleMessage(
            "Nijedna lokacija ne odgovara kriterijima pretraživanja. Pokušajte s drugim gradom i / ili datumom."),
        "locationRepliedOn": m29,
        "locationTitleAboutUs": MessageLookupByLibrary.simpleMessage("O nama"),
        "locationTitleNearby":
            MessageLookupByLibrary.simpleMessage("Lokacije u blizini"),
        "locationTitleRatings": MessageLookupByLibrary.simpleMessage("Ocjene"),
        "locationTitleReviews":
            MessageLookupByLibrary.simpleMessage("Recenzije"),
        "locationTitleStaff":
            MessageLookupByLibrary.simpleMessage("Naše osoblje"),
        "locationTitleTopServices":
            MessageLookupByLibrary.simpleMessage("Popularne usluge"),
        "locationTotalReviews": m30,
        "locationWebConfirmation":
            MessageLookupByLibrary.simpleMessage("Otvoriti web stranicu?"),
        "onboardingBtnGetStarted":
            MessageLookupByLibrary.simpleMessage("Započni"),
        "onboardingBtnSkip": MessageLookupByLibrary.simpleMessage("Preskoči"),
        "onboardingPage1Body": MessageLookupByLibrary.simpleMessage(
            "Salon vam omogućuje da lako pronađete i rezervirate termine kod lokalnih zdravstvenih i kozmetičkih stručnjaka."),
        "onboardingPage1Title":
            MessageLookupByLibrary.simpleMessage("Dobrodošli u Snip Snap"),
        "onboardingPage2Body": MessageLookupByLibrary.simpleMessage(
            "Pronađite savršenu uslugu ljepote prema imenu, mjestu i dostupnosti."),
        "onboardingPage2Title":
            MessageLookupByLibrary.simpleMessage("Pronađite Tvrtke"),
        "onboardingPage3Body": MessageLookupByLibrary.simpleMessage(
            "Odaberite usluge koje želite i odmah dobijate odobrenje. Nema više čekanja u redu."),
        "onboardingPage3Title":
            MessageLookupByLibrary.simpleMessage("Dogovoriti Sastanak"),
        "paymentCardTitle":
            MessageLookupByLibrary.simpleMessage("Kartica za plaćanje"),
        "paymentCardWarningBtn":
            MessageLookupByLibrary.simpleMessage("+ Dodaj svoju karticu"),
        "paymentCardWarningNote": MessageLookupByLibrary.simpleMessage(
            "Možeš koristiti svoju debitnu ili kreditnu karticu za rezerviranje (kartica se neće naplaćivati dok ne završe sve rezervirane usluge)."),
        "paymentCardWarningTitle":
            MessageLookupByLibrary.simpleMessage("Nema dostupnih kartica"),
        "paymentCardWidgetCardHolderLabel":
            MessageLookupByLibrary.simpleMessage("Ime vlasnika kartice"),
        "paymentCardWidgetCardHolderPlaceholder":
            MessageLookupByLibrary.simpleMessage("IME I PREZIME"),
        "paymentCardWidgetCardNumberLabel":
            MessageLookupByLibrary.simpleMessage("Broj kartice"),
        "paymentCardWidgetExpirationDateLabel":
            MessageLookupByLibrary.simpleMessage("Rok trajanja"),
        "paymentCardWidgetExpirationDatePlaceholder":
            MessageLookupByLibrary.simpleMessage("MM/GG"),
        "paymentCardWidgetSecurityCodeLabel":
            MessageLookupByLibrary.simpleMessage("Sigurnosni kod"),
        "paymentCardWidgetValidityLabel":
            MessageLookupByLibrary.simpleMessage("VAZI DO"),
        "pickerBtnSelect": MessageLookupByLibrary.simpleMessage("Odaberi"),
        "pickerPlaceholderSearch":
            MessageLookupByLibrary.simpleMessage("Traži"),
        "pickerTitleCity":
            MessageLookupByLibrary.simpleMessage("Odaberi Mjesto"),
        "pickerTitleDate": MessageLookupByLibrary.simpleMessage("Odaberi Dan"),
        "pickerTitleLanguages":
            MessageLookupByLibrary.simpleMessage("Odaberite Jezik"),
        "profileListAppointments":
            MessageLookupByLibrary.simpleMessage("Moje rezervacije"),
        "profileListEdit": MessageLookupByLibrary.simpleMessage("Uredi profil"),
        "profileListFavorites":
            MessageLookupByLibrary.simpleMessage("Moji omiljeni"),
        "profileListInvite": MessageLookupByLibrary.simpleMessage("Prijatelji"),
        "profileListLogout": MessageLookupByLibrary.simpleMessage("Odjava"),
        "profileListPaymentCard":
            MessageLookupByLibrary.simpleMessage("Kartica za plaćanje"),
        "profileListReviews":
            MessageLookupByLibrary.simpleMessage("Moje kritike"),
        "profileListSettings":
            MessageLookupByLibrary.simpleMessage("Više opcija"),
        "profileListTitleSettings":
            MessageLookupByLibrary.simpleMessage("Opcije"),
        "profileListVouchers":
            MessageLookupByLibrary.simpleMessage("Moji kuponi"),
        "reviewCommentPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Napiši svoju recenziju ovdje..."),
        "reviewLabelComment":
            MessageLookupByLibrary.simpleMessage("Tvoj komentar (neobavezno)"),
        "reviewLabelRate":
            MessageLookupByLibrary.simpleMessage("Koja je tvoja ocjena?"),
        "reviewLengthLimit": m31,
        "reviewSubmitBtn":
            MessageLookupByLibrary.simpleMessage("Pošalji recenziju"),
        "reviewSuccessSubtitle": MessageLookupByLibrary.simpleMessage(
            "Tvoje su povratne informacije primljene i odmah će se pojaviti u listi."),
        "reviewSuccessTitle": MessageLookupByLibrary.simpleMessage("Hvala"),
        "reviewTitle":
            MessageLookupByLibrary.simpleMessage("Ocijeni svoje iskustvo"),
        "reviewWarning": MessageLookupByLibrary.simpleMessage(
            "Ocijeni ovaj salon klikom na broj zvjezdica koje želiš dodijeliti."),
        "reviewsTitle": MessageLookupByLibrary.simpleMessage("Moje ocjene"),
        "searchBtnGroupAny": MessageLookupByLibrary.simpleMessage("Bilo koji"),
        "searchBtnGroupCurrentlyOpen":
            MessageLookupByLibrary.simpleMessage("Trenutno otvoreno"),
        "searchDrawerDistanceRange": m32,
        "searchLabelAll": MessageLookupByLibrary.simpleMessage("Svi"),
        "searchLabelNearby": MessageLookupByLibrary.simpleMessage("U blizini"),
        "searchLabelQuickSearch":
            MessageLookupByLibrary.simpleMessage("Što tražiš?"),
        "searchLabelRatingFilter": m33,
        "searchPlaceholderQuickSearchCities":
            MessageLookupByLibrary.simpleMessage("Naziv grada..."),
        "searchPlaceholderQuickSearchLocations":
            MessageLookupByLibrary.simpleMessage("Naziv mjesta..."),
        "searchTitleDistance":
            MessageLookupByLibrary.simpleMessage("Udaljenost"),
        "searchTitleFilter": MessageLookupByLibrary.simpleMessage("Filter"),
        "searchTitleLocationServiceDisabled":
            MessageLookupByLibrary.simpleMessage(
                "Lokacijska usluga onemogućena"),
        "searchTitleNoResults":
            MessageLookupByLibrary.simpleMessage("Nema rezultata"),
        "searchTitlePrice": MessageLookupByLibrary.simpleMessage("Cijena"),
        "searchTitleRating": MessageLookupByLibrary.simpleMessage("Ocjena"),
        "searchTitleRecentSearches":
            MessageLookupByLibrary.simpleMessage("Nedavna pretraživanja"),
        "searchTitleResults": m34,
        "searchTitleSortOrder":
            MessageLookupByLibrary.simpleMessage("Redoslijed"),
        "searchTitleWorkingHours":
            MessageLookupByLibrary.simpleMessage("Radni sati"),
        "searchTooltipBack": MessageLookupByLibrary.simpleMessage("Nazad"),
        "searchTooltipFilters": MessageLookupByLibrary.simpleMessage("Filteri"),
        "searchTooltipMap": MessageLookupByLibrary.simpleMessage("Mapa"),
        "searchTooltipView": MessageLookupByLibrary.simpleMessage("Prikaz"),
        "settingsCopyright":
            MessageLookupByLibrary.simpleMessage("© 2020 Zoran Juric"),
        "settingsHomepageConfirmation": MessageLookupByLibrary.simpleMessage(
            "Želite posjetiti početnu stranicu predloška?"),
        "settingsListDarkMode":
            MessageLookupByLibrary.simpleMessage("Tamni način rada"),
        "settingsListLanguage": MessageLookupByLibrary.simpleMessage("Jezik"),
        "settingsListPrivacy":
            MessageLookupByLibrary.simpleMessage("Politika privatnosti"),
        "settingsListTerms":
            MessageLookupByLibrary.simpleMessage("Uvjeti korištenja"),
        "settingsListTitleInterface":
            MessageLookupByLibrary.simpleMessage("Sučelje"),
        "settingsListTitleSupport":
            MessageLookupByLibrary.simpleMessage("Podrška"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Opcije"),
        "signInButtonForgot":
            MessageLookupByLibrary.simpleMessage("Zaboravili ste zaporku?"),
        "signInButtonLogin": MessageLookupByLibrary.simpleMessage("Prijava"),
        "signInButtonRegister":
            MessageLookupByLibrary.simpleMessage("Prijavi se sad"),
        "signInFormTitle":
            MessageLookupByLibrary.simpleMessage("Dobrodošao natrag"),
        "signInHintEmail": MessageLookupByLibrary.simpleMessage("Email adresa"),
        "signInHintPassword": MessageLookupByLibrary.simpleMessage("Zaporka"),
        "signInRegisterLabel":
            MessageLookupByLibrary.simpleMessage("Još nemaš račun?"),
        "signInTitle": MessageLookupByLibrary.simpleMessage("Prijavi se"),
        "signUpBtnSend": MessageLookupByLibrary.simpleMessage("Prijavi se"),
        "signUpErrorConsent": MessageLookupByLibrary.simpleMessage(
            "Morate prihvatiti Uvjete i odredbe usluge da biste nastavili."),
        "signUpHelptextPassword": m35,
        "signUpHintFullName":
            MessageLookupByLibrary.simpleMessage("Tvoje puno ime"),
        "signUpHintLabelPassword":
            MessageLookupByLibrary.simpleMessage("Kreiraj lozinku"),
        "signUpLabelConsent": MessageLookupByLibrary.simpleMessage(
            "Pročitao sam i slažem se s Korisničkim uvjetima pružanja usluge i razumijem da će se moji osobni podaci obrađivati u skladu s Izjavom o privatnosti."),
        "signUpLabelFullName":
            MessageLookupByLibrary.simpleMessage("Ime i prezime"),
        "signUpLabelPassword": MessageLookupByLibrary.simpleMessage("Zaporka"),
        "signUpReadMore":
            MessageLookupByLibrary.simpleMessage("Pogledaj pravne dokumente"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage("Otvorite račun"),
        "signupHintLabelEmail":
            MessageLookupByLibrary.simpleMessage("Tvoja email adresa"),
        "signupLabelEmail": MessageLookupByLibrary.simpleMessage("E-mail"),
        "takePictureTitle": MessageLookupByLibrary.simpleMessage("Uslikaj"),
        "voucherLabelCouponCode":
            MessageLookupByLibrary.simpleMessage("Šifra kupona"),
        "voucherLabelSpecialTerms":
            MessageLookupByLibrary.simpleMessage("Posebni uvjeti i odredbe"),
        "vouchersDueDateActive": m36,
        "vouchersDueDateExpired": m37,
        "vouchersDueDateRedeemed": m38,
        "vouchersHeroNoteActive": MessageLookupByLibrary.simpleMessage(
            "Nije pronađen nijedan dostupan kupon."),
        "vouchersHeroNoteExpired": MessageLookupByLibrary.simpleMessage(
            "Zasad nije istekao nijedan kupon."),
        "vouchersHeroNoteRedeemed": MessageLookupByLibrary.simpleMessage(
            "Do sada niste iskoristili nijedan kupon."),
        "vouchersInfo": MessageLookupByLibrary.simpleMessage(
            "Ovdje možete vidjeti popis svojih kupona koje možete koristiti prilikom sljedećeg posjeta određenoj lokaciji. Prilikom plaćanja računa za određenu uslugu konačni iznos umanjit će se za iznos naznačen na kuponu."),
        "vouchersLabelOff":
            MessageLookupByLibrary.simpleMessage("od konačne cijene"),
        "vouchersTabActive": MessageLookupByLibrary.simpleMessage("Aktivni"),
        "vouchersTabExpired": MessageLookupByLibrary.simpleMessage("Istekli"),
        "vouchersTabRedeemed":
            MessageLookupByLibrary.simpleMessage("Iskorišteni"),
        "vouchersTitle": MessageLookupByLibrary.simpleMessage("Moji kuponi"),
        "lblSignIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "lblEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "lblPassword": MessageLookupByLibrary.simpleMessage("Password"),
        "lblRememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "lblForgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password"),
        "btnSignIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "btnSignUp": MessageLookupByLibrary.simpleMessage("SIGN UP"),
        "txt_if_you_have_no_account":
            MessageLookupByLibrary.simpleMessage("if you have no an account? "),
        "txt_beautiyon_expert_app":
            MessageLookupByLibrary.simpleMessage("Beautyon Expert App"),
        "hnt_email": MessageLookupByLibrary.simpleMessage("demo@gmail.com"),
        "hnt_password": MessageLookupByLibrary.simpleMessage("demo1234"),
        "lbl_back": MessageLookupByLibrary.simpleMessage("Back"),
        "lbl_sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "lbl_confirm_password":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "txt_i_accept_the":
            MessageLookupByLibrary.simpleMessage("I accept the "),
        "txt_privacy_and_policy":
            MessageLookupByLibrary.simpleMessage("privacy and policy"),
        "btn_next": MessageLookupByLibrary.simpleMessage("NEXT"),
        "txt_already_have_an_account":
            MessageLookupByLibrary.simpleMessage("Already have an account? "),
        "txt_please_enter_email":
            MessageLookupByLibrary.simpleMessage("Please enter Email"),
        "txt_password_should_be_of_minimum_2_characters":
            MessageLookupByLibrary.simpleMessage(
                "Password should be of minimun 2 characters"),
        "txt_password_do_not_match":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "txt_please_accept_privacy_and_policy":
            MessageLookupByLibrary.simpleMessage(
                "Please accept privacy and policy to complete your registration"),
        "txt_please_enter_valid_email":
            MessageLookupByLibrary.simpleMessage("Please enter valid email"),
        "lbl_generall_information":
            MessageLookupByLibrary.simpleMessage("General Information"),
        "lbl_parlour_name":
            MessageLookupByLibrary.simpleMessage("Parlour Name"),
        "hnt_parlour_name":
            MessageLookupByLibrary.simpleMessage("Beauty Life Parlour"),
        "lbl_owner_name": MessageLookupByLibrary.simpleMessage("Owner Name"),
        "hnt_owner_name": MessageLookupByLibrary.simpleMessage("Jesika Merry"),
        "lbl_phone_number":
            MessageLookupByLibrary.simpleMessage("Phone Number"),
        "hnt_phone_number": MessageLookupByLibrary.simpleMessage("9898989898"),
        "lbl_address": MessageLookupByLibrary.simpleMessage("Address"),
        "hnt_address": MessageLookupByLibrary.simpleMessage(
            "58 Street -al dulha london -USA"),
        "lbl_saloon_type": MessageLookupByLibrary.simpleMessage("Saloon Type"),
        "lbl_male": MessageLookupByLibrary.simpleMessage("Male"),
        "lbl_female": MessageLookupByLibrary.simpleMessage("Female"),
        "lbl_unisex": MessageLookupByLibrary.simpleMessage("unisex"),
        "lbl_description": MessageLookupByLibrary.simpleMessage("Description"),
        "hnt_description":
            MessageLookupByLibrary.simpleMessage("This is a description"),
        "lbl_upload_image":
            MessageLookupByLibrary.simpleMessage("Upload Photo"),
        "btn_create_account":
            MessageLookupByLibrary.simpleMessage("CREATE ACCOUNT"),
        "lbl_action": MessageLookupByLibrary.simpleMessage("Actions"),
        "lbl_take_picture":
            MessageLookupByLibrary.simpleMessage("Take picture"),
        "lbl_choose_from_library":
            MessageLookupByLibrary.simpleMessage("Choose from library"),
        "lbl_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "txt_please_enter_parlour_name":
            MessageLookupByLibrary.simpleMessage("Please enter Parlour Name"),
        "txt_please_enter_phone_number":
            MessageLookupByLibrary.simpleMessage("Please enter Phone Number"),
        "txt_please_enter_valid_phone_number":
            MessageLookupByLibrary.simpleMessage(
                "Please enter valid Phone Number"),
        "txt_please_enter_owner_name":
            MessageLookupByLibrary.simpleMessage("Please enter Owner Name"),
        "txt_please_enter_address":
            MessageLookupByLibrary.simpleMessage("Please enter Address"),
        "txt_please_enter_description":
            MessageLookupByLibrary.simpleMessage("Please enter Description"),
        "txt_please_select_image":
            MessageLookupByLibrary.simpleMessage("Please select Image"),
        "btn_update_profile":
            MessageLookupByLibrary.simpleMessage("UPDATE PROFILE"),
        "lbl_about": MessageLookupByLibrary.simpleMessage("About"),
        "lbl_opening_hours":
            MessageLookupByLibrary.simpleMessage("Opening Hours"),
        "txt_profile_will_be_shown_here":
            MessageLookupByLibrary.simpleMessage("Profile will be shown here"),
        "lbl_user_request":
            MessageLookupByLibrary.simpleMessage("User Request"),
        "lbl_amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "txt_user_request_will_be_shown_here":
            MessageLookupByLibrary.simpleMessage(
                "User Request will be shown here"),
        "lbl_complete_request":
            MessageLookupByLibrary.simpleMessage("Complete Request"),
        "txt_confirmation_message_for_complete_request":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to Complete this Request ?"),
        "lbl_no": MessageLookupByLibrary.simpleMessage("NO"),
        "lbl_yes": MessageLookupByLibrary.simpleMessage("YES"),
        "lbl_cancel_request":
            MessageLookupByLibrary.simpleMessage("Cancel Request"),
        "txt_confirmation_message_for_cancel_request":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to Cancel this Request ?"),
        "lbl_appointment_history":
            MessageLookupByLibrary.simpleMessage("Appointment History"),
        "txt_appointment_history_will_be_shown_here":
            MessageLookupByLibrary.simpleMessage(
                "Appointment History will be shown here"),
        "lbl_weekly_earn": MessageLookupByLibrary.simpleMessage("WEEKLY EARN"),
        "txt_weekly_earn_will_shown_here": MessageLookupByLibrary.simpleMessage(
            "Weekly earning will be shown here"),
        "lbl_total": MessageLookupByLibrary.simpleMessage("Total"),
        "lbl_services": MessageLookupByLibrary.simpleMessage("Services"),
        "lbl_pending": MessageLookupByLibrary.simpleMessage("Pending"),
        "lbl_completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "lbl_complete_our_goals":
            MessageLookupByLibrary.simpleMessage("Complete Our Goals"),
        "lbl_experts": MessageLookupByLibrary.simpleMessage("Experts"),
        "lbl_delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "lbl_edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "txt_expert_will_shown_here": MessageLookupByLibrary.simpleMessage(
            "Expert List will be shown here"),
        "btn_add_new_expert":
            MessageLookupByLibrary.simpleMessage("ADD NEW BEAUTY EXPERT + "),
        "lbl_delete_expert":
            MessageLookupByLibrary.simpleMessage("Delete Expert"),
        "txt_confirmation_message_for_delete_expert":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this Expert ?"),
        "lbl_coupons": MessageLookupByLibrary.simpleMessage("Coupons"),
        "txt_coupon_list_will_shown_here": MessageLookupByLibrary.simpleMessage(
            "Coupon List will be shown here"),
        "btn_add_new_coupon":
            MessageLookupByLibrary.simpleMessage("ADD NEW COUPON +"),
        "lbl_delete_coupon":
            MessageLookupByLibrary.simpleMessage("Delete Coupon"),
        "txt_confirmation_message_for_delete_Coupon":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this Coupon ?"),
        "lbl_add_service_variant":
            MessageLookupByLibrary.simpleMessage("Add Service Variant"),
        "txt_service_will_shown_here": MessageLookupByLibrary.simpleMessage(
            "Service List will be shown here"),
        "btn_add_new_service":
            MessageLookupByLibrary.simpleMessage("ADD NEW SERVICE +"),
        "lbl_delete_service":
            MessageLookupByLibrary.simpleMessage("Delete Service"),
        "txt_confirmation_message_for_delete_service":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this Service ?"),
        "lbl_delete_service_variant":
            MessageLookupByLibrary.simpleMessage("Delete Service Variant"),
        "txt_confirmation_message_for_delete_service_variant":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this Service Variant ?"),
        "lbl_min": MessageLookupByLibrary.simpleMessage("min"),
        "btn_save_service":
            MessageLookupByLibrary.simpleMessage("SAVE SERVICE +"),
        "lbl_edit_service":
            MessageLookupByLibrary.simpleMessage("Edit Service"),
        "lbl_Add_service": MessageLookupByLibrary.simpleMessage("Add Service"),
        "lbl_service_name":
            MessageLookupByLibrary.simpleMessage("Service Name"),
        "hnt_service_name":
            MessageLookupByLibrary.simpleMessage("Spa, Facial, Makeup"),
        "lbl_tap_to_add_image":
            MessageLookupByLibrary.simpleMessage("Tap to add image"),
        "txt_please_enter_name":
            MessageLookupByLibrary.simpleMessage("Please enter name"),
        "btn_save_service_variant":
            MessageLookupByLibrary.simpleMessage("SAVE SERVICE VERIANT +"),
        "lbl_variant": MessageLookupByLibrary.simpleMessage("Variant"),
        "lbl_price": MessageLookupByLibrary.simpleMessage("Price"),
        "hnt_price": MessageLookupByLibrary.simpleMessage("100"),
        "lbl_time": MessageLookupByLibrary.simpleMessage("Time"),
        "hnt_time": MessageLookupByLibrary.simpleMessage("Enter Minute"),
        "txt_please_enter_price":
            MessageLookupByLibrary.simpleMessage("Please enter price"),
        "txt_please_enter_time":
            MessageLookupByLibrary.simpleMessage("Please enter time"),
        "btn_save_expert":
            MessageLookupByLibrary.simpleMessage("SAVE  EXPERT + "),
        "lbl_edit_expert":
            MessageLookupByLibrary.simpleMessage("Edit Beauty Expert"),
        "lbl_add_Expert":
            MessageLookupByLibrary.simpleMessage("Add Beauty Expert"),
        "lbl_expert_name": MessageLookupByLibrary.simpleMessage("Expert Name"),
        "hnt_expert_name": MessageLookupByLibrary.simpleMessage("Jesika Merry"),
        "txt_something_went_wrong": MessageLookupByLibrary.simpleMessage(
            "Something went Wrong!Try again later"),
        "btn_save_coupon":
            MessageLookupByLibrary.simpleMessage("SAVE COUPON +"),
        "lbl_Add_coupon": MessageLookupByLibrary.simpleMessage("Add Coupon"),
        "lbl_coupon_name": MessageLookupByLibrary.simpleMessage("Coupon Name"),
        "hnt_coupon_name":
            MessageLookupByLibrary.simpleMessage("Beauty coupon"),
        "lbl_coupon_number":
            MessageLookupByLibrary.simpleMessage("Coupon Number"),
        "hnt_coupon_number": MessageLookupByLibrary.simpleMessage("Beauty89"),
        "lbl_coupon_description":
            MessageLookupByLibrary.simpleMessage("Coupon Desciption"),
        "lbl_select_coupon_type":
            MessageLookupByLibrary.simpleMessage("Select Coupon Type"),
        "lbl_percentage": MessageLookupByLibrary.simpleMessage("Percentage"),
        "hnt_coupon_type":
            MessageLookupByLibrary.simpleMessage("Select Coupon Type"),
        "lbl_offer_price":
            MessageLookupByLibrary.simpleMessage("Offer Price/Percentage"),
        "hnt_offer_price": MessageLookupByLibrary.simpleMessage("100"),
        "lbl_min_service_amount":
            MessageLookupByLibrary.simpleMessage("Min Service Amount"),
        "hnt_min_service_amount": MessageLookupByLibrary.simpleMessage("250"),
        "lbl_select_usesRestriction":
            MessageLookupByLibrary.simpleMessage("Select Uses-restriction"),
        "hnt_usesRestriction":
            MessageLookupByLibrary.simpleMessage("Uses-Restriction"),
        "lbl_select_start_date":
            MessageLookupByLibrary.simpleMessage("Select Start Date"),
        "hnt_select_start_date":
            MessageLookupByLibrary.simpleMessage("Start Date"),
        "lbl_select__end_date":
            MessageLookupByLibrary.simpleMessage("Select End Date"),
        "hnt_select_end_date": MessageLookupByLibrary.simpleMessage("End Date"),
        "txt_please_enter_offer_price":
            MessageLookupByLibrary.simpleMessage("Please enter offer price"),
        "txt_pleae_enter_min_service_price":
            MessageLookupByLibrary.simpleMessage(
                "Please enter min service price"),
        "txt_please_enter_coupon_number":
            MessageLookupByLibrary.simpleMessage("Please enter coupon number"),
        "txt_please_enter_usesRestriction":
            MessageLookupByLibrary.simpleMessage(
                "Please enter user restriction"),
        "txt_please_select_coupon_type":
            MessageLookupByLibrary.simpleMessage("Please select coupon type"),
        "txt_please_select_start_date":
            MessageLookupByLibrary.simpleMessage("Please select start date"),
        "txt_please_select_end_date":
            MessageLookupByLibrary.simpleMessage("Please select end date"),
        "lbl_gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "txt_gallery_will_shown_here": MessageLookupByLibrary.simpleMessage(
            "Gallery List will be shown here"),
        "btn_add_new_gallery":
            MessageLookupByLibrary.simpleMessage("ADD NEW GALLERY +"),
        "lbl_delete_gallery":
            MessageLookupByLibrary.simpleMessage("Delete Gallery"),
        "txt_confirmation_message_for_delete_gallery":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this Gallery ?"),
        "lbl_products": MessageLookupByLibrary.simpleMessage("Products"),
        "txt_products_will_shown_here": MessageLookupByLibrary.simpleMessage(
            "Product List will be shown here"),
        "btn_add_new_product":
            MessageLookupByLibrary.simpleMessage("ADD NEW PRODUCT+ "),
        "lbl_delete_product":
            MessageLookupByLibrary.simpleMessage("Delete Product"),
        "txt_confirmation_message_for_delete_product":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this Product ?"),
        "btn_save_gallery":
            MessageLookupByLibrary.simpleMessage("SAVE GALLERY +"),
        "lbl_Add_gallery": MessageLookupByLibrary.simpleMessage("Add Gallery"),
        "btn_save_product":
            MessageLookupByLibrary.simpleMessage("SAVE  PRODUCT + "),
        "lbl_edit_product":
            MessageLookupByLibrary.simpleMessage("Edit Product"),
        "lbl_add_product": MessageLookupByLibrary.simpleMessage("Add Product"),
        "lbl_product_name":
            MessageLookupByLibrary.simpleMessage("Product Name"),
        "hnt_product_name": MessageLookupByLibrary.simpleMessage("shampoo"),
        "lbl_quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "hnt_quantity": MessageLookupByLibrary.simpleMessage("100L"),
        "txt_please_enter_quantity":
            MessageLookupByLibrary.simpleMessage("Please enter quantity"),
        "lbl_beautyon": MessageLookupByLibrary.simpleMessage("Beautyon"),
        "lbl_loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "lbl_orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "lbl_qty": MessageLookupByLibrary.simpleMessage("Qty"),
        "txt_orders_will_shown_here":
            MessageLookupByLibrary.simpleMessage("Orders will be shown here"),
        "lbl_confirm_order":
            MessageLookupByLibrary.simpleMessage("Confirm Order"),
        "txt_confirmation_message_for_confirm_order":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to Confirm this Order ?"),
        "btn_save_setting":
            MessageLookupByLibrary.simpleMessage("SAVE SETTINGS"),
        "lbl_settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "lbl_shop_open": MessageLookupByLibrary.simpleMessage("Shop Open"),
        "lbl_help_and_support":
            MessageLookupByLibrary.simpleMessage("Help & Support "),
        "lbl_faq": MessageLookupByLibrary.simpleMessage("FAQ"),
        "txt_faq_will_shown_here":
            MessageLookupByLibrary.simpleMessage("Faqs will be shown here"),
        "lbl_change_password":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "lbl_old_password":
            MessageLookupByLibrary.simpleMessage("Old Password"),
        "lbl_new_password":
            MessageLookupByLibrary.simpleMessage("New Password"),
        "btn_change_password":
            MessageLookupByLibrary.simpleMessage("CHANGE PASSWORD"),
        "txt_password_and_confirm_password_do_not_match":
            MessageLookupByLibrary.simpleMessage(
                "password and confirm password do not match"),
        "txt_please_enter_old_password":
            MessageLookupByLibrary.simpleMessage("Please enter old password"),
        "txt_please_enter_new_password":
            MessageLookupByLibrary.simpleMessage("Please enter new password"),
        "lbl_my_wallet": MessageLookupByLibrary.simpleMessage("My Wallet"),
        "lbl_total_earning":
            MessageLookupByLibrary.simpleMessage("Total Earnings"),
        "lbl_paid_to_app": MessageLookupByLibrary.simpleMessage("Paid to App"),
        "lbl_payment_pending_from_app":
            MessageLookupByLibrary.simpleMessage("Payment Pending from App"),
        "lbl_paid_by_app": MessageLookupByLibrary.simpleMessage("Paid by App"),
        "lbl_pending_to_give_app":
            MessageLookupByLibrary.simpleMessage("Pending to give App"),
        "btn_mask_as_paid":
            MessageLookupByLibrary.simpleMessage("MARK AS PAID "),
        "txt_nothing_yet_to_see_here":
            MessageLookupByLibrary.simpleMessage("Nothing yet to see here"),
        "lbl_confirm_dialog":
            MessageLookupByLibrary.simpleMessage("Confirm Dialog"),
        "txt_confirmation_message_for_paid_to_admin":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to paid this to admin"),
        "lbl_notification":
            MessageLookupByLibrary.simpleMessage("Notifications"),
        "txt_notification_will_shown_here":
            MessageLookupByLibrary.simpleMessage(
                "Notifications will be shown here"),
        "lbl_accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "lbl_ok": MessageLookupByLibrary.simpleMessage("OK"),
        "lbl_date_and_time":
            MessageLookupByLibrary.simpleMessage("Date & Time"),
        "lbl_date": MessageLookupByLibrary.simpleMessage("Date"),
        "lbl_service": MessageLookupByLibrary.simpleMessage("Service"),
        "lbl_subTotal": MessageLookupByLibrary.simpleMessage("SubTotal"),
        "lbl_discount_by_coupon":
            MessageLookupByLibrary.simpleMessage("Discount by coupon"),
        "lbl_service_summary":
            MessageLookupByLibrary.simpleMessage("Service Summary"),
        "btn_confirm": MessageLookupByLibrary.simpleMessage("CONFIRM"),
        "lbl_confirm_service":
            MessageLookupByLibrary.simpleMessage("Confirm Service"),
        "txt_confirmation_message_for_confirm_service":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to Confirm this Service ?"),
        "lbl_update_profile":
            MessageLookupByLibrary.simpleMessage("Update Profile"),
        "txt_easy_to_find_customer":
            MessageLookupByLibrary.simpleMessage("Easy to Find Customer"),
        "txt_easy_to_find_customer_detail_text":
            MessageLookupByLibrary.simpleMessage(
                "Many desktop publishing packages and web page editors now use Lorem Ipsum as ."),
        "txt_branding_for_your_parlour":
            MessageLookupByLibrary.simpleMessage("Branding For Your Parlour"),
        "txt_branding_for_your_parlour_detail_text":
            MessageLookupByLibrary.simpleMessage(
                "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words"),
        "txt_get_customer_feedback":
            MessageLookupByLibrary.simpleMessage("Get Customer Feedback"),
        "txt_get_customer_feedback_detail_text":
            MessageLookupByLibrary.simpleMessage(
                "to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."),
        "btn_get_started": MessageLookupByLibrary.simpleMessage("GET STARTED"),
        "lbl_forgot_password":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "btn_send_code": MessageLookupByLibrary.simpleMessage("SEND CODE"),
        "btn_submit": MessageLookupByLibrary.simpleMessage("SUBMIT"),
        "lbl_verify_otp": MessageLookupByLibrary.simpleMessage("Verify Otp"),
        "txt_enter_the_verification_code_from":
            MessageLookupByLibrary.simpleMessage(
                "Enter the Verification code from "),
        "txt_the_phone_we_just_sent_you":
            MessageLookupByLibrary.simpleMessage("the phone we just sent you "),
        "txt_check_your_mail_for_otp":
            MessageLookupByLibrary.simpleMessage("Check your mail for opt"),
        "txt_please_enter_otp":
            MessageLookupByLibrary.simpleMessage("Please enter Otp"),
        "txt_successfully_add":
            MessageLookupByLibrary.simpleMessage("Successfully add"),
        "txt_your_new_expert":
            MessageLookupByLibrary.simpleMessage("your new expert"),
        "txt_your_new_coupon":
            MessageLookupByLibrary.simpleMessage("your new coupon"),
        "txt_successfully_changed_your_password":
            MessageLookupByLibrary.simpleMessage(
                "Successfully changed your password"),
        "txt_your_new_product":
            MessageLookupByLibrary.simpleMessage("your new product"),
        "txt_your_new_service":
            MessageLookupByLibrary.simpleMessage("your new service"),
        "txt_successfully_save":
            MessageLookupByLibrary.simpleMessage("Successfully save"),
        "txt_your_setting":
            MessageLookupByLibrary.simpleMessage("your setting"),
        "txt_successfully_add_your_new_coupon":
            MessageLookupByLibrary.simpleMessage(
                "Successfully add your new coupon"),
        "txt_successfully_add_your_new_expert":
            MessageLookupByLibrary.simpleMessage(
                "Successfully add your new expert"),
        "txt_successfully_add_your_new_service":
            MessageLookupByLibrary.simpleMessage(
                "Successfully add your new service"),
        "txt_successfully_save_your_setting":
            MessageLookupByLibrary.simpleMessage(
                "Successfully save your setting"),
        "txt_succesfully_add_your_new_product":
            MessageLookupByLibrary.simpleMessage(
                "Successfully add your new product"),
        "txt_successfully_changed_your_profile":
            MessageLookupByLibrary.simpleMessage(
                "Successfully changed your profile"),
        "lbl_selet_language":
            MessageLookupByLibrary.simpleMessage("Select Language"),
        "lbl_add_expert": MessageLookupByLibrary.simpleMessage("Add Expert"),
        "lbl_sign_out": MessageLookupByLibrary.simpleMessage("Sign Out"),
        "txt_confirmation_message_for_sign_out":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to Sign Out?"),
        "lbl_gofresha": MessageLookupByLibrary.simpleMessage("GoFresha"),
        "txt_total_admin_share_sent_by_vendor":
            MessageLookupByLibrary.simpleMessage(
                "Total Admin Share sent by Vendor"),
        "txt_total_admin_share_pending_at_vendor":
            MessageLookupByLibrary.simpleMessage(
                "Total Admin Share pending at Vendor"),
        "txt_total_vendor_share_given_by_admin":
            MessageLookupByLibrary.simpleMessage(
                "Total Vendor Share given by Admin"),
        "txt_total_vendor_share_pending_at_admin":
            MessageLookupByLibrary.simpleMessage(
                "Total Vendor Share pending at Admin"),
        "lbl_reviews": MessageLookupByLibrary.simpleMessage("Reviews"),
        "lbl_view_all": MessageLookupByLibrary.simpleMessage("View All")
      };
}
