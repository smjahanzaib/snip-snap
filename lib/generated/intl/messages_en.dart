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
        "vouchersTitle": MessageLookupByLibrary.simpleMessage("My vouchers")
      };
}
