// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(dow, day, month, year, time) =>
      "${dow}, ${day} ${month} ${year} at ${time}";

  static m1(sort) => "${Intl.select(sort, {
        'date_asc': 'Oldest first',
        'date_desc': 'Newest first',
        'other': 'Other',
      })}";

  static m2(status) => "${Intl.select(status, {
        'active': 'Active',
        'completed': 'Completed',
        'other': 'Other',
      })}";

  static m3(number) => "Call number ${number}?";

  static m4(current, total) => "Step ${current} of ${total}";

  static m5(page) => "${Intl.select(page, {
        'page1': 'Select services',
        'page2': 'Select staff',
        'page3': 'Appointment',
        'page4': 'Confirmation',
        'other': '---',
      })}";

  static m6(from, to, total) => "From ${from} to ${to} (${total})";

  static m7(name) => "${name} is not available on this day";

  static m8(name) => "With ${name}";

  static m9(status) => "${Intl.select(status, {
        'active': 'active',
        'canceled': 'canceled',
        'completed': 'completed',
        'declined': 'declined',
        'failed': 'failed',
        'other': 'unknown',
      })}";

  static m10(value) => "\$${value}";

  static m11(mode) => "${Intl.select(mode, {
        'dynamic': 'Dynamic',
        'alwaysOn': 'Always on',
        'alwaysOff': 'Always off',
        'other': 'Unknown',
      })}";

  static m12(value) => "${value} min";

  static m13(mins) => "in 1 hour, ${mins} mins";

  static m14(hours) => "in 1 day, ${hours} hours";

  static m15(days) => "in ${days} days";

  static m16(hours) => "in ${hours} hours";

  static m17(mins) => "in ${mins} mins";

  static m18(locale) => "${Intl.select(locale, {
        'ar': 'Arabic',
        'en': 'English',
        'hr': 'Croatian',
        'other': 'Unknown',
      })}";

  static m19(day) => "${Intl.select(day, {
        'january': 'January',
        'february': 'February',
        'march': 'March',
        'april': 'April',
        'may': 'May',
        'june': 'June',
        'july': 'July',
        'august': 'August',
        'september': 'September',
        'october': 'October',
        'november': 'November',
        'december': 'December',
        'other': 'Unknown',
      })}";

  static m20(day) => "${Intl.select(day, {
        'january': 'Jan',
        'february': 'Feb',
        'march': 'Mar',
        'april': 'Apr',
        'may': 'May',
        'june': 'Jun',
        'july': 'Jul',
        'august': 'Aug',
        'september': 'Sep',
        'october': 'Oct',
        'november': 'Nov',
        'december': 'Dec',
        'other': 'Unknown',
      })}";

  static m21(source) => "${Intl.select(source, {
        'gallery': 'Photo gallery',
        'camera': 'Phone camera',
        'other': '---',
      })}";

  static m22(day) => "${Intl.select(day, {
        'monday': 'Monday',
        'tuesday': 'Tuesday',
        'wednesday': 'Wednesday',
        'thursday': 'Thursday',
        'friday': 'Friday',
        'saturday': 'Saturday',
        'sunday': 'Sunday',
        'other': 'Unknown',
      })}";

  static m23(day) => "${Intl.select(day, {
        'monday': 'Mon',
        'tuesday': 'Tue',
        'wednesday': 'Wed',
        'thursday': 'Thu',
        'friday': 'Fri',
        'saturday': 'Sat',
        'sunday': 'Sun',
        'other': 'Unknown',
      })}";

  static m24(length) => "Min. length is ${length} characters";

  static m25(name) => "Hi, ${name}!";

  static m26(code) =>
      "Get Snip Snap and use code ${code} to get US\$5 off your first booking expenses.";

  static m27(num) => "${num} services available";

  static m28(number) => "Call number ${number}?";

  static m29(date) => "Replied on ${date}";

  static m30(num) => "${num} reviews";

  static m31(num) => "${num} characters remaining";

  static m32(from, to) => "${from} - ${to} km";

  static m33(num) => "${num}+ Stars";

  static m34(num) => "Locations (${num})";

  static m35(length) =>
      "Password must be at least ${length} characters long and contain at least one number and one uppercase letter.";

  static m36(date) => "Valid until: ${date}";

  static m37(date) => "Expired on: ${date}";

  static m38(date) => "Redeemed on: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "addPaymentCardButton":
            MessageLookupByLibrary.simpleMessage("Save Card"),
        "addPaymentCardTitle": MessageLookupByLibrary.simpleMessage("Add card"),
        "appointmentAt": m0,
        "appointmentCancelationConfirmation":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to cancel this appointment?"),
        "appointmentSubtitleNotes":
            MessageLookupByLibrary.simpleMessage("Notes"),
        "appointmentSubtitleTotal":
            MessageLookupByLibrary.simpleMessage("TOTAL"),
        "appointmentsBtnExplore":
            MessageLookupByLibrary.simpleMessage("Explore salons nearby"),
        "appointmentsLabelReview":
            MessageLookupByLibrary.simpleMessage("Review"),
        "appointmentsSort": m1,
        "appointmentsStatusGroup": m2,
        "appointmentsTitle":
            MessageLookupByLibrary.simpleMessage("Appointments"),
        "appointmentsWarningCompletedList":
            MessageLookupByLibrary.simpleMessage(
                "No previous appointments found."),
        "appointmentsWarningOtherList": MessageLookupByLibrary.simpleMessage(
            "No appointment found that matches your search criteria."),
        "appointmentsWarningUpcomingList": MessageLookupByLibrary.simpleMessage(
            "No upcoming appointments found."),
        "appointmentsWelcomeSignInBtn":
            MessageLookupByLibrary.simpleMessage("Sign in"),
        "appointmentsWelcomeSignInLabel":
            MessageLookupByLibrary.simpleMessage("Already registered?"),
        "appointmentsWelcomeSubtitle": MessageLookupByLibrary.simpleMessage(
            "Explore and book your first appointment"),
        "appointmentsWelcomeTitle":
            MessageLookupByLibrary.simpleMessage("My Appointments"),
        "bookingAddNotes":
            MessageLookupByLibrary.simpleMessage("Add booking notes"),
        "bookingBtnCalendar": MessageLookupByLibrary.simpleMessage("Calendar"),
        "bookingBtnCall": MessageLookupByLibrary.simpleMessage("Call"),
        "bookingBtnCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "bookingBtnClose": MessageLookupByLibrary.simpleMessage("Ok, got it"),
        "bookingBtnConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "bookingBtnNext": MessageLookupByLibrary.simpleMessage("Next"),
        "bookingBtnNotes": MessageLookupByLibrary.simpleMessage("Notes"),
        "bookingCallConfirmation": m3,
        "bookingLabelSteps": m4,
        "bookingMinutes": MessageLookupByLibrary.simpleMessage("min"),
        "bookingNoteslabel": MessageLookupByLibrary.simpleMessage(
            "Special requests about your booking"),
        "bookingPayInStore":
            MessageLookupByLibrary.simpleMessage("Pay in store"),
        "bookingPayWithCard":
            MessageLookupByLibrary.simpleMessage("Pay with card"),
        "bookingSigninTitle":
            MessageLookupByLibrary.simpleMessage("Login to continue"),
        "bookingStaffNoPreferenceDescription":
            MessageLookupByLibrary.simpleMessage("No preference"),
        "bookingStaffNoPreferenceName":
            MessageLookupByLibrary.simpleMessage("No preference"),
        "bookingSubtitleAppointment":
            MessageLookupByLibrary.simpleMessage("Appointment"),
        "bookingSubtitleCancelationPolicy":
            MessageLookupByLibrary.simpleMessage("Cancelation Policy"),
        "bookingSubtitleCheckout":
            MessageLookupByLibrary.simpleMessage("Checkout"),
        "bookingSubtitleDate": MessageLookupByLibrary.simpleMessage("Date"),
        "bookingSubtitleLocation":
            MessageLookupByLibrary.simpleMessage("Location"),
        "bookingSubtitleServices":
            MessageLookupByLibrary.simpleMessage("Services"),
        "bookingSubtitleSignin":
            MessageLookupByLibrary.simpleMessage("Login to continue"),
        "bookingSubtitleTime": MessageLookupByLibrary.simpleMessage("Time"),
        "bookingSuccessSubtitle": MessageLookupByLibrary.simpleMessage(
            "You don\'t need to do anything else. We will send you a reminder before the appointment."),
        "bookingSuccessTitle":
            MessageLookupByLibrary.simpleMessage("Appointment Confirmed"),
        "bookingTitleWizardPage": m5,
        "bookingTotalTime": m6,
        "bookingWarningAppointment": MessageLookupByLibrary.simpleMessage(
            "Choose the date and time from the list that suits you best."),
        "bookingWarningNoServices":
            MessageLookupByLibrary.simpleMessage("No services available"),
        "bookingWarningNoSlots": MessageLookupByLibrary.simpleMessage(
            "There are no available free slots"),
        "bookingWarningServices": MessageLookupByLibrary.simpleMessage(
            "Please select at least one service to continue."),
        "bookingWarningStaffUnavailable": m7,
        "bookingWithStaff": m8,
        "chatOnlineLabel": MessageLookupByLibrary.simpleMessage("Online"),
        "chatPlaceholder":
            MessageLookupByLibrary.simpleMessage("Type a message..."),
        "commonAppointmentStatus": m9,
        "commonBtnApply": MessageLookupByLibrary.simpleMessage("Apply"),
        "commonBtnCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "commonBtnClose": MessageLookupByLibrary.simpleMessage("Close"),
        "commonBtnOk": MessageLookupByLibrary.simpleMessage("Ok"),
        "commonCurrencyFormat": m10,
        "commonDarkMode": m11,
        "commonDialogsErrorTitle":
            MessageLookupByLibrary.simpleMessage("Oops!"),
        "commonDurationFormat": m12,
        "commonElapseHhourMins": m13,
        "commonElapsedDayHours": m14,
        "commonElapsedDays": m15,
        "commonElapsedHours": m16,
        "commonElapsedMins": m17,
        "commonElapsedNow": MessageLookupByLibrary.simpleMessage("in process"),
        "commonGendersMen": MessageLookupByLibrary.simpleMessage("Men only"),
        "commonGendersUnisex": MessageLookupByLibrary.simpleMessage("Unisex"),
        "commonGendersWomen":
            MessageLookupByLibrary.simpleMessage("Women only"),
        "commonLocales": m18,
        "commonLocationFavorited": MessageLookupByLibrary.simpleMessage(
            "Location added to your favorites list."),
        "commonLocationUnfavorited": MessageLookupByLibrary.simpleMessage(
            "Location removed from your favorites list."),
        "commonMonthLong": m19,
        "commonMonthShort": m20,
        "commonPhotoSources": m21,
        "commonReadMore": MessageLookupByLibrary.simpleMessage("read more"),
        "commonSearchSortTypeDistance":
            MessageLookupByLibrary.simpleMessage("Nearest"),
        "commonSearchSortTypePopularity":
            MessageLookupByLibrary.simpleMessage("Most popular"),
        "commonSearchSortTypePrice":
            MessageLookupByLibrary.simpleMessage("Lowest price"),
        "commonSearchSortTypeRating":
            MessageLookupByLibrary.simpleMessage("Top rated"),
        "commonSmartRefresherFooterCanLoadingText":
            MessageLookupByLibrary.simpleMessage("Release to load more"),
        "commonSmartRefresherFooterIdleText":
            MessageLookupByLibrary.simpleMessage("Pull to load more"),
        "commonSmartRefresherFooterLoadingText":
            MessageLookupByLibrary.simpleMessage("Loading..."),
        "commonSmartRefresherHeaderCompleteText":
            MessageLookupByLibrary.simpleMessage("Refresh completed"),
        "commonSmartRefresherHeaderIdleText":
            MessageLookupByLibrary.simpleMessage("Pull down to refresh"),
        "commonSmartRefresherHeaderRefreshingText":
            MessageLookupByLibrary.simpleMessage("Refreshing..."),
        "commonSmartRefresherHeaderReleaseText":
            MessageLookupByLibrary.simpleMessage("Release to refresh"),
        "commonTooltipInfo": MessageLookupByLibrary.simpleMessage("Info"),
        "commonTooltipRefresh": MessageLookupByLibrary.simpleMessage("Refresh"),
        "commonWeekdayLong": m22,
        "commonWeekdayShort": m23,
        "commonWeekdayToday": MessageLookupByLibrary.simpleMessage("Today"),
        "commonWeekdayTomorrow":
            MessageLookupByLibrary.simpleMessage("Tomorrow"),
        "editProfileBtnUpdate":
            MessageLookupByLibrary.simpleMessage("Update profile"),
        "editProfileLabelAddress":
            MessageLookupByLibrary.simpleMessage("Address"),
        "editProfileLabelCity": MessageLookupByLibrary.simpleMessage("City"),
        "editProfileLabelFullname":
            MessageLookupByLibrary.simpleMessage("Full name"),
        "editProfileLabelPhone":
            MessageLookupByLibrary.simpleMessage("Phone number"),
        "editProfileLabelZIP": MessageLookupByLibrary.simpleMessage("ZIP"),
        "editProfileListTitleAddress":
            MessageLookupByLibrary.simpleMessage("Address"),
        "editProfileListTitleContact":
            MessageLookupByLibrary.simpleMessage("Contact"),
        "editProfileSuccess": MessageLookupByLibrary.simpleMessage(
            "Profile updated successfully."),
        "editProfileTitle":
            MessageLookupByLibrary.simpleMessage("Edit Profile"),
        "emptyTitle": MessageLookupByLibrary.simpleMessage("(not implemented)"),
        "favoritesNoResults": MessageLookupByLibrary.simpleMessage(
            "Your favorites list is empty."),
        "favoritesTitle": MessageLookupByLibrary.simpleMessage("My favorites"),
        "favoritesTitleNoResults":
            MessageLookupByLibrary.simpleMessage("No favorites yet"),
        "forgotPasswordBack":
            MessageLookupByLibrary.simpleMessage("Back to login"),
        "forgotPasswordBtn":
            MessageLookupByLibrary.simpleMessage("Reset Password"),
        "forgotPasswordDialogText": MessageLookupByLibrary.simpleMessage(
            "Secure link to reset your password has been sent to the provided email address."),
        "forgotPasswordDialogTitle":
            MessageLookupByLibrary.simpleMessage("Secure link has been sent"),
        "forgotPasswordLabel": MessageLookupByLibrary.simpleMessage(
            "Enter your registered email address and we shall send you a secure link to reset your password."),
        "forgotPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "formValidatorEmail":
            MessageLookupByLibrary.simpleMessage("Email format invalid"),
        "formValidatorInvalidPassword":
            MessageLookupByLibrary.simpleMessage("Password format invalid"),
        "formValidatorMinLength": m24,
        "formValidatorRequired":
            MessageLookupByLibrary.simpleMessage("Required field"),
        "homeHeaderSubtitle":
            MessageLookupByLibrary.simpleMessage("Book what you love"),
        "homePlaceholderSearch": MessageLookupByLibrary.simpleMessage(
            "Search for a service or business"),
        "homeTitleGuest": MessageLookupByLibrary.simpleMessage("Explore"),
        "homeTitlePopularCategories":
            MessageLookupByLibrary.simpleMessage("Popular Categories"),
        "homeTitleRecentlyViewed":
            MessageLookupByLibrary.simpleMessage("Recently Viewed"),
        "homeTitleTopRated":
            MessageLookupByLibrary.simpleMessage("Top Rated Locations"),
        "homeTitleUser": m25,
        "inboxSlideButtonArchive":
            MessageLookupByLibrary.simpleMessage("Archive"),
        "inboxSlideButtonDelete":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "inboxTitle": MessageLookupByLibrary.simpleMessage("Messages"),
        "inviteButton": MessageLookupByLibrary.simpleMessage("Share your code"),
        "inviteDescription": MessageLookupByLibrary.simpleMessage(
            "Invite your friends and give them each US\$5 in coupons. And for every friend who completes their first booking process, we will give you a US\$5 coupon!"),
        "inviteEarningsLabel":
            MessageLookupByLibrary.simpleMessage("Total Earnings"),
        "inviteShareText": m26,
        "inviteSubtitle": MessageLookupByLibrary.simpleMessage(
            "Get discounts by inviting friends"),
        "inviteTitle": MessageLookupByLibrary.simpleMessage("Invite friends"),
        "locationAvailableServies": m27,
        "locationBtnBook": MessageLookupByLibrary.simpleMessage("Book"),
        "locationCallConfirmation": m28,
        "locationClosed": MessageLookupByLibrary.simpleMessage("Closed"),
        "locationCurrentlyClosed":
            MessageLookupByLibrary.simpleMessage("Currently closed"),
        "locationInstantConfirmation":
            MessageLookupByLibrary.simpleMessage("Instant confirmation!"),
        "locationLabelGenders": MessageLookupByLibrary.simpleMessage("Genders"),
        "locationLabelPhone": MessageLookupByLibrary.simpleMessage("Phone"),
        "locationLabelWeb": MessageLookupByLibrary.simpleMessage("Web"),
        "locationLabelWorkingHours":
            MessageLookupByLibrary.simpleMessage("Working hours"),
        "locationLinkAllReviews":
            MessageLookupByLibrary.simpleMessage("See all reviews"),
        "locationLinkAllServices":
            MessageLookupByLibrary.simpleMessage("See all services"),
        "locationNoResults": MessageLookupByLibrary.simpleMessage(
            "No locations match the search criteria. Try another city and/or date."),
        "locationRepliedOn": m29,
        "locationTitleAboutUs":
            MessageLookupByLibrary.simpleMessage("About Us"),
        "locationTitleNearby":
            MessageLookupByLibrary.simpleMessage("Nearby Locations"),
        "locationTitleRatings": MessageLookupByLibrary.simpleMessage("Ratings"),
        "locationTitleReviews": MessageLookupByLibrary.simpleMessage("Reviews"),
        "locationTitleStaff": MessageLookupByLibrary.simpleMessage("Our Staff"),
        "locationTitleTopServices":
            MessageLookupByLibrary.simpleMessage("Top Services"),
        "locationTotalReviews": m30,
        "locationWebConfirmation":
            MessageLookupByLibrary.simpleMessage("Open web page?"),
        "onboardingBtnGetStarted":
            MessageLookupByLibrary.simpleMessage("Get Started"),
        "onboardingBtnSkip": MessageLookupByLibrary.simpleMessage("Skip"),
        "onboardingPage1Body": MessageLookupByLibrary.simpleMessage(
            "Snip Snap lets you easily find and book appointments with local health and beauty professionals."),
        "onboardingPage1Title":
            MessageLookupByLibrary.simpleMessage("Welcome to Snip Snap"),
        "onboardingPage2Body": MessageLookupByLibrary.simpleMessage(
            "Find the perfect health or beauty service by name, location and availability."),
        "onboardingPage2Title":
            MessageLookupByLibrary.simpleMessage("Find Businesses"),
        "onboardingPage3Body": MessageLookupByLibrary.simpleMessage(
            "Pick the services you want and get an instant approval. No more waiting in line."),
        "onboardingPage3Title":
            MessageLookupByLibrary.simpleMessage("Make an Appointment"),
        "paymentCardTitle":
            MessageLookupByLibrary.simpleMessage("Payment card"),
        "paymentCardWarningBtn":
            MessageLookupByLibrary.simpleMessage("+ Add your card"),
        "paymentCardWarningNote": MessageLookupByLibrary.simpleMessage(
            "You can use your debit or credit card to book an appointment (card will not be charged until all the booked services are complete)."),
        "paymentCardWarningTitle":
            MessageLookupByLibrary.simpleMessage("No card available"),
        "paymentCardWidgetCardHolderLabel":
            MessageLookupByLibrary.simpleMessage("Card holder name"),
        "paymentCardWidgetCardHolderPlaceholder":
            MessageLookupByLibrary.simpleMessage("CARD HOLDER"),
        "paymentCardWidgetCardNumberLabel":
            MessageLookupByLibrary.simpleMessage("Card number"),
        "paymentCardWidgetExpirationDateLabel":
            MessageLookupByLibrary.simpleMessage("Expiration date"),
        "paymentCardWidgetExpirationDatePlaceholder":
            MessageLookupByLibrary.simpleMessage("MM/YY"),
        "paymentCardWidgetSecurityCodeLabel":
            MessageLookupByLibrary.simpleMessage("Security code"),
        "paymentCardWidgetValidityLabel":
            MessageLookupByLibrary.simpleMessage("VALID THRU"),
        "pickerBtnSelect": MessageLookupByLibrary.simpleMessage("Select"),
        "pickerPlaceholderSearch":
            MessageLookupByLibrary.simpleMessage("Search"),
        "pickerTitleCity":
            MessageLookupByLibrary.simpleMessage("Select Location"),
        "pickerTitleDate": MessageLookupByLibrary.simpleMessage("Select Date"),
        "pickerTitleLanguages":
            MessageLookupByLibrary.simpleMessage("Select Language"),
        "profileListAppointments":
            MessageLookupByLibrary.simpleMessage("My appointments"),
        "profileListEdit": MessageLookupByLibrary.simpleMessage("Edit profile"),
        "profileListFavorites":
            MessageLookupByLibrary.simpleMessage("My favorites"),
        "profileListInvite":
            MessageLookupByLibrary.simpleMessage("Invite friends"),
        "profileListLogout": MessageLookupByLibrary.simpleMessage("Logout"),
        "profileListPaymentCard":
            MessageLookupByLibrary.simpleMessage("Payment card"),
        "profileListReviews":
            MessageLookupByLibrary.simpleMessage("My reviews"),
        "profileListSettings":
            MessageLookupByLibrary.simpleMessage("More settings"),
        "profileListTitleSettings":
            MessageLookupByLibrary.simpleMessage("Settings"),
        "profileListVouchers":
            MessageLookupByLibrary.simpleMessage("My vouchers"),
        "reviewCommentPlaceholder":
            MessageLookupByLibrary.simpleMessage("Write your review here..."),
        "reviewLabelComment":
            MessageLookupByLibrary.simpleMessage("Your Comment (optional)"),
        "reviewLabelRate":
            MessageLookupByLibrary.simpleMessage("What\'s Your Rate?"),
        "reviewLengthLimit": m31,
        "reviewSubmitBtn":
            MessageLookupByLibrary.simpleMessage("Submit Review"),
        "reviewSuccessSubtitle": MessageLookupByLibrary.simpleMessage(
            "Your feedback has been received and will appear immediately."),
        "reviewSuccessTitle": MessageLookupByLibrary.simpleMessage("Thank you"),
        "reviewTitle":
            MessageLookupByLibrary.simpleMessage("Rate Your Experience"),
        "reviewWarning": MessageLookupByLibrary.simpleMessage(
            "Please rate this salon by clicking on the number of stars you want to assign."),
        "reviewsTitle": MessageLookupByLibrary.simpleMessage("My Reviews"),
        "searchBtnGroupAny": MessageLookupByLibrary.simpleMessage("Any"),
        "searchBtnGroupCurrentlyOpen":
            MessageLookupByLibrary.simpleMessage("Currently Open"),
        "searchDrawerDistanceRange": m32,
        "searchLabelAll": MessageLookupByLibrary.simpleMessage("All"),
        "searchLabelNearby": MessageLookupByLibrary.simpleMessage("Nearby"),
        "searchLabelQuickSearch":
            MessageLookupByLibrary.simpleMessage("What are you looking for?"),
        "searchLabelRatingFilter": m33,
        "searchPlaceholderQuickSearchCities":
            MessageLookupByLibrary.simpleMessage("City name..."),
        "searchPlaceholderQuickSearchLocations":
            MessageLookupByLibrary.simpleMessage("Venue name..."),
        "searchTitleDistance": MessageLookupByLibrary.simpleMessage("Distance"),
        "searchTitleFilter": MessageLookupByLibrary.simpleMessage("Filter"),
        "searchTitleLocationServiceDisabled":
            MessageLookupByLibrary.simpleMessage("Location service disabled"),
        "searchTitleNoResults":
            MessageLookupByLibrary.simpleMessage("No results"),
        "searchTitlePrice": MessageLookupByLibrary.simpleMessage("Price"),
        "searchTitleRating": MessageLookupByLibrary.simpleMessage("Rating"),
        "searchTitleRecentSearches":
            MessageLookupByLibrary.simpleMessage("Recent searches"),
        "searchTitleResults": m34,
        "searchTitleSortOrder":
            MessageLookupByLibrary.simpleMessage("Sort order"),
        "searchTitleWorkingHours":
            MessageLookupByLibrary.simpleMessage("Working hours"),
        "searchTooltipBack": MessageLookupByLibrary.simpleMessage("Back"),
        "searchTooltipFilters": MessageLookupByLibrary.simpleMessage("Filters"),
        "searchTooltipMap": MessageLookupByLibrary.simpleMessage("Map"),
        "searchTooltipView": MessageLookupByLibrary.simpleMessage("View"),
        "settingsCopyright":
            MessageLookupByLibrary.simpleMessage("© 2020 Zoran Juric"),
        "settingsHomepageConfirmation": MessageLookupByLibrary.simpleMessage(
            "Want to visit the template homepage?"),
        "settingsListDarkMode":
            MessageLookupByLibrary.simpleMessage("Dark mode"),
        "settingsListLanguage":
            MessageLookupByLibrary.simpleMessage("Language"),
        "settingsListPrivacy":
            MessageLookupByLibrary.simpleMessage("Privacy policy"),
        "settingsListTerms":
            MessageLookupByLibrary.simpleMessage("Terms of usage"),
        "settingsListTitleInterface":
            MessageLookupByLibrary.simpleMessage("Interface"),
        "settingsListTitleSupport":
            MessageLookupByLibrary.simpleMessage("Support"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "signInButtonForgot":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "signInButtonLogin": MessageLookupByLibrary.simpleMessage("Login"),
        "signInButtonRegister":
            MessageLookupByLibrary.simpleMessage("Sign up now"),
        "signInFormTitle": MessageLookupByLibrary.simpleMessage("Welcome back"),
        "signInHintEmail":
            MessageLookupByLibrary.simpleMessage("Your email address"),
        "signInHintPassword":
            MessageLookupByLibrary.simpleMessage("Your password"),
        "signInRegisterLabel":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account yet?"),
        "signInTitle": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signUpBtnSend": MessageLookupByLibrary.simpleMessage("Sign up"),
        "signUpErrorConsent": MessageLookupByLibrary.simpleMessage(
            "You must accept the Terms and Conditions of Service to continue."),
        "signUpHelptextPassword": m35,
        "signUpHintFullName":
            MessageLookupByLibrary.simpleMessage("Your full name"),
        "signUpHintLabelPassword":
            MessageLookupByLibrary.simpleMessage("Create a password"),
        "signUpLabelConsent": MessageLookupByLibrary.simpleMessage(
            "I have read and agree with the User Terms of Service and I understand that my personal data will be processed in accordance with Privacy Statement."),
        "signUpLabelFullName":
            MessageLookupByLibrary.simpleMessage("Full name"),
        "signUpLabelPassword": MessageLookupByLibrary.simpleMessage("Password"),
        "signUpReadMore":
            MessageLookupByLibrary.simpleMessage("View the legal documents"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Create an account"),
        "signupHintLabelEmail":
            MessageLookupByLibrary.simpleMessage("Your email address"),
        "signupLabelEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "takePictureTitle":
            MessageLookupByLibrary.simpleMessage("Take a picture"),
        "voucherLabelCouponCode":
            MessageLookupByLibrary.simpleMessage("Coupon Code"),
        "voucherLabelSpecialTerms": MessageLookupByLibrary.simpleMessage(
            "Special Terms And Conditions"),
        "vouchersDueDateActive": m36,
        "vouchersDueDateExpired": m37,
        "vouchersDueDateRedeemed": m38,
        "vouchersHeroNoteActive":
            MessageLookupByLibrary.simpleMessage("No available coupon found."),
        "vouchersHeroNoteExpired":
            MessageLookupByLibrary.simpleMessage("No coupon expired so far."),
        "vouchersHeroNoteRedeemed": MessageLookupByLibrary.simpleMessage(
            "You have not used any of your coupons so far."),
        "vouchersInfo": MessageLookupByLibrary.simpleMessage(
            "Here you can see a list of your coupons that you can use the next time you visit a particular location. When paying the bill for a certain service, the final amount will be reduced by the amount indicated on the coupon."),
        "vouchersLabelOff":
            MessageLookupByLibrary.simpleMessage("off the final price"),
        "vouchersTabActive": MessageLookupByLibrary.simpleMessage("Active"),
        "vouchersTabExpired": MessageLookupByLibrary.simpleMessage("Expired"),
        "vouchersTabRedeemed": MessageLookupByLibrary.simpleMessage("Redeemed"),
        "vouchersTitle": MessageLookupByLibrary.simpleMessage("My vouchers"),
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
