// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ExpenseView = function(el) {
  if (!el) throw new Error('Missing el');
  if (!(this instanceof ExpenseView)) return new ExpenseView(el);
  this.el = $(el);
};

ExpenseView.prototype.displayForm = function(e) {
  // grab html from script/template
  // populate form with the current data
  // append it to the parent element
  // return this
};

ExpenseView.prototype.hideForm = function(e) {
  // remove the form from the DOM
  // return this
};

ExpenseView.prototype.populateForm = function(e) {
  // grab values from the dataset
  // update the form
  // return this
};

ExpenseView.prototype.hideAddForm = function(e) {
  // hide add form
  // return this
};

ExpenseView.prototype.displayAddForm = function(e) {
  // unhide add form
  // return this
};

ExpenseView.prototype.getAuthenticationToken = function() {
  // return authToken
};

ExpenseView.prototype.updateExpense = function(e) {
  // prepare params (serialize maybe?)
  // make ajax call and have success/failure callbacks
};

ExpenseView.prototype.handleSuccess = function(data) {
  // grab data and whatever
};

ExpenseView.prototype.handleFailure = function(error) {
  // FIXME: check the params and grab the error and do whatever
};

// $(function() {
//   var displayUpdateForm = function(e) {
//     var data = this.dataset;
//     var $form = $('#expense-form').clone();
//     $form.attr({ id: 'expense-edit-form', 'method': 'patch', 'action': '/expenses/' + data.id + ''});
//     $(this).parent('div').append($form);
//   };

//   $('.edit-expense').on('click', displayUpdateForm);
// });
