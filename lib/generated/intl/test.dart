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
  "localeName => 'en';

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
        "homeTitleGuest": MessageLookupByLibrary.simpleMessage("Bilal"),
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
        
  "lblSignIn": "Sign In",

  
  "lblEmail": "Email",

  
  "lblPassword": "Password",

  
  "lblRememberMe": "Remember me",

  
  "lblForgotPassword": "Forgot password",

  
  "btnSignIn": "Sign In",

  
  "btnSignUp": "SIGN UP",

  
  "txt_if_you_have_no_account": "if you have no an account? ",

  
  "txt_beautiyon_expert_app": "Beautyon Expert App",

  
  "hnt_email": "demo@gmail.com",

  
  "hnt_password": "demo1234",

  
  "lbl_back": "Back",

  
  "lbl_sign_up": "Sign Up",

  
  "lbl_confirm_password": "Confirm Password",

  
  "txt_i_accept_the": "I accept the ",

  
  "txt_privacy_and_policy": "privacy and policy",

  
  "btn_next": "NEXT",

  
  "txt_already_have_an_account": "Already have an account? ",

  
  "txt_please_enter_email": "Please enter Email",

  
  "txt_password_should_be_of_minimum_2_characters": "Password should be of minimun 2 characters",

  
  "txt_password_do_not_match": "Passwords do not match",

  
  "txt_please_accept_privacy_and_policy": "Please accept privacy and policy to complete your registration",

  
  "txt_please_enter_valid_email": "Please enter valid email",

  
  "lbl_generall_information": "General Information",

  
  "lbl_parlour_name": "Parlour Name",

  
  "hnt_parlour_name": "Beauty Life Parlour",

  
  "lbl_owner_name": "Owner Name",

  
  "hnt_owner_name": "Jesika Merry",

  
  "lbl_phone_number": "Phone Number",

  
  "hnt_phone_number": "9898989898",

  
  "lbl_address": "Address",

  
  "hnt_address": "58 Street -al dulha london -USA",

  
  "lbl_saloon_type": "Saloon Type",

  
  "lbl_male": "Male",

  
  "lbl_female": "Female",

  
  "lbl_unisex": "unisex",

  
  "lbl_description": "Description",

  
  "hnt_description": "This is a description",

  
  "lbl_upload_image": "Upload Photo",

  
  "btn_create_account": "CREATE ACCOUNT",

  
  "lbl_action": "Actions",

  
  "lbl_take_picture": "Take picture",

  
  "lbl_choose_from_library": "Choose from library",

  
  "lbl_cancel": "Cancel",

  
  "txt_please_enter_parlour_name": "Please enter Parlour Name",

  
  "txt_please_enter_phone_number": "Please enter Phone Number",

  
  "txt_please_enter_valid_phone_number": "Please enter valid Phone Number",

  
  "txt_please_enter_owner_name": "Please enter Owner Name",

  
  "txt_please_enter_address": "Please enter Address",

  
  "txt_please_enter_description": "Please enter Description",

  
  "txt_please_select_image": "Please select Image",

  
  "btn_update_profile": "UPDATE PROFILE",

  
  "lbl_about": "About",

  
  "lbl_opening_hours": "Opening Hours",

  
  "txt_profile_will_be_shown_here": "Profile will be shown here",

  
  "lbl_user_request": "User Request",

  
  "lbl_amount": "Amount",

  
  "txt_user_request_will_be_shown_here": "User Request will be shown here",

  
  "lbl_complete_request": "Complete Request",

  
  "txt_confirmation_message_for_complete_request": "Are you sure you want to Complete this Request ?",

  
  "lbl_no": "NO",

  
  "lbl_yes": "YES",

  
  "lbl_cancel_request": "Cancel Request",

  
  "txt_confirmation_message_for_cancel_request": "Are you sure you want to Cancel this Request ?",

  
  "lbl_appointment_history": "Appointment History",

  
  "txt_appointment_history_will_be_shown_here": "Appointment History will be shown here",

  
  "lbl_weekly_earn": "WEEKLY EARN",

  
  "txt_weekly_earn_will_shown_here": "Weekly earning will be shown here",

  
  "lbl_total": "Total",

  
  "lbl_services": "Services",

  
  "lbl_pending": "Pending",

  
  "lbl_completed": "Completed",

  
  "lbl_complete_our_goals": "Complete Our Goals",

  
  "lbl_experts": "Experts",

  
  "lbl_delete": "Delete",

  
  "lbl_edit": "Edit",

  
  "txt_expert_will_shown_here": "Expert List will be shown here",

  
  "btn_add_new_expert": "ADD NEW BEAUTY EXPERT + ",

  
  "lbl_delete_expert": "Delete Expert",

  
  "txt_confirmation_message_for_delete_expert": "Are you sure you want to delete this Expert ?",

  
  "lbl_coupons": "Coupons",

  
  "txt_coupon_list_will_shown_here": "Coupon List will be shown here",

  
  "btn_add_new_coupon": "ADD NEW COUPON +",

  
  "lbl_delete_coupon": "Delete Coupon",

  
  "txt_confirmation_message_for_delete_Coupon": "Are you sure you want to delete this Coupon ?",

  
  "lbl_add_service_variant": "Add Service Variant",

  
  "txt_service_will_shown_here": "Service List will be shown here",

  
  "btn_add_new_service": "ADD NEW SERVICE +",

  
  "lbl_delete_service": "Delete Service",

  
  "txt_confirmation_message_for_delete_service": "Are you sure you want to delete this Service ?",

  
  "lbl_delete_service_variant": "Delete Service Variant",

  
  "txt_confirmation_message_for_delete_service_variant": "Are you sure you want to delete this Service Variant ?",

  
  "lbl_min": "min",

  
  "btn_save_service": "SAVE SERVICE +",

  
  "lbl_edit_service": "Edit Service",

  
  "lbl_Add_service": "Add Service",

  
  "lbl_service_name": "Service Name",

  
  "hnt_service_name": "Spa, Facial, Makeup",

  
  "lbl_tap_to_add_image": "Tap to add image",

  
  "txt_please_enter_name": "Please enter name",

  
  "btn_save_service_variant": "SAVE SERVICE VERIANT +",

  
  "lbl_variant": "Variant",

  
  "lbl_price": "Price",

  
  "hnt_price": "100",

  
  "lbl_time": "Time",

  
  "hnt_time": "Enter Minute",

  
  "txt_please_enter_price": "Please enter price",

  
  "txt_please_enter_time": "Please enter time",

  
  "btn_save_expert": "SAVE  EXPERT + ",

  
  "lbl_edit_expert": "Edit Beauty Expert",

  
  "lbl_add_Expert": "Add Beauty Expert",

  
  "lbl_expert_name": "Expert Name",

  
  "hnt_expert_name": "Jesika Merry",

  
  "txt_something_went_wrong": "Something went Wrong!Try again later",

  
  "btn_save_coupon": "SAVE COUPON +",

  
  "lbl_Add_coupon": "Add Coupon",

  
  "lbl_coupon_name": "Coupon Name",

  
  "hnt_coupon_name": "Beauty coupon",

  
  "lbl_coupon_number": "Coupon Number",

  
  "hnt_coupon_number": "Beauty89",

  
  "lbl_coupon_description": "Coupon Desciption",

  
  "lbl_select_coupon_type": "Select Coupon Type",

  
  "lbl_percentage": "Percentage",

  
  "hnt_coupon_type": "Select Coupon Type",

  
  "lbl_offer_price": "Offer Price/Percentage",

  
  "hnt_offer_price": "100",

  
  "lbl_min_service_amount": "Min Service Amount",

  
  "hnt_min_service_amount": "250",

  
  "lbl_select_usesRestriction": "Select Uses-restriction",

  
  "hnt_usesRestriction": "Uses-Restriction",

  
  "lbl_select_start_date": "Select Start Date",

  
  "hnt_select_start_date": "Start Date",

  
  "lbl_select__end_date": "Select End Date",

  
  "hnt_select_end_date": "End Date",

  
  "txt_please_enter_offer_price": "Please enter offer price",

  
  "txt_pleae_enter_min_service_price": "Please enter min service price",

  
  "txt_please_enter_coupon_number": "Please enter coupon number",

  
  "txt_please_enter_usesRestriction": "Please enter user restriction",

  
  "txt_please_select_coupon_type": "Please select coupon type",

  
  "txt_please_select_start_date": "Please select start date",

  
  "txt_please_select_end_date": "Please select end date",

  
  "lbl_gallery": "Gallery",

  
  "txt_gallery_will_shown_here": "Gallery List will be shown here",

  
  "btn_add_new_gallery": "ADD NEW GALLERY +",

  
  "lbl_delete_gallery": "Delete Gallery",

  
  "txt_confirmation_message_for_delete_gallery": "Are you sure you want to delete this Gallery ?",

  
  "lbl_products": "Products",

  
  "txt_products_will_shown_here": "Product List will be shown here",

  
  "btn_add_new_product": "ADD NEW PRODUCT+ ",

  
  "lbl_delete_product": "Delete Product",

  
  "txt_confirmation_message_for_delete_product": "Are you sure you want to delete this Product ?",

  
  "btn_save_gallery": "SAVE GALLERY +",

  
  "lbl_Add_gallery": "Add Gallery",

  
  "btn_save_product": "SAVE  PRODUCT + ",

  
  "lbl_edit_product": "Edit Product",

  
  "lbl_add_product": "Add Product",

  
  "lbl_product_name": "Product Name",

  
  "hnt_product_name": "shampoo",

  
  "lbl_quantity": "Quantity",

  
  "hnt_quantity": "100L",

  
  "txt_please_enter_quantity": "Please enter quantity",

  
  "lbl_beautyon": "Beautyon",

  
  "lbl_loading": "Loading...",

  
  "lbl_orders": "Orders",

  
  "lbl_qty": "Qty",

  
  "txt_orders_will_shown_here": "Orders will be shown here",

  
  "lbl_confirm_order": "Confirm Order",

  
  "txt_confirmation_message_for_confirm_order": "Are you sure you want to Confirm this Order ?",

  
  "btn_save_setting": "SAVE SETTINGS",

  
  "lbl_settings": "Settings",

  
  "lbl_shop_open": "Shop Open",

  
  "lbl_help_and_support": "Help & Support ",

  
  "lbl_faq": "FAQ",

  
  "txt_faq_will_shown_here": "Faqs will be shown here",

  
  "lbl_change_password": "Change Password",

  
  "lbl_old_password": "Old Password",

  
  "lbl_new_password": "New Password",

  
  "btn_change_password": "CHANGE PASSWORD",

  
  "txt_password_and_confirm_password_do_not_match": "password and confirm password do not match",

  
  "txt_please_enter_old_password": "Please enter old password",

  
  "txt_please_enter_new_password": "Please enter new password",

  
  "lbl_my_wallet": "My Wallet",

  
  "lbl_total_earning": "Total Earnings",

  
  "lbl_paid_to_app": "Paid to App",

  
  "lbl_payment_pending_from_app": "Payment Pending from App",

  
  "lbl_paid_by_app": "Paid by App",

  
  "lbl_pending_to_give_app": "Pending to give App",

  
  "btn_mask_as_paid": "MARK AS PAID ",

  
  "txt_nothing_yet_to_see_here": "Nothing yet to see here",

  
  "lbl_confirm_dialog": "Confirm Dialog",

  
  "txt_confirmation_message_for_paid_to_admin": "Are you sure you want to paid this to admin",

  
  "lbl_notification": "Notifications",

  
  "txt_notification_will_shown_here": "Notifications will be shown here",

  
  "lbl_accept": "Accept",

  
  "lbl_ok": "OK",

  
  "lbl_date_and_time": "Date & Time",

  
  "lbl_date": "Date",

  
  "lbl_service": "Service",

  
  "lbl_subTotal": "SubTotal",

  
  "lbl_discount_by_coupon": "Discount by coupon",

  
  "lbl_service_summary": "Service Summary",

  
  "btn_confirm": "CONFIRM",

  
  "lbl_confirm_service": "Confirm Service",

  
  "txt_confirmation_message_for_confirm_service": "Are you sure you want to Confirm this Service ?",

  
  "lbl_update_profile": "Update Profile",

  
  "txt_easy_to_find_customer": "Easy to Find Customer",

  
  "txt_easy_to_find_customer_detail_text": "Many desktop publishing packages and web page editors now use Lorem Ipsum as .",

  
  "txt_branding_for_your_parlour": "Branding For Your Parlour",

  
  "txt_branding_for_your_parlour_detail_text": "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words",

  
  "txt_get_customer_feedback": "Get Customer Feedback",

  
  "txt_get_customer_feedback_detail_text": "to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",

  
  "btn_get_started": "GET STARTED",

  
  "lbl_forgot_password": "Forgot Password",

  
  "btn_send_code": "SEND CODE",

  
  "btn_submit": "SUBMIT",

  
  "lbl_verify_otp": "Verify Otp",

  
  "txt_enter_the_verification_code_from": "Enter the Verification code from ",

  
  "txt_the_phone_we_just_sent_you": "the phone we just sent you ",

  
  "txt_check_your_mail_for_otp": "Check your mail for opt",

  
  "txt_please_enter_otp": "Please enter Otp",

  
  "txt_successfully_add": "Successfully add",

  
  "txt_your_new_expert": "your new expert",

  
  "txt_your_new_coupon": "your new coupon",

  
  "txt_successfully_changed_your_password": "Successfully changed your password",

  
  "txt_your_new_product": "your new product",

  
  "txt_your_new_service": "your new service",

  
  "txt_successfully_save": "Successfully save",

  
  "txt_your_setting": "your setting",

  
  "txt_successfully_add_your_new_coupon": "Successfully add your new coupon",

  
  "txt_successfully_add_your_new_expert": "Successfully add your new expert",

  
  "txt_successfully_add_your_new_service": "Successfully add your new service",

  
  "txt_successfully_save_your_setting": "Successfully save your setting",

  
  "txt_succesfully_add_your_new_product": "Successfully add your new product",

  
  "txt_successfully_changed_your_profile": "Successfully changed your profile",

  
  "lbl_selet_language": "Select Language",

  
  "lbl_add_expert": "Add Expert",

  
  "lbl_sign_out": "Sign Out",

  
  "txt_confirmation_message_for_sign_out": "Are you sure you want to Sign Out?",

  
  "lbl_gofresha": "GoFresha",

  
  "txt_total_admin_share_sent_by_vendor": "Total Admin Share sent by Vendor",

  
  "txt_total_admin_share_pending_at_vendor": "Total Admin Share pending at Vendor",

  
  "txt_total_vendor_share_given_by_admin": "Total Vendor Share given by Admin",

  
  "txt_total_vendor_share_pending_at_admin": "Total Vendor Share pending at Admin",

  
  "lbl_reviews": "Reviews",

  
  "lbl_view_all": "View All",
      };
}
