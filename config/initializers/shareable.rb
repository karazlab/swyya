require 'will_paginate/array'

ROLES = {
  user:       'user',
  superadmin: 'superadmin'
}.freeze

STATUS = {
  active:   1,
  inactive: 2
}.freeze

NEWEST_PROJECTS_LIMIT = 12
MOST_LIKED_PROJECTS_LIMIT = 6

PROJECTS_PER_PAGE_VISITOR = 12
PROJECTS_PER_PAGE_USER = 24

IDEAS_PER_PAGE_VISITOR = 12
IDEAS_PER_PAGE_USER = 24

NEWEST_IDEAS_LIMIT = 12
MOST_LIKED_IDEAS_LIMIT = 6

SEARCH_RESULTS = 20