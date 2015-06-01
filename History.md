
1.8.0 / 2015-05-31
==================

  * update ruby on travis
  * update ruby to 2.2.2
  * use a single rake call
  * fix broken bill form
  * refactor formatDate
  * handle bad timestamps while creating bills
  * clean up the display
  * profile pics support (gravatar)
  * add gravatar profile pics

1.7.6 / 2015-03-22
==================

  * upgrade rails to 4.2.1
  * add api docs to the wiki and link it to the readme later
  * sort the bills in a smarter way. closes #56
  * fix toggling text for the creation forms
  * update readme
  * add stronger presence check
  * refactor code around the bills controller. fix issue with creating blank tags. closes #62
  * remove due on text
  * release

1.7.5 / 2015-03-11
==================

  * reduce content on bills page
  * refactor code in bills controller

1.7.2 / 2015-02-09
==================

  * fixes an issue while creating bills when there's no card on file

1.7.1 / 2015-02-06
==================

  * fix amount display bug
  * add ruby installation docs

1.7.0 / 2015-02-05
==================

  * :tada: edit bills
  * :tada: edit cards

1.6.2 / 2015-02-04
==================

  * reset forms after successful submission

1.6.1 / 2015-02-04
==================

  * fix bug where upon creation of payments, the bill's next due date was getting updated from the date when the payment was made instead of the current due date

1.6.0 / 2015-02-04
==================

  * upgrade to ruby 2.2.1
  * close the bill creation and payments form by default. allows display of more bills and payments on the respective pages
  * UX enhancements on the bills page
  * bug fixes on the bills page
  * creating a one time bill shows the option to select the payment source. this will automatically create a corresponding payment and marks the bill as inactive. ability to update the bill would be part of a future release
  * sort bills by the next due date
  * sort payments by the payment date
  * UX fixes all over the app
  * :tada: :tada:  special thanks to @sindhunaydu and @appikonda for pointing out issues :tada: :tada:

1.5.1 / 2015-01-28
==================

  * :tada: add styling to all the pages :dart:

1.5.0 / 2015-01-28
==================

  * first design related release. this release has no functionality changes. it's only ui changes. :tada:

1.4.1 / 2015-01-24
==================

  * add validations for the numericality of amount

1.4.0 / 2015-01-24
==================

  * :tada: implement payments
  * improve frontend payment/bill handling
  * refactor/dry code on the backend
  * fix broken specs

1.3.0 / 2015-01-22
==================

  * :tada: add cards
  * :beetle: bug fixes
  * :arrow_up: refactored code
  * :arrow_up: performance enhancements
  * :arrow_up: improve navigation and UI inconsistencies

1.2.0 / 2015-01-21
==================

  * improve performance
  * fix bugs w/ nagivation

1.1.0 / 2015-01-20
==================

  * add new relic
  * fix links
  * robust error handling on the API
  * downcase username and compare against downcased value for lookup
  * DRY up the bills responses
  * upgrade underscore to 1.8.1

1.0.0 / 2015-01-18
==================

  :tada: :tada: :tada: :tada: :tada: :tada: :tada: :tada: :tada: :tada:
  * this is super barebones
  * barely usable
  * move fast & break things, i guess

0.2.0 / 2015-01-18
==================

  * create bills

0.1.0 / 2014-05-16
==================

0.0.1 / 2014-05-01
==================
