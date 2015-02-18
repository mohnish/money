### start system setup

categories = Category.create([
  {
    name: 'tv_video',
    label: 'TV & Video'
  },
  {
    name: 'health_fitness',
    label: 'Health & Fitness'
  },
  {
    name: 'bank',
    label: 'Bank'
  },
  {
    name: 'food_drinks',
    label: 'Food & Drinks'
  },
  {
    name: 'home_rent',
    label: 'Mortgage, Rent & Home'
  },
  {
    name: 'car',
    label: 'Car'
  },
  {
    name: 'insurance',
    label: 'Insurance'
  },
  {
    name: 'phone',
    label: 'Phone'
  },
  {
    name: 'medical',
    label: 'Medical'
  },
  {
    name: 'internet',
    label: 'Internet'
  },
  {
    name: 'electric_utility',
    label: 'Electric & Utility'
  },
  {
    name: 'gas',
    label: 'Gas'
  },
  {
    name: 'water',
    label: 'Water'
  },
  {
    name: 'trash',
    label: 'Trash'
  },
  {
    name: 'computer',
    label: 'Computer'
  },
  {
    name: 'baby_childcare',
    label: 'Baby & Childcare'
  },
  {
    name: 'gym_sports',
    label: 'Gym & Sports'
  },
  {
    name: 'subscription',
    label: 'Subscription'
  },
  {
    name: 'education_loans',
    label: 'School & Education'
  },
  {
    name: 'furniture',
    label: 'Furniture'
  },
  {
    name: 'appliance',
    label: 'Appliance'
  },
  {
    name: 'landscaping_lawn',
    label: 'Landscaping & Lawn'
  },
  {
    name: 'security_alarm',
    label: 'Security & Alarm'
  },
  {
    name: 'donations',
    label: 'Donations'
  },
  {
    name: 'legal',
    label: 'Legal'
  },
  {
    name: 'business_travel',
    label: 'Business & Travel'
  },
  {
    name: 'mail_post_office_box',
    label: 'Mail & Post Office Box'
  },
  {
    name: 'locker_deposit_box',
    label: 'Locker & Deposit Box'
  },
  {
    name: 'shopping',
    label: 'Shopping'
  },
  {
    name: 'ticket',
    label: 'Ticket'
  },
  {
    name: 'taxes_general',
    label: 'Taxes & General'
  }
])

repeat_intervals = RepeatInterval.create([
  {
    years: 0,
    months: 0,
    weeks: 0,
    days: 0,
    interval: 'one_time',
    label: 'Never'
  },
  {
    years: 0,
    months: 1,
    weeks: 0,
    days: 0,
    interval: '1_month',
    label: 'Monthly'
  },
  {
    years: 1,
    months: 0,
    weeks: 0,
    days: 0,
    interval: '1_year',
    label: 'Yearly'
  },
  {
    years: 0,
    months: 0,
    weeks: 1,
    days: 0,
    interval: '1_week',
    label: 'Weekly'
  },
  {
    years: 0,
    months: 0,
    weeks: 2,
    days: 0,
    interval: '2_week',
    label: 'Bimonthly'
  },
  {
    years: 0,
    months: 0,
    weeks: 0,
    days: 1,
    interval: '1_day',
    label: 'Daily'
  }
])

### end system setup

### start user data setup
user = User.create({
  first_name: 'James',
  last_name: 'Bond',
  email_address: 'jamesbond@example.com',
  username: 'bond',
  avatar: 'http://i.imgur.com/4fWZN.jpg',
  phone_number: '9809809801',
  password: 'test1234'
})

payment_sources = user.payment_sources.create([
  {
    name: 'Secret Service Credit Card',
    type: 'CreditCard'
  },
  {
    name: 'Secret Service Debit Card',
    type: 'DebitCard'
  },
  {
    name: 'Secret Service Super Credit Card',
    type: 'CreditCard'
  }
])

netflix_bill = user.bills.create({
  name: 'Netflix',
  next_due_date: 5.days.since,
  amount: 9.99,
  repeat_interval: repeat_intervals.first, # monthly
  category: categories.first # tv
})

netflix_bill_tags = netflix_bill.tags.create([
  { name: 'tv' }, { name: 'entertainment' }, { name: 'online' }
])

payments = netflix_bill.payments.create([
  {
    amount: 9.99,
    payment_source: payment_sources.first
  },
  {
    amount: 9.99,
    payment_source: payment_sources.last
  }
])

gym_bill = user.bills.create({
  name: '24 Hour Fitness',
  next_due_date: 15.days.since,
  amount: 49.99,
  repeat_interval: repeat_intervals.first, # monthly
  category: categories.select {|cat| cat.name == 'gym_sports'}.first
})

gym_bill_tags = gym_bill.tags.create([
  { name: 'gym' }, { name: 'health' }, { name: 'personal-training' }
])

gym_bill.payments.create([
  {
    amount: 49.99,
    payment_source: payment_sources.last
  },
  {
    amount: 49.99,
    payment_source: payment_sources.second
  }
])


### end user data setup