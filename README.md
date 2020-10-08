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

- [ ] Login function
- [ ] User registration function
  - [ ] Username, email address and password required
- [ ] Project list display function
  - [ ] Show the number of issues
  - [ ] Show the number of members
- [ ] Project creating function
  - [ ] Project name and description required
- [ ] Project member invitation function
- [ ] Roll setting function for project
  - [ ] Project leader, developer, tester and user can be set for roll
- [ ] Project editing function
- [ ] Project deletion function
  - [ ] Project editing and project deletion can only be performed by the project leader
- [ ] Issues list display function
  - [ ] Show the name of the associated project
  - [ ] Show the members of that project
- [ ] Issue posting function
  - [ ] Issue summary, detail, type, priority, assigned person, status, due date required
  - [ ] Bug, Error, Fatal Error, Feature request and other can be specified for type
  - [ ] Low, Medium, High, Urgent can be set for priority
  - [ ] Developers can be assigned for assigned person
  - [ ] If the issue submitted person can't decide who to assign, project leader should be assigned.
  - [ ] Assigned, Doing, Done can be set for status
  - [ ] Screenshot can be attached if its available
- [ ] Issue sorting function
  - [ ] Issues can be sorted by type, priority, status and due date
- [ ] Issue searching function
  - [ ] Search issues by issue summary and type
- [ ] Issue editing function (mainly for status)
- [ ] Issue closing function (if the issue is fixed)
  - [ ] Issue closing function can only be performed by issue submitted person
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
- bcrypt
- carrierwave
- mini_magick
- rspec
