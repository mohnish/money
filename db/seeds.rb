### start system setup

categories = Category.create([
  {
    name: 'tv',
    label: 'TV'
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
  }
])

repeat_intervals = RepeatInterval.create([
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
  category: categories.second # health_fitness
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