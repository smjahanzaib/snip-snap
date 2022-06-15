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
        "vouchersTitle": MessageLookupByLibrary.simpleMessage("Moji kuponi")
      };
}
