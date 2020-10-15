# README

# Tracker

## Overview

Issue tracking service that specializes in tracking issues and bugs for the software projects. You can state issues and feature request.

### concept

Issue Tracking System

### version

Ruby 2.6.5 Rails 5.2.4.4

## Catalog design

<https://docs.google.com/spreadsheets/d/1kYtQSW86ZoTOPtnzgrpwVtif05IgUs5wtGHZEzym81c/edit?usp=sharing>

## List of Functions

- [x] Login function
- [x] User registration function
  - [x] Username, email address and password required
- [x] Project list display function
  - [x] Show the number of issues
  - [x] Show the number of members
- [x] Project creating function
  - [x] Project name and description required
- [x] Project member invitation function
- [x] Roll setting function for project
  - [x] Project leader, developer, tester and user can be set for roll
- [x] Project editing function
- [x] Project deletion function
  - [x] Project editing and project deletion can only be performed by the project leader
- [x] Issues list display function
  - [x] Show the name of the associated project
- [x] Issue posting function
  - [x] Issue summary, detail, type, priority, assigned person, status, due date required
  - [x] Bug, Error, Fatal Error, Feature request and other can be specified for type
  - [x] Low, Medium, High, Urgent can be set for priority
  - [x] Developers can be assigned for assigned person
  - [x] If the issue submitted person can't decide who to assign, project leader should be assigned.
  - [x] Assigned, Doing, Done can be set for status
  - [x] Screenshot can be attached if its available
- [x] Issue sorting function
  - [x] Issues can be sorted by type, priority, status and due date
- [x] Issue searching function
  - [x] Search issues by issue summary and type
- [x] Issue editing function (mainly for status)
- [x] Issue closing function (if the issue is fixed)
  - [x] Issue closing function can only be performed by issue submitted person
- [ ] Comment posting function
  - [ ] Comment for the associated issue
- [ ] Comment editing function
- [ ] Comment deletion function
  - [ ] Comment editing and comment deletion are possible only for the commenter

## table definition

<https://docs.google.com/spreadsheets/d/1yKBvVd0GN0hXSI-C5FysfnV0SlsgnLsgZ5AgR9gpWio/edit?usp=sharing>

## ER diagram

<https://cacoo.com/diagrams/rAInc2YpjcxUv0zR/8FA33>

## Screen transition diagram

<https://cacoo.com/diagrams/KCjIDXcE6zrYJjpX/0F835>

## Screen wireframe

<https://docs.google.com/spreadsheets/d/120WjoAzYBot3WZPvVZT8XO8GqSWWyywEzFWI-CQfKBI/edit?usp=sharing>

## Use predetermined gem

- hirb
- devise
- carrierwave
- mini_magick
- rspec
- will_paginate
- bootstrap-will_paginate
