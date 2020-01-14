require 'will_paginate/array'
ActsAsTaggableOn.force_lowercase = true

ROLES = {
  user:       'user',
  superadmin: 'superadmin'
}.freeze

STATUS = {
  active:   1,
  inactive: 2
}.freeze

NEWEST_PROJECTS_LIMIT = 25
MOST_LIKED_PROJECTS_LIMIT = 6

PROJECTS_PER_PAGE_VISITOR = 12
PROJECTS_PER_PAGE_USER = 24

IDEAS_PER_PAGE_VISITOR = 12
IDEAS_PER_PAGE_USER = 24

NEWEST_IDEAS_LIMIT = 12
MOST_LIKED_IDEAS_LIMIT = 6

SEARCH_RESULTS = 20

TAGS_LIMIT = 35
TAGS_COLORS = %w[success primary danger warning info secondary light]

SOCIAL = {
  github:   'https://www.github.com/karazlab/swyya',
  facebook: 'https://www.facebook.com/swyyacom',
  twitter:  '#',
  globe:    '#',
  'product-hunt': 'https://www.producthunt.com/posts/swyya'
}.freeze

DEFAULT_KEYWORDS = ['latest open source', 'best open source projects', 'open source', 'open-source', 'open source projects', 'open source development', 'open source code', 'open source community', 'free source code', 'free open source']
DEFAULT_TITLE    = 'A community for sharing curated list of open source projects to contribute'

TRENDING_LINK  = 'https://github-trending-api.now.sh/repositories?since=daily'
TRENDING_LIMIT = 12
