
M.EditPaymentSourceView = M.BaseView.extend({
  templatePath: 'payment_sources/edit',

  events: {
    'click .cancel-edit-payment-source': 'cancelEditPaymentSource',
    'submit #edit-payment-source-form': 'handleSubmit'
  },

  initialize: function() {
    this.render();
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  },

  handleSubmit: function(e) {
    e.preventDefault();
    var props = this.createAttributesObject(this.$('#edit-payment-source-form').serializeArray());
    this.model.save(props);
  },

  cancelEditPaymentSource: function(e) {
    this.trigger('m:render:payment_sources');
  }
});
