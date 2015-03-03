
window.M = window.M || {};
M.dispatcher = _.clone(Backbone.Events);
M.Utils = {};
M.Utils.greetings = [
  'నమస్కారం',
  'bonjour',
  'servus',
  'kia ora',
  'namoshkar',
  'bok',
  'shalom',
  'hej',
  'hola',
  'aloha',
  'hallo',
  'kaixo',
  'ciao',
  'olà',
  'namaste',
  'salaam',
  'pryvit',
  'ohayo',
  'konnichiwa',
  'konban wa',
  'labas',
  'merhaba',
  'fáilte',
  'sain bainuu',
  'sannu',
  'szia',
  'salama aleikum',
  'jambo',
  'tere',
  'habari',
  'bangawoyo',
  'halo'
];

M.IconMap = {
  "tv_video": "video-camera",
  "health_fitness": "heartbeat",
  "bank": "money",
  "food_drinks": "cutlery",
  "home_rent": "home",
  "car": "car",
  "insurance": "umbrella",
  "phone": "phone",
  "medical": "user-md",
  "internet": "globe",
  "electric_utility": "lightbulb-o",
  "gas": "fire",
  "water": "tint",
  "trash": "trash-o",
  "computer": "laptop",
  "baby_childcare": "child",
  "gym_sports": "futbol-o",
  "subscription": "newspaper-o",
  "education_loans": "graduation-cap",
  "furniture": "house", // TODO: change this to something better
  "appliance": "desktop", // TODO: change this to something better
  "landscaping_lawn": "tree", // TODO: change this to something better
  "security_alarm": "user-secret", // TODO: change this to something better
  "donations": "gift",
  "legal": "gavel",
  "business_travel": "suitcase",
  "mail_post_office_box": "envelope", // TODO: change this to something better
  "locker_deposit_box": "key", // TODO: change this to something better
  "shopping": "shopping-cart",
  "ticket": "ticket",
  "taxes_general": "file-text"
};

// TODO: Add analytics here
